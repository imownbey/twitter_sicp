(define (same-parity paragon . rest)
 (define has-paragon-parity
  (if (odd? paragon) odd?
   even?))
 (define (same-parity-inner p r)
  (if (null? r)
   ()
   (append (if (has-paragon-parity (car r)) 
            (list (car r)) 
            ())
    (same-parity-inner p (cdr r)))))
 (same-parity-inner paragon rest))


