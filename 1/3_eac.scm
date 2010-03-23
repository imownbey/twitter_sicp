(define (sum-squares-larger x y z) (
  cond
    ((and (< z x) (< z y)) (+ (* x x) (* y y)))
    ((and (< x y) (< x z)) (+ (* y y) (* z z)))
    ((and (< y x) (< y z)) (+ (* z z) (* x x)))
))