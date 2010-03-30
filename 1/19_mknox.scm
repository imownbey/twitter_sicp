(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p ) (* q q))
                   (+ (* 2 p q) (* q q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(define (fib.1 n)
  (scaling-step (cons 1 0) (cons 0 1) n
                (lambda (val state) (let ((a (car val))
                                          (b (cdr val))
                                          (p (car state))
                                          (q (cdr state)))
                                      (cons (+ (* b q) (* a q) (* a p))
                                            (+ (* b p) (* a q)))))
                (lambda (state) (let ((p (car state))
                                      (q (cdr state)))
                                  (cons (+ (* p p) (* q q))
                                        (+ (* 2 p q) (* q q)))))))


(define (scaling-step acc val steps f square-step)
  (cond ((= steps 0) acc)
        ((even? steps) (scaling-step acc (square-step val) (/ steps 2) f square-step))
        (else (scaling-step (f acc val) val (- 1 steps) f square-step))))

