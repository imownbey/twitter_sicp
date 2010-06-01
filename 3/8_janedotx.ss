(define (dummy)
  (let ((internal 10))
  (lambda (x)
    (if (= 10 internal) (begin (set! internal x) internal))
        internal)))

(define f (dummy))
;; (f 0)  then yields 0 forever more, and (f 1) yields 1 forever more. 
;; so then the order of evaluation will matter.
