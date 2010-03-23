;; Assuming that we don't have the niceties we haven't learned about, yet.

(define (fact n)
  (if (= n 0)
      1
      (* n (fact (- n 1))))
  )

; The choose function is also known as "that thing that gives us the
; binomial coefficients".
(define (choose n r)
  (/ (fact n) (* (fact r) (fact (- n r)))))


; The actual implementation of the pascal triangle with
; choose. Multiple calls to (fact n). The top row in it is 0. That is,
; the pascals for it is (pascals 0).
(define (pascals row)
  (define (pascals-rec r accum)
    (if (< r 0)
        accum
        (pascals-rec (- r 1) (cons (choose row r) accum))))
  (pascals-rec row '()))
