; Define a function compose f after g.

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (inc n)
  (+ 1 n))

(define (square x) (* x x))

((compose square inc) 6) ; => 49