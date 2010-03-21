; this is a generally useful combinator, which applies a transformation to a
; given state n times.
(define (apply-n-times n f s)
  (if (<= n 0)
      s
      (apply-n-times (- n 1) f (f s))))

(define (nth-pascals-row n)
  (apply-n-times n next-pascal '(1)))

(define (next-pascal r)
  (map + (cons 0 r) (append r '(0))))