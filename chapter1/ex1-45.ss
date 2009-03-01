(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define tolerance 0.00001)

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (mysqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(mysqrt 25)

(define (compose-it f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter g count)
    (if (= count 1)
        g 
        (iter (compose-it f g) (- count 1))))
  (iter f n))

(define (nthrt-exp x n damps)
  (fixed-point ((repeated average-damp damps) (lambda (y) (/ x (fast-expt y (- n 1)))))
               1.0))

(nthrt-exp (fast-expt 5 2) 2 2)
(nthrt-exp (fast-expt 5 3) 3 2)
(nthrt-exp (fast-expt 5 4) 4 2)
(nthrt-exp (fast-expt 5 10) 10 3)
(nthrt-exp (fast-expt 5 20) 20 4)
(nthrt-exp (fast-expt 5 100) 100 6)
(nthrt-exp (fast-expt 2 150) 150 7)

(define (nthrt x n)
  (fixed-point ((repeated average-damp (ceiling (* (log n) 2))) (lambda (y) (/ x (fast-expt y (- n 1)))))
               1.0))

(nthrt (fast-expt 5 2) 2)
(nthrt (fast-expt 5 3) 3)
(nthrt (fast-expt 5 100) 100)
(nthrt (fast-expt 2 250) 250)





