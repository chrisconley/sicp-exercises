(define (mycons x y)
  (lambda (m) (m x y )))

(define (mycar z)
  (z (lambda (p q) p)))

(mycar (mycons 56 47))
(mycar (lambda (m) (m 56 47)))
((lambda (m) (m 56 57)) (lambda (p q) p))
((lambda (p q) p) 56 47)

(define (mycdr z)
  (z (lambda (p q) q)))

(mycdr (mycons 56 47))
(mycdr (lambda (m) (m 56 47)))
((lambda (m) (m 56 57)) (lambda (p q) q))
((lambda (p q) q) 56 47)