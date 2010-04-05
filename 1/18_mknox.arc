(def scaling-step (acc val steps f square-step)
  (if (= steps 0) acc
      (even steps) (scaling-step acc (square-step val) (/ steps 2) f square-step)
      (scaling-step (f acc val) val (- 1 steps) f square-step)))

(def *-crazy (x y) (scaling-step 0 x y + [* 2 _]))