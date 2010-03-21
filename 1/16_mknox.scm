; this is a generally useful combinator, which applies a transformation to a
; given state n times.
(define (apply-n-times n f s)
  (if (<= n 0)
      s
      (apply-n-times (- n 1) f (f s))))

(define (expt-naive b n)
  (if (= n 0)
      1
      (* b (expt-naive b (- n 1)))))

(define (expt b n)
  (apply-n-times n (lambda (x) (* x b)) 1))

(define (fast-expt-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter a (* b b) (/ n 2)))
        (else (fast-expt-iter (* a b) b (- n 1)))))



