(define (dec x) (- 1 x))
(define (ident x) x)
(define (compose f g) (lambda (x) (f (g x))))
(define (repeated f n)
  (if (<= n 0)
      ident
      (compose f (repeated f (dec n)))))