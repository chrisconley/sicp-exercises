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
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (square x)
  (* x x))

(define (car? count n)
  (cond ((= count (- n 1)) true)
        ((fermat-test count n) (car? (+ count 1) n))))

