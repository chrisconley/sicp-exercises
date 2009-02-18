(define tolerance 0.00001)

(define (average x y)
  (/ (+ x y) 2))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (logger)
  (fixed-point (lambda (y) (/ (log 1000) (log y)))
               2))

(define (logger-avg)
  (fixed-point (lambda (y) (average y (/ (log 1000) (log y))))
               2))

(logger) ; Without average damping, it takes 35 guesses
(logger-avg) ; With average damping, it only takes 10 guesses


