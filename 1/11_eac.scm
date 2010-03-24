(define (recursive-compute n)
  (cond ((< n 3) n)
        (else (+ (recursive-compute (- n 1))
                 (* 2 (recursive-compute (- n 2)))
                 (* 3 (recursive-compute (- n 3)))))))

(define (comp-iter n-1 n-2 n-3 n)
  (cond ((= n 0) n-1)
        (else (comp-iter (+ n-1 (* 2 n-2) (* 3 n-3)) n-1 n-2 (- n 1)))))
  
(define (iterative-compute n)
  (cond ((< n 3) n)
        (else (comp-iter 2 1 0 (- n 2)))))

(iterative-compute 150)
(recursive-compute 10)1