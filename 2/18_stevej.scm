(define (reverse items)
  (define (reverse-iter items results)
    (if (null? items)
        results
        (reverse-iter (cdr items)
                      (cons (car items) results))))
  (reverse-iter items '()))

(equal? '(25 16 9 4 1) (reverse (list 1 4 9 16 25)))
