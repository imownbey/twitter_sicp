(define (fringe tree) 
  (if (null? tree) tree
         (append (if (pair? (car tree)) (fringe (car tree)) (list (car tree)))
                        (fringe (cdr tree)))))
