;; currently a union library of some existing ones 

(define-library (owl base)

   (export
      (exports (r5rs base))
      (exports (owl list))
      (exports (owl rlist))
      (exports (owl list-extra))
      (exports (owl ff))
      (exports (owl io))
      (exports (owl lazy))
      (exports (owl string))
;      (exports (scheme misc))
      (exports (owl symbol))
      (exports (owl sort))
      (exports (owl vector))
      (exports (owl equal))
      (exports (owl eof))
      (exports (owl random))
      (exports (owl render))
      (exports (owl error))
      (exports (owl interop))
      (exports (owl fasl))
      (exports (owl time))
      (exports (owl regex))
      (exports (owl math-extra))
      (exports (owl math))
      (exports (owl tuple))
      wait)

   (import
      (r5rs base)
      (owl list)
      (owl rlist)
      (owl list-extra)
      (owl tuple)
      (owl ff)
      (owl primop)
      (owl io)
      (owl time)
      (owl lazy)
      (owl math-extra)
      (owl eof)
      (owl string)
;      (scheme misc)
      (owl symbol)
      (owl sort)
      (owl fasl)
      (owl vector)
      (owl equal)
      (owl random)
      (owl regex)
      (owl render)
      (owl error)
      (owl interop)
      (owl math)))
