(define (cont-frac numerators denominators n)
  (define (int i)
    (if (> i n)
        0
        (/ (numerators i) (+ (denominators i) (int (+ 1 i))))))
  (int 1))

(cont-frac (lambda (x) 1.0) (lambda (x) 1.0) 19) ; 0.6180339985218034
