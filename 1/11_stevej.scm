;; f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>3

;; simple recursive style
(define (f n)
  (if (< n 3) n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))



;; a quick rundown:
;; 0 -> 0
;; 1 -> 1
;; 2 -> 2
;; 3 -> 2 + (2 * 1) + (3 * 0)
;; 4 -> 3 + (2 * 2) + (3 * 1)
;; 5 -> 4 + (2 * 3) + (3 * 2)
;; 6 -> 5 + (2 * 4) + (3 * 3)
;; n -> n-1 +  n-2  +  n-3
;;
;; n = n-1 + (2 * n-2) + (3 * n-3)
;;
;; n now replaces n-1, n-1 now replaces n-2, n-2 now replaces n-3


;; f(0) = 0
;; f(1) = 1
;; f(2) = 2
;; f(3) = 3
;; introduce: g(x) = x * f(n - x)
;; f(n) = g(n - 1) + g(n - 2) + g(n - 3)

(define (f.2 n)
  (f-iter 0 0 0 0 n))

;; in a complicated iterative style
;; c is count, max is the maximum number of iterations
(define (f-iter n-1 n-2 n-3 c max)
  (define (g n-1 n-2 n-3) (+ n-1 (* 2 n-2) (* 3 n-3)))
  (if (> c max)
      n-1
      (cond ((= c 0) (f-iter 0 0 0 (+ 1 c) max))
            ((= c 1) (f-iter 1 0 0 (+ 1 c) max))
            ((= c 2) (f-iter 2 1 0 (+ 1 c) max))
            ((> c 2) (f-iter (g n-1 n-2 n-3)
                             n-1
                             n-2
                             (+ c 1)
                             max)))))


;; this could be done better if you exploded n (e.g. 5 becomes (5 4 3 2 1)
;; and map g over it 3-wise and sum those together. will need to
;; account for the last two items.  but that's not in the spirit of
;; the question.