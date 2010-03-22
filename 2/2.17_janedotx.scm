(define (last-pair l)
    (if (null? (cdr l))
             (car l)
                     (last-pair (cdr l))))
