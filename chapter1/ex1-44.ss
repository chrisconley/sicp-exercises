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
  (repeated smooth n) f)

((n-fold-smoothed square 5) 3)