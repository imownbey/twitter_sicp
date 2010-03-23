(define (my-map p sequence)
 (accumulate 
  (lambda (x y)
   (cons (p x)
    y))
  '()      
  sequence))
(define (my-append seq1 seq2)
 (accumulate cons seq2 seq1))

(define (my-length sequence)
 (accumulate (lambda (x accumulator) (+ 1 accumulator)) 0 sequence))

