; This sqrt method uses the previous guess to ask if the current guess
; is good_enough? and is written using block structure

(define (my-sqrt x)
  (define (good-enough? prev-guess guess)
    (< (abs (- prev-guess guess)) 0.001))
  (define (sqrt-iter prev-guess guess)
    (if (good-enough? prev-guess guess)
      guess
      (sqrt-iter guess 
                 (improve guess))))
  (define (improve guess)
    (average guess (/ x guess)))
  (sqrt-iter 0 1.0))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(my-sqrt 49)