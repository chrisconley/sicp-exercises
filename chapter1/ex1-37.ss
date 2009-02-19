(define (cont-frac-r n d k)
  (if (= k 0)
      1
      (/ (n k) (+ (d k) (cont-frac-r n d (- k 1))))))

(cont-frac-r (lambda (i) 1.0)
             (lambda (i) 1.0)
             10) ; k = 10 gives you accuracy to 4 digits

(define (cont-frac-i n d k)
  (define (iter current-value count)
    (if (= count 0)
        current-value
        (iter (/ (n count) (+ (d count) current-value)) (- count 1))))
  (iter 1 k))

(cont-frac-i (lambda (i) 1.0)
             (lambda (i) 1.0)
             10)


