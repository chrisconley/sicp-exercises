; This sqrt method uses the previous guess to ask if the current guess
; is good_enough?

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? prev-guess guess)
  (< (abs (- prev-guess guess)) 0.001))

(define (sqrt-iter prev-guess guess x)
  (if (good-enough? prev-guess guess)
      guess
      (sqrt-iter guess 
                 (improve guess x)
                 x)))

(define (my-sqrt x)
  (sqrt-iter 0 1.0 x))

; For very small numbers, good_enough? seems work work marginally better
(my-sqrt .000049)

; Large numbers work much better with this good_enough? method because
; it does not have to square the guess
(my-sqrt 430000000000000000000000000000000000000000000000000000000000)

