; This sqrt method uses the previous guess to ask if the current guess
; is good_enough? and is written using block structure

(define (my-sqrt x)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; my-sqrt scoped definitions ;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (define (sqrt-iter prev-guess guess)
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; sqrt-iter scoped definitions ;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (define (good-enough?)
      (< (abs (- prev-guess guess)) 0.001))
    (define (improve-guess)
      (average guess (/ x guess)))
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; sqrt-iter ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (if (good-enough?)
      guess
      (sqrt-iter guess (improve-guess))))
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; my-sqrt ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (sqrt-iter 0 1.0))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(my-sqrt 49)