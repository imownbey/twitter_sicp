(define (within-circle? x y)
  (<= (+ (* x x) (* y y)) 1))
(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (rand-float upper)
  (* upper (random 1.0)))
(define (estimate-integral predicate x1 y1 trials)
  (define (experiment)
    (let ((p1 (rand-float x1))
          (p2 (rand-float y1)))
          (within-circle? p1 p2)))
  ( * 4.0 (* (* x1 y1) (monte-carlo trials experiment))))

(estimate-integral within-circle? 1 2 1000000)
;; 3.134336
(estimate-integral within-circle? 10 10 10000)
;; 3.72
(estimate-integral within-circle? 10 10 100000)
;;3.062

