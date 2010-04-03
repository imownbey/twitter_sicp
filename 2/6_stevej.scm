;; 2.6 Church numerals.

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))


(define one (lambda (f) (lambda (x) (lambda (y) x y))))

(define two (lambda (f) (lambda (x) (lambda (y) (lambda (z) x y z)))))


(define (compose f g)
  (lambda (x)
   (f (g x))))

;; this adds two church numerals
(define add-church compose)

(= 2 ((((add-church one one) 0) 1) 2)) ; => #t