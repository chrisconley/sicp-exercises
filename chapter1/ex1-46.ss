(define (iterative-improve good-enough improve)
  (lambda (guess) (if (good-enough? guess x)
                        guess
                        (sqrt-iter (improve guess x) x))))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt x)
  ((iterative-improve 
    (lambda (guess) (< (abs (- (square guess) x)) 0.001))
    (lambda (guess) (average guess (/ x guess)))
    1.0)))

(sqrt 25)

(define (fixed-point f first-guess)
  ((iterative-improve good-enough? improve) first-guess))

(fixed-point cos 1.0)