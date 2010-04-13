(define (last-pair numbers)
  (if (null? (cdr numbers))
      numbers
      (last-pair (cdr numbers))))

(equal? '(34) (last-pair (list 23 72 149 34)))
