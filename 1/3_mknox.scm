(include (file "/Users/mknox/h/twitter_sicp/1/mknox.scm"))
(define (square x)(* x x))

(define (sum-squares x y)
  (+ (square x) (square y)))

(define (top-2-squared x y z)
  (cond ((and (< x y) (< x z)) (+ (sq y) (sq z)))
        ((and (< y x) (< y z)) (+ (sq x) (sq z)))
        (else (+ (sq x) (sq y)))))

(define (top-2-squared x y z)
  (if (> x y)
      (if (> y z)
          (+ (sq x) (sq y))
          (+ (sq x) (sq z)))
      (if (> x z)
          (+ (sq x) (sq y))
          (+ (sq y) (sq z)))))

(define (top-2-squared.2 x y z)
  (if (> x y)
      (+ (sq x)
         (if (> y z)
             (sq y)
             (sq z)))
      (+ (sq y)
         (if (> x z)
             (sq x)
             (sq z)))))

(define (top-2.1 l)
  (take 2 (sort l >)))

(define (top-2 l)
  (cdr (sort l <)))

(define (top-2-squared.3 x y z)
  (apply sum-squares (top-2 (list x y z))))

(define (top-2-squared.4 . args)
  (apply sum-squares (top-2 args)))