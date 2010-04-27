(define m '((1 2 3 4) (4 5 6 6) (6 7 8 9)))

;; from exercise 2.36
(define (accumulate op initial sequence)
  (if (null? sequence) initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;; from exercise 2.36
(define (accumulate-n op init seqs)
  (if (null? (car seqs)) '()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

; Sum(v[i] * w[i])
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;; need more tests
(equal? 2 (dot-product '(1 1) '(1 1)))
(equal? 3 (dot-product '(1 2) '(1 1)))

; returns vector t where t[i] = Sum[j](m[i][j] * v[j])
(define (matrix-*-vector m v)
  (map (lambda (w) (map * v w)) m))

(equal? m
        (matrix-*-vector m '(1 1 1 1)))

; m * 2 essentially
(equal? '((2 4 6 8) (8 10 12 12) (12 14 16 18))
        (matrix-*-vector m '(2 2 2 2)))

; returns matrix n where n[i][j] = m[j][i]
(define (transpose mat)
  (accumulate-n cons '() mat))

(equal? '((1 2 3) (0 6 7))
        (transpose '((1 0) (2 6) (3 7))))

;; returns matrix p where p[i][j] = Sum[k](m[i][k] * n[j][k])
;; entries are given by dot-product of the corresponding
;; row of M and the corresponding column of N.
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map dot-product cols m))) ;; FAIL

(define x '((1 2) (3 4)))
(define y '((0 1) (0 0)))

(equal? '((0 1) (0 3))
        (matrix-*-matrix x y))
