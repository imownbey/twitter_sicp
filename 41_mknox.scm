(include (file "/Users/mknox/h/twitter_sicp/1/mknox.scm"))
(define (double f)
  (lambda (x) (f (f x))))

(((double (double double)) inc) 5)