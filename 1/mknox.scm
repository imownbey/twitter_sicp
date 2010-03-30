; I fairly frequently implement the same method more than once.
; Accordingly, I'd like do define a bunch of tests of the form:
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

(define (return-same-result f g arglist)
  (let ((f-results (apply f arglist))
        (g-results (apply g arglist)))
    ; should make this print.
    (= f-results g-results)))

(define (same-results f g arglists)
  ())

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
    (f (apply g (cons arg args)))))

(define (compose-1arg f g) (lambda (x) (f (g x))))

(define (inc x) (+ 1 x))
(define (dec x) (- x 1))
(define (ident x) x)

(define (.. x y)
  (if (> x y)
      '()
      (cons x (.. (inc x) y))))

(define (take n l)
  ; take at most n elements of list l
  (if (or (null? l) (= 0 n))
      '()
      (cons (car l)
            (take (- n 1) (cdr l)))))

(define (filter f l)
  (cond ((null? l) '())
        ((f (car l)) (cons (car l) (filter f (cdr l))))
        (filter f (cdr l))))

