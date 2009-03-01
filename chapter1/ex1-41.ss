(define (inc x)
  (+ x 1))

(define (double prcdr)
  (lambda (x) (prcdr 
               (prcdr x))))

(((double (double double)) inc) 5)

(((double (lambda (x) (double 
                       (double x)))) inc) 5)

(((lambda (y) ((lambda (x) (double (double x))) 
               ((lambda (x) (double (double x))) y))) inc) 5)