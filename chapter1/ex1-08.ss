; This cbrt method uses the previous guess to determine good_enough?
; and is written using block structure

(define (square x)
  (* x x))

(define (cbrt x)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; cbrt scoped definitions ;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (define (cbrt-iter prev-guess guess)
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; cbrt-iter scoped definitions ;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (define (good-enough?)
      (< (abs (- prev-guess guess)) 0.001))
    (define (improve-guess)
      (/ (+ (/ x (square guess)) (* 2 guess)) 3))
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; cbrt-iter ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (if (good-enough?)
      guess
      (cbrt-iter guess (improve-guess))))
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; cbrt ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (cbrt-iter 0 1.0))

(cbrt (* 9 9 9))