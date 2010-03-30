(include (file "/Users/mknox/h/twitter_sicp/1/mknox.scm"))

(define (nth-pascals-row n)
  (apply-n-times n next-pascal '(1)))

(define (next-pascal r)
  (map + (cons 0 r) (append r '(0))))

(define (nth-pascals-row-primitive n)
  (define (iter i acc)
    (if (= i n)
        acc
        (iter (inc i) (add-to-last 0 acc))))
  (iter 0 '(1)))

(define (add-to-last x l)
  (if (null? l)
      (list x)
      (cons (+ x (car l)) (add-to-last (car l) (cdr l)))))