
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

(define (adjoin-ordered-set elem set)
  (define (inner-adjoin inner-elem inner-set new-set)
   (cond ((null? inner-set) (append new-set (cons elem '())))
          ((> inner-elem (car inner-set)) (inner-adjoin inner-elem 
                                          (cdr inner-set) 
                                          (append new-set (cons (car inner-set) '()))))
         ((or (= inner-elem (car inner-set)) (< inner-elem (car inner-set))) (append new-set (cons inner-elem inner-set)))))
   (inner-adjoin elem set '()))

(adjoin-ordered-set 1 '(1 2 2 3))
(adjoin-ordered-set 2 '(1 2 2 3))
(adjoin-ordered-set 4 '(1 2 2 3))
