(define (facc acc combine ident term filter a next b)
  (if (> a b)
      (combine nullv acc)
      (facc (combine (term a) acc)
            combine
            ident
            term
            filter
            (next a)
            next
            b)
      (facc acc combine ident term filter a next b)))

(define (facc-tr f nullv term filter a b next)
  (if (> a b)
      nullv
      (facc-tr f
               (if (filter a)
                   (f (term a) acc)
                   acc)
               term
               filter
               (next a)
               b
               next)))

