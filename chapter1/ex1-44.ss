(define (square x)
  (* x x))

(define (avg x y z)
  (/ (+ x y z) 3))

(define (compose-it f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter g count)
    (if (= count 1)
        g 
        (iter (compose-it f g) (- count 1))))
  (iter f n))

(define dx 0.00001)
(define (smooth f)
  (lambda (x)
    (avg (f (+ x dx)) (f x) (f (- x dx)))))

(define (n-fold-smoothed f n)
  (lambda (x)
    (repeated ((repeated smooth n) f) x)))

((repeated (n-fold-smoothed square 1) 2) 5)

(n-fold-smoothed square 1)