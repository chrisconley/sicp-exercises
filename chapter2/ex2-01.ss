(define (make-rat n d) (cons n d)
  (let ((g (gcd n d))
        (sign (/ (* n d) (abs (* n d)))))
    (cons (/ n g) (/ d g))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))

(print-rat (make-rat -1 -2))
(print-rat (make-rat 3 -3))