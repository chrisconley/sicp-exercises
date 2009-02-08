(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a ) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square n)
  (* n n))

(define (sfp count n)
  (define (timed-prime-test n)
    (start-prime-test n (current-process-milliseconds)))
  (define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (current-process-milliseconds) start-time))
        (sfp count (+ n 1))))
  (define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time)
    (sfp (- count 1) (+ n 1)))
  ; sfp ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (if (= count 0)
      (display "\ndone")
      (timed-prime-test n)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(sfp 10 (* 1000 1000)) ; 0.3333333
(sfp 6 (* 10000 1000)) ; 2
(sfp 6 (* 100000 1000)) ; 7
(sfp 6 (* 1000000 1000)) ; 21
(sfp 6 (* 10000000 1000)) ; 168.8
(sfp 6 (* 100000000 1000)) ; 505

; The order of growth does fit (sqrt n) exact between 10million and 100million.