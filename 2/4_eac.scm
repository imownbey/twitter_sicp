; from book
(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))

; answer
(define (cdr z)
  (z (lambda (p q) q)))

; proof: the following are equivalent
; (car (cons x y))
; (car (lambda (m) (m x y)))
; ((lambda (m) (m x y)) (lambda (p q) p))
; ((lambda (p q) p) (x y))
; ((x y) x)
; x
;
; the proof for cdr is analogous
