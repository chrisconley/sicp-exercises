(define (cont-frac-i n d k)
  (define (iter current-value count)
    (display current-value)
    (newline)
    (if (= count 0)
        current-value
        (iter (/ (n count) (- (d count) current-value)) (- count 1))))
  (iter 2 k))

(define (tan-cf x k)
  (cont-frac-i (lambda (i)
                 (if (= i 0)
                     x
                     (* x x)))
               (lambda (i)
                 (- (* i 2) 1))
               k))
(tan-cf 1.0 9)

