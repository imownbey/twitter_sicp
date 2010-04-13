(define (cadr list) (car (cdr list)))
(define (caddr list) (car (cdr (cdr list))))
(define (cadaddr list) (cadr (caddr list)))
(define (caar list) (car (car list)))

(= 7 (cadaddr '(1 3 (5 7) 9)))
(= 7 (caar '((7))))

(define nested-list '(1 (2 (3 (4 (5 (6 7)))))))
(= 7 (cadr (cadr (cadr (cadr (cadr (cadr nested-list)))))))
