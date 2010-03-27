(define (accumulate op initial sequence)
 (if (null? sequence)
  initial
  (op (car sequence)
   (accumulate op initial (cdr sequence)))))
  ;; this should be the real working one
(define (count-leaves t)
 (accumulate
  +
  0
  (map (lambda (leaf)
        (if (pair? leaf)
         (count-leaves leaf)
         1))
   t)))

