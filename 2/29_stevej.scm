;; Given
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;; Exercise Part A
(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

;; Exercise Part B
(define (add-leaves branch)
  (let ((b (branch-structure branch)))
    (cond ((number? b) b)
          ((not (pair? branch)) branch)
          (else (+ (add-leaves (car b))
                   (add-leaves (cadr b)))))))

(define leaf (make-branch 1 1))
(define two-leaves (make-branch 1 (make-mobile leaf leaf)))
(define three-leaves (make-branch 1 (make-mobile leaf two-leaves)))
(define four-leaves (make-branch 1 (make-mobile two-leaves two-leaves)))

(equal? 1 (add-leaves (make-branch 1 1)))
(equal? 2 (add-leaves two-leaves))
(equal? 2 (add-leaves (make-branch 1 (list leaf leaf))))
(equal? 4 (add-leaves (make-branch 1 (list (make-branch 1 (list leaf leaf))
                                             (make-branch 1 (list leaf leaf))))))
(equal? 4 (add-leaves four-leaves))
(equal? 3 (add-leaves three-leaves))

(define (add-lengths branch)
  (cond ((number? (branch-structure branch)) (branch-length branch))
        ((not (pair? (branch-structure branch))) (branch-length branch))
        (else (+ (branch-length branch)
                 (add-lengths (car (branch-structure branch)))
                 (add-lengths (cadr (branch-structure branch)))))))

(equal? 1 (add-lengths leaf))
(equal? 3 (add-lengths two-leaves))
(equal? 3 (add-lengths (make-branch 1 (list leaf leaf))))
(equal? 5 (add-lengths three-leaves))

(define z (make-branch 1 (list (make-branch 1 (list leaf leaf))
                               (make-branch 1 (list leaf leaf)))))
(equal? 7 (add-lengths z))


;; The total weight of a mobile is defined as the length of a
;; branch multiped by the weight on the end.
(define (total-weight mobile)
  (*
   (+ (add-lengths (left-branch mobile))
      (add-lengths (right-branch mobile)))
   (+ (add-leaves (left-branch mobile))
      (add-leaves (right-branch mobile)))))


;; TODO: validate that these are right
(equal? 4   (total-weight (make-mobile leaf leaf)))
(equal? 24  (total-weight (make-mobile two-leaves two-leaves)))
(equal? 60  (total-weight (make-mobile three-leaves three-leaves)))
(equal? 112  (total-weight (make-mobile four-leaves four-leaves)))

;; Exercise Part C
;; Because branches are not always mobiles, I thought the best way
;; to deal with this would be to make them mobile with an always known
;; left branch. I thought that was the simplest solution.
(define (balanced? mobile)
  (equal? (total-weight (make-mobile leaf (left-branch mobile)))
          (total-weight (make-mobile leaf (right-branch mobile)))))

(equal? (left-branch (make-mobile z z))
        '(1 ((1 ((1 1) (1 1))) (1 ((1 1) (1 1))))))

(equal? (right-branch (make-mobile z z))
        '(1 ((1 ((1 1) (1 1))) (1 ((1 1) (1 1))))))

(equal? leaf (right-branch (make-mobile leaf leaf)))
(equal? leaf (left-branch (make-mobile leaf leaf)))

(balanced? (make-mobile leaf leaf))
(balanced? (make-mobile two-leaves two-leaves))
(not (balanced? (make-mobile leaf two-leaves)))
