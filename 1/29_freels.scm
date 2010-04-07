;; Simpson's Rule for calculating integral of f(x) between a and b, with an accuracy of n, and n is even
;; (h/3) * [ y0 + 4y1 + 2y2 + 4y3 + 2y4 + ... + 2yn-2 + 4yn-1 + yn ]
;; where:
;;   h = (b - a)/n
;;   y(k) = f(a + kh)

(define (curry term . args1) (lambda args2 (apply term (append args1 args2))))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (integral f a b #!optional (accuracy 100))
  (let* ((n (- accuracy (remainder accuracy 2)))
        (h (/ (- b a) n))
        (simp-term (lambda (k)
                     (let* ((multiplier (cond ((or (= k 0) (= k n)) 1)
                                              ((even? k) 2)
                                              (else 4)))
                            (yk (f (+ a (* k h)))))
                       (* multiplier yk)))))
    (* (/ h 3) (sum simp-term 0 (curry + 1) n))))
