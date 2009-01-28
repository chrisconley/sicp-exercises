(define (funcr n)
  (if (< n 3)
      n
      (+ (funcr (- n 1)) (funcr (- n 2)) (funcr (- n 3)))))

(funcr 2)
(funcr 3)
(funcr 5)
(funcr 11)
(funcr 27)

(define (funci n)
  (define (func-iter p1 p2 p3 count)
    (if (= count n)
        (+ p1 p2 p3)
        (func-iter (+ p1 p2 p3) p1 p2 (+ count 1))))
  (if (< n 3)
      n
      (func-iter 2 1 0 3)))

(funci 2)
(funci 3)
(funci 5)
(funci 11)
(funci 27)