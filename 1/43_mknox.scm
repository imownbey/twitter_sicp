(include (file "/Users/mknox/h/twitter_sicp/1/mknox.scm"))
(define (repeated f n)
  (if (<= n 0)
      ident
      (compose-1arg f (repeated f (dec n)))))