(define (deriv ex var)
  (cond ((number? ex) 0)
        ((variable? ex)
         (if (same-variable? ex var) 1 0))
        ((sum? ex)
         (make-sum (deriv (addend ex) var)
                   (deriv (augend ex) var)))
        ((product? ex)
         (make-sum
           (make-product (multiplier ex)
                         (deriv (multiplicand ex) var))
           (make-product (deriv (multiplier ex) var)
                         (multiplicand ex))))
        ((exponentiation? ex)
            (make-exponentiation (deriv ())

        (else
         (error "unknown exression type -- DERIV" ex))))

(define (exponentiation? x) 
  (and (pair? x) (eq? (car x) 'ext)))

(define (make-exponentiation ex)

(define (base x)
  (cadr x))
(define (exponent x)
  (caddr x))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) (caddr p))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (=number? ex num)
  (and (number? ex) (= ex num)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

