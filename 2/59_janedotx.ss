
(define (accumulate op initial sequence)
   (if (null? sequence)
          initial
                (op (car sequence)
                           (accumulate op initial (cdr sequence)))))

  (define (filter predicate sequence)
     (cond ((null? sequence) nil)
              ((predicate (car sequence))
                        (cons (car sequence)
                                        (filter predicate (cdr sequence))))
                      (else (filter predicate (cdr sequence)))))


  (define (flatmap proc seq)
    (accumulate append nil (map proc seq)))


  (define (enumerate-interval low high)
     (if (> low high)
            nil
                  (cons low (enumerate-interval (+ low 1) high))))

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)        
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (cond ((and (null? set1) (null? set2)) '())
        ((and (null? set1) (not (null? set2))) set2)
        ((and (null? set2) (not (null? set1))) set1)
        (#t (if (element-of-set? (car set1) set2) 
             (union-set (cdr set1) set2)
             (union-set (cdr set1) (cons (car set1) set2))))))

;they do the right things.
(union-set '() '())
(union-set '(1 2 3) '())
(union-set '() '(1 2 3))
(union-set '(1 2 3) '(2 4 5))
  
