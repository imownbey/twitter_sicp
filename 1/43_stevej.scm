;; nth repeated application of f

(define (compose f g)
  (lambda (x)
    (f (g x))))

; n must be a positive number
(define (repeated f n)
  (cond ((= n 1) f)
        (else (compose f (repeated f (- n 1))))))

(define (square x) (* x x ))

(= 625 ((repeated square 1) 5)) ; => #t

;; BONUS! An iterative version of repeated.

(define (repeated-iter f fn n)
  (cond ((= n 1) fn)
        (else (repeated-iter f (compose f fn) (- n 1)))))

(define (repeated.2 f n)
  (repeated-iter f f n))