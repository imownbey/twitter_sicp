;; 2.4 Alternate representation of pairs using lambdas

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))


(= 1 (car (cons 1 2))) ; => #t

(= 2 (cdr (cons 1 2))) ; => #t