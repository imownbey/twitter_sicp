; (load "/Users/stevej/src/twitter_sicp/2/68_stevej.scm")

(define (successive-merge ordered-leaves)
  (define (successive-merge-reversed ordered-leaves)
    (if (null? (cddr ordered-leaves))
        (make-code-tree
         (car ordered-leaves)
         (cadr ordered-leaves))
        (make-code-tree
         (car ordered-leaves)
         (successive-merge-reversed (cdr ordered-leaves)))))
  (successive-merge-reversed (reverse ordered-leaves)))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

;; test data
(define pairs '(('A 4) ('B 2) ('D 1) ('C 1)))

(define example-tree
  '((leaf 'a 4)
    ((leaf 'b 2)
     ((leaf 'd 1)
      (leaf 'c 1)
      ('d 'c) 2)
     ('b 'd 'c) 4)
    ('a 'b 'd 'c) 8))


(equal? (make-leaf-set pairs)
        '((leaf 'c 1) (leaf 'd 1) (leaf 'b 2) (leaf 'a 4)))

(define leaf-set (make-leaf-set pairs))

(equal? example-tree (successive-merge leaf-set))

(equal?
 example-tree
 (generate-huffman-tree pairs))
