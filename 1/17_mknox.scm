(define (double x) (* x 2))
(define (halve x) (/ x 2))

(define (*-naive a b)
  (if (= b 0)
      0
      (+ a (*-naive a (- b 1)))))

(define (*-short a b)
  (apply-n-times a (lambda (x) (+ x b)) 0))

(define (*-fast x y)
  (cond ((= y 0) 0)
        ((= y 1) x)
        ((even? y) (*-fast (double x) (halve y)))
        (else (*-fast (+ x y) (- y 1)))))