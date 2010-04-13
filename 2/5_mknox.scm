;; pairs of nonnegative integers
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car x)
  (n-factors 2 x))

(define (cdr x)
  (n-factors 3 x))

(define (n-factors x number)
  (define (int acc num)
    (let ((quotient (/ num x)))
      (if (= (floor quotient)
             (ceiling quotient))
          (int (+ acc 1) quotient)
          acc)))
  (int 0 number))