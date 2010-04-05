; Smoothing function

(define (dx) 0.0001)

; f is a function that takes a numerical argument
(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x (dx))) (f x) (f (+ x (dx)))) 3)))

(define (f.2 x) (+ 1 x))

;; helper functions for n-fold below
(define (compose f g)
  (lambda (x)
    (f (g x))))

; n must be a positive non-zero number
(define (repeated f n)
  (cond ((= n 1) f)
        (else (compose f (repeated f (- n 1))))))


;; n-fold smoothing using repeated and smooth
(define (n-fold f n)
  ((repeated smooth n) f))