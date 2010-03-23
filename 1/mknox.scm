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

