; I'd like do define a bunch of tests of the form:
; (test-equality '(foo bar baz) '(1 2 3 4 5))
; and make sure that all three functions return the same
; results for those arguments.

(define (test-results fs args)
  (if (null? (cdr fs))
      #t
      (and (test-results (cdr fs) args)
           (map (lambda (x y) (= x y))
                (map (lambda (al) (apply (car fs) al)) args)
                (map (lambda (al) (apply (cadr fs) al)) args)))))

(define (apply-n-times n f s)
  (if (<= n 0)
      s
      (apply-n-times (- n 1) f (f s))))

(define (foldr f v l)
  (if (null? l)
      v
      (f (car l) (foldr f v (cdr l)))))

(define (foldl f v l)
  (if (null? l)
      v
      (foldl f (f v (car l)) (cdr l))))

(define (compose f g)
  ; it's somewhat annoying that I can't make this arbitrary-arity.
  ; but scheme doesn't seem to have a way to do that.
  (lambda (arg . args)
    (g (apply f (cons arg args)))))

(define (inc x) (+ 1 x))
(define (dec x) (- x 1))

(define (.. x y)
  (if (> x y)
      '()
      (cons x (.. (inc x) y))))