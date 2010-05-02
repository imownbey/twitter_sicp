(load "/Users/stevej/src/twitter_sicp/2/67_stevej.scm")

(define (encode message tree)
  (if (null? message) '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (member? item list)
  (pair? (member item list)))

;; Now define encode-symbol. symbol is a character. tree is the huffman tree. we return a list
;; of bits encoded against the tree, it's the accumulation of bits that lead to the leaf.
(define (encode-symbol symbol tree)
  (define (encode-symbol-iter symbol tree results)
    (cond ((leaf? tree) results)
          ;; macros would help here
          ((member? symbol (symbols (left-branch tree))) (encode-symbol-iter symbol (left-branch tree) (append results (cons 0 '()))))
          ((member? symbol (symbols (right-branch tree))) (encode-symbol-iter symbol (right-branch tree) (append results (cons 1 '()))))
          (else '())))
  (encode-symbol-iter symbol tree '()))


;; And now for the actual exercise. Simply run the following code.
(define sample-tree
  (make-code-tree
   (make-leaf 'A 4)
   (make-code-tree (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))
(define sample-symbols '(a d a b b c a))

(equal? sample-symbols
        (decode sample-message sample-tree))

(equal? sample-message
        (encode sample-symbols sample-tree))

(equal? '(0)
         (encode-symbol 'A sample-tree))

(equal? '(1 0)
        (encode-symbol 'B sample-tree))

(equal? '(1 1 1)
        (encode-symbol 'C sample-tree))

(equal? '(1 1 0)
        (encode-symbol 'D sample-tree))

(equal? '(0 1 1 0)
        (encode '(a d) sample-tree))

(equal? '(0 1 0)
        (encode '(a b) sample-tree))

(equal? '(0 1 0 1 1 1)
        (encode '(a b c) sample-tree))

(equal? '(0 1 0 1 1 1 1 1 0)
        (encode '(a b c d) sample-tree))