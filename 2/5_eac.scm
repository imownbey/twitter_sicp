(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

; this is kind of barf but i donno a better way..
; logarithms would still require extra work to deal with multiple bases.
(define (car a)
  (define (ci a c) (if (= (modulo a 2) 0) (ci (/ a 2) (+ c 1)) c))
  (ci a 0))
(define (cdr a)
  (define (ci a c) (if (= (modulo a 3) 0) (ci (/ a 3) (+ c 1)) c))
  (ci a 0))
