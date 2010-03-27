(defn scaling-step [acc val steps f square-step]
  (cond (= steps 0) acc
	(even? steps) (scaling-step acc (square-step val) (/ steps 2) f square-step)
	true (scaling-step (f acc val) val (- 1 steps) f square-step)))

(defn fib [n]
  (scaling-step (list 1 0) (list 0 1) n
                (fn [[a b] [p q]] (list (+ (* b q) (* a q) (* a p))
					(+ (* b p) (* a q))))
                (fn [[p q]] (list (+ (* p p) (* q q))
				      (+ (* 2 p q) (* q q))))))