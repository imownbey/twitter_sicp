(define x (list (list 1 2) (list 3 4)))

(define (fringe list)
  (define (fringe-inner list results)
    (cond ((null? list) results)
          ((pair? (car list))
           (fringe-inner (cdr list) (fringe-inner (car list) results)))
          (else (fringe-inner (cdr list) (append results (cons (car list) '()))))))
  (fringe-inner list '()))

;; making it clear what we've built here.
(define flatten fringe)

(equal? '(1 2 3 4) (fringe x))
(equal? '(1 2 3 4 1 2 3 4) (fringe (list x x)))
;; extra credit.
(equal? '(1 2 3 4 1 2 3 4 1 2 3 4) (fringe (list x x x)))
(equal? '(1 2 3 4 1 2 3 4 1 2 3 4) (fringe (list x (list x x))))
