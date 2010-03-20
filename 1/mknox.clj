(def square (x) (* x x))
(def avg (x y) (/ (+ x y) 2))

; I didn't bother porting the newton's method sqrts because it's so close.
(def fib (n) (fib-iter 1 0 n))
(def fib-iter (a b count)
     "sadly, because of JVM hostility to TCO, this will blow stack."
     (if (= count 0)
       b
       (fib-iter (+ a b) a (- count 1))))


