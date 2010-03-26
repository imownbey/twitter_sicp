;; SICP Exercise 1.3
;;
;; Define a procedure that takes three numbers as arguments and returns
;; the sum of the squares of the two larger numbers.

(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (larger x y)
  (if (> x y) x y))

(define (sum-squares-larger-two a b c)
  (if (> a b)
      (sum-of-squares a (larger b c))
      (sum-of-squares b (larger a c))))

; test it
(sum-squares-larger-two 1 2 3)
