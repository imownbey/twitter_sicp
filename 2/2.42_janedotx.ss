(define (diag-conflict? pos1 pos2)
 (eq? (abs (- (car pos1) (car pos2))) (abs (- (cadr pos1) (cadr pos2)))))

(define (safe? k positions)
 (define (still-safe? new-queen-row new-queen-col cur-row remaining-positions)
  (cond ((eq? '() remaining-positions) #t)
   ((eq? new-queen-col (car remaining-positions)) #f)
   ((diag-conflict? (list new-queen-row new-queen-col) (list cur-row (car remaining-positions))) #f)
   (#t (still-safe? new-queen-row new-queen-col (- cur-row 1) (cdr remaining-positions)))))

 (still-safe? k (car positions) (- k 1) (cdr positions))
)

(define (adjoin-position new-row k rest-of-queens)
 (cons new-row rest-of-queens))
(define empty-board '())

(define (queens board-size)
 (define (queen-cols k)  
  (if (= k 0)
   (list empty-board)
   (filter
    (lambda (positions) (safe? k positions))
    (flatmap
     (lambda (rest-of-queens)
      (map (lambda (new-row)
            (adjoin-position new-row k rest-of-queens))
       (enumerate-interval 1 board-size)))
     (queen-cols (- k 1))))))
 (queen-cols board-size))

