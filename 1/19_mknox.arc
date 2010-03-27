(def scaling-step (acc val steps f square-step)
  (if (= steps 0) acc
      (even steps) (scaling-step acc (square-step val) (/ steps 2) f square-step)
      (scaling-step (f acc val) val (- 1 steps) f square-step)))

(def fib (n)
  (scaling-step (cons 1 0) (cons 0 1) n
		(fn (val state)
		  (with a (car val) b (cdr val) p (car state) q (cdr state)
			(cons (+ (* b q) (* a q) (* a p))
			      (+ (* b p) (* a q)))))
		(fn (state (with p (car state) q (cdr state)
				 (cons (+ (* p p) (* q q))
				       (+ (* 2 p q) (* q q))))))))