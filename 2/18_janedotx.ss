(define (my-reverse l)
  (if (null? (cdr l))
          l
                  (append (my-reverse (cdr l)) (list (car l)))))
