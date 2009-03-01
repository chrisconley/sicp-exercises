(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (iterative-improve close-enough? improve)
  (define (try guess)
    (let ((next (improve guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (lambda (guess) (try guess)))

(define (mysqrt x)
  ((iterative-improve 
    (lambda (guess next) (< (abs (- (square guess) x)) 0.00001))
    (lambda (guess) (average guess (/ x guess))))
   1.0))

(mysqrt 25)

(define (fixed-point f first-guess)
  ((iterative-improve 
    (lambda (guess next) (< (abs (- guess next)) 0.00001))
    (lambda (guess) (f guess)))
   first-guess))

(fixed-point cos 1.0)