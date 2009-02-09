(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test count n)
  (= (expmod count n n) count))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test 10 n) (fast-prime? n (- times 1)))
        (else false)))

(define (square x)
  (* x x))

(define (car? count n)
  (if (= count (- n 1))
      true
      (if (fermat-test count n)
          (car? (+ 1 count) n)
          false)))
  
  ;(cond ((and (= count (- n 1)) (fast-prime? n 10) true))
  ;      ((fermat-test count n) (car? (+ count 1) n))))

(car? 1 17)
(car? 2 1105)

