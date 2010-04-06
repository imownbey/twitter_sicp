;; Define a corresponding subtraction procedure, called sub-interval.

(define make-interval cons)

(define (sub-interval a b)
  (make-interval (- (upper-bound b) (upper-bound a))
                 (- (lower-bound b) (lower-bound b))))
