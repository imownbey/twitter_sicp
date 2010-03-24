(define (pascal-triangle-row row)
  (define (empty? l) (= 0 (length l)))
  (define (zip func l1 l2)
    (cond ((empty? l1) l2)
          ((empty? l2) l1)
          (else (cons
                 (func (car l1) (car l2))
                 (zip func (cdr l1) (cdr l2))))))

  (if (= row 1)
      '(1)
      (let ((prev (pascal-vals (- row 1))))
            (zip + prev (cons 0 prev)))))
