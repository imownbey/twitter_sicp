(define x (list (list 1 2) (list 3 4)))

(define (fringe list)
  (define (fringe-iter list results)
    (cond ((null? list) results)
          ((pair? (car list))
           (fringe-iter (cdr list) (fringe-iter (car list) results)))
          (else (fringe-iter (cdr list) (append results (cons (car list) '()))))))
  (fringe-iter list '()))

(equal? '(1 2 3 4) (fringe x))
(equal? '(1 2 3 4 1 2 3 4) (fringe (list x x)))
;; extra credit.
(equal? '(1 2 3 4 1 2 3 4 1 2 3 4) (fringe (list x x x)))
(equal? '(1 2 3 4 1 2 3 4 1 2 3 4) (fringe (list x (list x x))))
