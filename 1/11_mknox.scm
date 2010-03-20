(define (weird-func-rec n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

(define (weird-func-iter n)
  (define (wfi-int n a b c)
    (let ((val (+ a (* 2 b) (* 3 c))))
      (if (= n 0)
          val
          (wfi-int (- n 1) val a b))))
  (if (< n 3)
      n
      (wfi-int (- n 3) 2 1 0)))
