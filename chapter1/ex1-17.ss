(define (mult a b)
  (cond ((= b 0) 0)
        ((even? b) (dbl (* a (halve b))))
        (else (+ (mult a (- b 1)) a))))

(define (dbl x)
  (* x 2))
(define (halve x)
  (/ x 2))

(mult 3 7)