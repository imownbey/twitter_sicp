(define x (list (list 1 2) (list 3 4)))

(define y (list (list (list 1 2)) (list 3 4)))

(define (deep-reverse list)
  (define (deep-reverse-iter list results)
    (cond ((null? list) results)
          ((list? (car list))
           (deep-reverse-iter
            (cdr list)
            (cons (deep-reverse-iter
                   (car list) '()) results)))
          (else (deep-reverse-iter
                 (cdr list)
                 (cons (car list) results)))))
  (deep-reverse-iter list '()))

(equal? '((4 3) (2 1)) (deep-reverse x))
(equal? '((4 3) ((2 1))) (deep-reverse x))