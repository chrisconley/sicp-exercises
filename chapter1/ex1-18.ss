(define (mult a b)
  (iter 0 a b))

(define (iter a b n)
  (cond ((= n 2) (+ a (dbl b)))
        ((even? n) (iter a (dbl b) (/ n 2)))
        (else (iter (+ a b) b (- n 1)))))

(define (dbl x)
  (* x 2))
(define (halve x)
  (/ x 2))

(mult 4 700)