;; SICP Exercise 1.3
;;
;; Define a procedure that takes three numbers as arguments and returns
;; the sum of the squares of the two larger numbers.

(defn square [x]
  (* x x))

(defn sum-of-squares [x y]
  (+ (square x) (square y)))

(defn sum-of-squares-larger-two [a b c]
  (reduce sum-of-squares (rest (sort [a b c]))))

(sum-of-squares-larger-two 1 2 3)
