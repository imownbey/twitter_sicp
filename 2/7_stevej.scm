(define (make-interval a b) (cons a b))

(define (upper-bound interval) (car interval))
(define (lower-bound interval) (cdr interval))