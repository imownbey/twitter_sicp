;; 3.2
(define (make-monitored f)
 (let ((count 0))
   (lambda (x)
     (cond ((eq? x 'how-many-calls?) count)
           ((eq? x 'reset-count) (set! count 0))
           ((begin
              (set! count (+ 1 count))
              (f x)))))))

(define monitored-accumulator (make-monitored make-accumulator))

(define C (monitored-accumulator 5))
(define D (monitored-accumulator 5))
(monitored-accumulator 'how-many-calls?)
(monitored-accumulator 'reset-count)
(monitored-accumulator 'how-many-calls?)
(C 10)
