(define (f-rec n)
  (if (< n 3)
      n
      (+ (f-rec (- n 1))
         (* 2 (f-rec (- n 2)))
         (* 3 (f-rec (- n 3))))))

(define (f-iter n)
  (define (f-int n a b c)
    (let ((val (+ a (* 2 b) (* 3 c))))
      (if (= n 0)
          val
          (f-int (- n 1) val a b))))
  (if (< n 3)
      n
      (f-int (- n 3) 2 1 0)))