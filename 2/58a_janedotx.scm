eme, version 4.2.3 [3m].
Language: R5RS; memory limit: 128 megabytes.
> (define x '(x + (3 * (x + (y + 2)))))
> (car x)
  x
  > (cdr x)
  (+ (3 * (x + (y + 2))))
  > (cdr (cdr x))
  ((3 * (x + (y + 2))))
  > (caddr x)
  (3 * (x + (y + 2)))
  > (define y '(x + (3 * y)))
  > (define y '((3 * y) + x))
  > y
  ((3 * y) + x)
  > (car y)
  (3 * y)
  > (cdr y)
  (+ x)
  > (cons '(3 * y) '(+ x))
  ((3 * y) + x)
  > 
