;;;
;;; Symbols
;;;


(define-library (owl symbol)

   (export symbol->string)

   (import
      (r5rs base)
      (owl string)
      (owl error))

   (begin
      (define (symbol->string x) 
         (if (eq? (type x) type-symbol)
            (let ((str (ref x 1)))
               (cond
                  ((string=? str "")
                     "||") ;; make empty symbols less invisible
                  ((m/ / str) ;; fixme: doesn't quote internal |:s yet
                     (string-append (string-append "|" str) "|"))
                  (else str)))
            (error "Not a symbol: " x)))))
