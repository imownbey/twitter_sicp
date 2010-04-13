(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; one, unsimplified
(lambda (f) (lambda (x) (f (((lambda (g) (lambda (x) x)) f) x))))

(define one (lambda (f) (lambda (x) (f x))))

; two, unsimplified
(lambda (f) (lambda (x) (f (((lambda (g) (lambda (x) (g x))) f) x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

; it would have been useful here to have had something that operated structurally on the sexps,
; making it so that you could start with (...body of add-1.... ...body of zero...) and reduce
; until you got one.