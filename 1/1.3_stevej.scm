(define (bigger a b)
  (if (> a b) a b))

(define (square a)
  (* a a))

(define (sum-squares a b)
  (+ (square a) (square b)))

; yuck. if I thought it was kosher, I'd sort the
; list, drop the last, map square and then sum.
(define (sum-largest-two a b c)
  (cond ((and (> a b) (> a c)) (sum-squares a (bigger b c)))
        ((and (> b a) (> b c)) (sum-squares b (bigger a c)))
        ((and (> c a) (> c b)) (sum-squares c (bigger a b)))))

(= 13 (sum-largest-two 1 2 3))
(= 13 (sum-largest-two 3 2 1))
(= 13 (sum-largest-two 3 1 2))