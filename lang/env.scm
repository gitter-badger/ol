;
(define-library (lang env)

(export
      lookup env-bind
      empty-env
      apply-env env-fold
      ; todo: move all primops functions to separate library
      verbose-vm-error prim-opcodes primop-of primitive?
      primop-name ;; primop → symbol | primop
      special-bind-primop? variable-input-arity?
      multiple-return-variable-primop? opcode-arity-ok? opcode-arity-ok-2?
      ; opcode->wrapper
      poll-tag name-tag link-tag buffer-tag signal-tag signal-halt thread-quantum meta-tag
      current-library-key
      env-set-macro env-del *special-forms*
      env-get ;; env key default → val | default
      env-del ;; env key → env'
      env-set ;; env-set env key val → env'
      env-keep ;; env (name → name' | #false) → env'
      env-get-raw ;; env key → value      -- temporary
      env-put-raw ;; env key value → env' -- temporary
      env-keys ;; env → (key ...)
      )

   (import
      (r5rs core)
      (owl ff)
      (owl list)
      (owl symbol)
      (owl string)
      (owl render)
      (owl equal)
      (owl list-extra)
      (owl math)
      (owl io)
      (scheme misc)
      (lang vm))

   (begin

      (define empty-env empty) ;; will change with ff impl

      (define env-del del)
      (define poll-tag "mcp/polls")
      (define buffer-tag "mcp/buffs")
      (define link-tag "mcp/links")
      (define signal-tag "mcp/break")
      (define meta-tag '*owl-metadata*) ; key for object metadata
      (define name-tag '*owl-names*)    ; key for reverse function/object → name mapping
      (define current-library-key '*owl-source*) ; toplevel value storing what is being loaded atm

      (define (signal-halt threads state controller)
         (print-to stderr "stopping on signal")
         (halt 42)) ;; exit owl with a specific return value
      (define thread-quantum 10000)

      (define lookup ;; <- to be replaced with env-get
         (let ((undefined (tuple 'undefined)))
            (λ (env key)
               (get env key undefined))))

      ;; get a value from env, or return def if not there or not a value
      (define (env-get env key def)
         (tuple-case (lookup env key)
            ((defined val)
               (tuple-case val
                  ((value v) v)
                  (else def)))
            (else def)))

      (define env-get-raw get) ;; will use different ff
      (define env-put-raw put) ;; will use different ff

      (define (env-set env key val)
         (put env key
            (tuple 'defined
               (tuple 'value val))))

      (define (env-set-macro env key transformer)
         (put env key
            (tuple 'macro transformer)))

      (define-syntax invoke
         (syntax-rules ()
            ((invoke module name arg ...)
               ((env-get module (quote name)
                  (lambda (arg ...)
                     (runtime-error "invoke: failed to invoke "
                        (cons (quote name)
                           (list arg ...)))))
                  arg ...))))

      ;; mark an argument list (possibly improper list of symbols) as bound
      (define env-bind
         (let ((bound (tuple 'bound)))
            (λ (env keys)
               (let loop ((env env) (keys keys))
                  (cond
                     ((null? keys) env)
                     ((pair? keys)
                        (loop (put env (car keys) bound) (cdr keys)))
                     (else ;; improper argument list
                        (put env keys bound)))))))

      ;;;
      ;;; apply-env
      ;;;

      ; this compiler pass maps sexps to sexps where each free
      ; occurence of a variable is replaced by it's value

      ; this is functionally equivalent to making a big
      ; (((lambda (name ..) exp) value)), but the compiler currently
      ; handles values occurring in the sexp itself a bit more efficiently

      (define (ok env exp) (tuple 'ok exp env))
      (define (fail reason) (tuple 'fail reason))

      (define (value-exp val)
         ; represent the literal value val safely as an s-exp
         (if (or (pair? val) (symbol? val))
            (list 'quote val)
            val))

      (define (handle-symbol exp env fail)
         ; (print (list 'handle-symbol exp 'being (lookup env exp)))
         (tuple-case (lookup env exp)
            ((bound) exp)
            ((defined defn)
               (tuple-case defn
                  ((value val)
                     (value-exp val))
                  (else is funny
                     (fail (list "funny defined value: " funny)))))
            ((undefined)
               (fail (list "What is"
                  (bytes->string (foldr render '() (list "'" exp "'?"))))))
            (else is bad
               (fail (list "The symbol" exp "has a funny value: '" bad "'")))))

      (define (formals-cool? call)
         (let ((formals (cadr call)))
            (let loop ((formals formals))
               (cond
                  ((and (pair? formals) (symbol? (car formals)))
                     (loop (cdr formals)))
                  ((symbol? formals) #true)
                  ((null? formals) #true)
                  (else #false)))))

      (define (walker env fail)
         (define (walk exp)
            ; (print (list 'walk exp))
            (cond
               ((null? exp)
                  ; allow null as a self-evaluating form
                  (list 'quote exp))
               ((list? exp)
                  (case (car exp)
                     ((quote) exp)
                     ((lambda)
                        (if (and (= (length exp) 3) (formals-cool? exp))
                           (list 'lambda (cadr exp)
                              ((walker (env-bind env (cadr exp)) fail)
                                 (caddr exp)))
                           (fail (list "funny lambda " exp))))
                     ((ol:let)
                        (if (and (= (length exp) 4) (formals-cool? exp))
                           (let ((walk (walker (env-bind env (cadr exp)) fail)))
                              (list 'ol:let
                                 (cadr exp)
                                 (map walk (caddr exp))
                                 (walk (car (cdddr exp)))))
                           (fail (list "funny ol:let " (list exp 'len (length exp) 'forms (formals-cool? exp))))))
                     ((values apply-values ifary ifeq)
                        (cons (car exp) (map walk (cdr exp))))
                     (else
                        (map walk exp))))
               ((symbol? exp)
                  (handle-symbol exp env fail))
               ((pair? exp)
                  (fail (list "improper code: " exp)))
               ((number? exp)
                  exp)
               (else
                  (list 'quote exp))))
         walk)

      ; drop definitions from env to unbound occurrences in exp
      ; after macros have been expanded

      (define (apply-env exp env)
         (call/cc
            (lambda (ret)
               (ok env
                  ((walker env
                     (lambda (reason)
                        (ret (fail reason))))
                     exp)))))

      (define env-fold ff-fold)

      (define env-del del)

      ;;; these cannot be in primop since they use lists and ffs

      ;; ff of opcode → wrapper
      (define prim-opcodes ;; ff of wrapper-fn → opcode
         (for empty primops
            (λ (ff node)
               (put ff (ref node 5) (ref node 2)))))
;      (define opcode->wrapper
;         (for empty primops
;            (λ (ff node)
;               (put ff (ref node 2) (ref node 5)))))

      ;; later check type, get first opcode and compare to primop wrapper
      (define (primop-of val)
         (get prim-opcodes val #false))

      ;; only special forms supported by the compiler, no primops etc
      ;; fixme: should use distinct identifiers like #:foo for these, since these can unintentionally clash with formals
      (define *special-forms*
         (list->ff
            (list
               (cons 'quote   (tuple 'special 'quote))

               (cons 'lambda  (tuple 'special 'lambda))
               (cons 'setq    (tuple 'special 'setq))
               (cons 'ol:let  (tuple 'special 'ol:let)) ; 'letrec
               (cons 'ifary   (tuple 'special 'ifary))
               (cons 'ifeq    (tuple 'special 'ifeq))

               (cons 'values  (tuple 'special 'values))
               (cons 'apply-values  (tuple 'special 'apply-values)))))

      ;; take a subset of env
      ;; fixme - misleading name
      (define (env-keep env namer)
         (env-fold
            (λ (out name value)
               (let ((name (namer name)))
                  (if name (put out name value) out)))
            empty env))

      (define (env-keys env)
         (ff-fold (λ (words key value) (cons key words)) null env))

      (define primitive? primop-of)

      ;; non-primop instructions that can report errors
      (define (instruction-name op)
         (cond
            ((eq? op 17) 'arity-error)
            (else #false)))

      ; используется в выводе сообщений "инструкция такая-то сфейлила"
      (define (primop-name pop)
         (let ((pop (vm:and pop #x3F))) ; ignore top bits which sometimes have further data
            (or
               (instruction-name pop)
               (let loop ((primops primops))
                  (cond
                     ((null? primops) pop)
                     ((eq? pop (ref (car primops) 2))
                        (ref (car primops) 1))
                     (else
                        (loop (cdr primops))))))))

      ;; from cps
      (define (special-bind-primop? op) ; tuple-apply and ff-apply
         (has? special-bind-primops op))

      (define (variable-input-arity? op)
         (has? variable-input-arity-primops op))

      (define (multiple-return-variable-primop? op)
         (has? multiple-return-variable-primops op))

      ;; primops = (#(name opcode in-args|#f out-args|#f wrapper-fn|#f) ...)

      ;; ff of opcode → (in|#f out|#f), #f if variable
      (define primop-arities
         (fold
            (λ (ff node)
               (lets ((name op in out wrapper node))
                  (put ff op (cons in out))))
            empty primops))

      (define (opcode-arity-ok? op in out)
         (let ((node (getf primop-arities op)))
            (if node
               (and
                  (or (eq? in  (car node)) (not (car node)))
                  (or (eq? out (cdr node)) (not (cdr node))))
               #true)))

      ;; fixme: ??? O(n) search for opcode->primop. what the...
      (define (opcode->primop op)
         (let
            ((node
               (some
                  (λ (x) (if (eq? (ref x 2) op) x #false))
                  primops)))
            (if node node (runtime-error "Unknown primop: " op))))

      (define (opcode-arity-ok-2? op n)
         (tuple-apply (opcode->primop op)
            (λ (name op in out fn)
               (cond
                  ((eq? in n) #true)
                  ((eq? in 'any) #true)
                  (else #false)))))


      (define (verbose-vm-error opcode a b)
         (cons "error: "
         (if (eq? opcode 17)  ;; arity error, could be variable
               ; this is either a call, in which case it has an implicit continuation,
               ; or a return from a function which doesn't have it. it's usually a call,
               ; so -1 to not count continuation. there is no way to differentiate the
               ; two, since there are no calls and returns, just jumps.
            `(function ,a got did not want ,(- b 1) arguments)
         (if (eq? opcode 52)
            `(trying to get car of a non-pair ,a)
         (if (eq? opcode 53)
            `(trying to get cdr of a non-pair ,a)
         `(,(primop-name opcode) reported error ": " ,a " " ,b)
         )))))
         ;   ;((eq? opcode 52)
         ;   ;   `(trying to get car of a non-pair ,a))
         ;   (else
         ;      `("error: instruction" ,(primop-name opcode) "reported error: " ,a " " ,b)))

))
