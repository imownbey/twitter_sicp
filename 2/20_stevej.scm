(define (same-parity num . numbers)
  ;; whoops, I didn't realize scheme gave me even?/odd?
  (define (even? num) (equal? 0 (modulo num 2)))
  (define (odd?  num) (equal? 1 (modulo num 2)))
  (define (same-parity-iter pred? numbers results)
    ; this could really use filter
    (if (null? numbers)
        results
        (if (pred? (car numbers))
            (same-parity-iter pred?
                              (cdr numbers)
                              (append results (cons (car numbers) '())))
            (same-parity-iter pred? (cdr numbers) results))))
  (if (even? num)
      (same-parity-iter even? (cons num numbers) '())
      (same-parity-iter odd? (cons num numbers) '())))


(equal? (same-parity 1 2 3 4 5 6 7) '(1 3 5 7))
(equal? (same-parity 2 3 4 5 6 7) '(2 4 6))