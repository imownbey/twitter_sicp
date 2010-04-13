(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (lambda (y) (x y))))))

(define (add-church-numerals church1 church2) (church1 church2))
