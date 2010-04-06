(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define make-interval cons)

;; p is a percentage in decimal
(define (make-center-percent c p)
  (let ((upper-bound (+ c (* c p)))
        (lower-bound (- c (* c p))))
    (make-interval upper-bound lower-bound)))
