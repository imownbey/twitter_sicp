;Older items are appended after 'answer,' while newer items are appended first. I.e. args to cons are reversed.

;The next problem is that nil ends up as the first argument to cons when squaring the very first item of the list, causing some funky nested list to be returned. The cons needs to take as its arguments the result of squaring the car of items, and the result of squaring the rest of the list. This way, nil is never the first argument to cons.

;A working iterative solution:
(define (square-list2 items)
   (define (iter2 things)
        (if (null? things)
                 things
                         (cons (square (car things)) 
                                        (iter2 (cdr things)))))
     (iter2 items))


