;; 3.1
(define (make-accumulator balance)
   (lambda (deposit)
       (begin
       (set! balance (+ deposit balance))
       balance)))

(define A (make-accumulator 5))
(A 4)
(define B (make-accumulator 15))
(B 100)
