(define (cont-frac-i n d k)
  (define (iter current-value count)
    (if (= count 0)
        current-value
        (iter (/ (n count) (+ (d count) current-value)) (- count 1))))
  (iter 1 k))


; Ni is equal to x^2 unless i=1, then it is just x
; Di is equal to (i*2)-1
(define (tan-cf x k)
  (cont-frac-i (lambda (i)
                 (if (= i 1)
                     x
                     (* (* x x) -1)))
               (lambda (i)
                 (- (* i 2) 1))
               k))
(tan-cf 0.5 9)

