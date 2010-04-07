; there are basically 3 approaches to doing a quine:
; 1 - the Perl school, where you grab the name of your file and print it.
; 2 - reflection, where you can get at your source a la class Foo; puts self.ruby_to_ruby; end
; 3 - structural quining, where you build up a quine by calling a function with quoted source as an argument
; quines of the last type are the most interesting of the three to me.
(define (.... x) x)  ; this will be our placeholder for code we do not yet specify

; we know the quine will be of the form:
(... (quote ...))

; it has to start with a lambda
((lambda (x) x) (quote ...))  ; note that whatever ends up before the quote, that'll be after the quote too.
((lambda (x) x) (quote (lambda (x) x)))

((lambda (x) (list x) (quote (lambda (x) (list x))))) ; now we have the outermost parens.  Let's work in.

; so far we have the outermost expression, and whatever ... will be at the beginning.  Need a list enclosing the quoted stuff
((lambda (x) (list x (list))) (quote (lambda (x) (list x (list)))))

; this returns ((lambda (x) (list x (list)))())
; we're missing the quote and the second repitition of the argument

((lambda (x) (list x (list (quote quote)))) (quote (lambda (x) (list x (list (quote quote))))))
; got the quote

((lambda (x) (list x (list (quote quote) x))) (quote (lambda (x) (list x (list (quote quote) x)))))
; now I have the rest.  And we're done.
