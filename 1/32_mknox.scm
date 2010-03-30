(define (accumulate f nullv term a b next)
  (if (> a b)
      nullv
      (accumulate f (f (term a) nullv) term (next a) b next)))

(define (sum term a b next)
  (accumulate + 0 a b next))
