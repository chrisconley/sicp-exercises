(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (get-previous-guess guess x)
  (abs (- (+ guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (get-previous-guess guess x) guess)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (my-sqrt x)
  (sqrt-iter 1.0 x))

;For very small numbers, good_enough? will converge on 
;the sqrt of .001 or which looks like it is 0.03125 ~= .333
(my-sqrt 49)

; I think that very large numbers end in an endless loop because
; the program can't deal with such a large number.  Then when it improves the guess,
; the average is still too big, so good-enough? can never converge
;(my-sqrt 430000000000000000000000)

