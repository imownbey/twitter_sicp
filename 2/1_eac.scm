(define (xor a b)
  (and (or a b) (not (and a b))))

(define (make-rat x y)
  (define ax (abs x))
  (define ay (abs y))
  (if (xor (< x 0) (< y 0))
    (cons (- ax) ay)
    (cons ax ay)))
