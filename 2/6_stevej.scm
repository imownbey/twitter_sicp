;; 2.6 Church numerals.

(define zero.0 (lambda (g) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; zero simply returns a procedure that returns the identity function.
;; Note: this is the same as the mathematical definition of identity for addition.
(define (id x) x)

(define zero (lambda (g) id))

;; Direct definitions of one and two via substitution followed by simplification.
(define one
  (lambda (f) (lambda (x) (f (((lambda (g) id) f) x)))))

;; simplified by term rewriting
(define one.simple
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (((lambda (g) (lambda (y) (g (((lambda (h) id) g) y))))
 f) x)))))

;; simplified by term rewriting
(define two.simple
  (lambda (f) (lambda (x) (f (f x)))))

;; add two church numerals.
(define (add-church a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))


;; You can see the derivatation from add-1 if you notice
;; there's a one function buried inside of add-1. abstract
;; over it by replace f with (a f) and you're done!
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; Also, technically compose will work here, too, since
;; f(x) + g(x) = f(g(x))
(define (compose f g)
  (lambda (x)
    (f (g x))))

(define add.2 compose)