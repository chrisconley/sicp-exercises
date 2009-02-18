(define tolerance 0.00001)

(define (average x y)
  (/ (+ x y) 2))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; phi^2 = phi + 1
; phi = 1 + 1/phi
; x = 1 + 1/x

(define (gr)
  (fixed-point (lambda (y) (+ 1 (/ 1 y)))
               1.0))

(gr)

