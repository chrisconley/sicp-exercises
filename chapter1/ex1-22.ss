(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (next test-divisor)
  (if (= test-divisor 2)
      3
      (+ test-divisor 2)))

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

(sfp 10 (* 1000 1000)) ; .33333
(sfp 6 (* 10000 1000)) ; 1
(sfp 6 (* 100000 1000)) ; 4
(sfp 6 (* 1000000 1000)) ; 13
(sfp 6 (* 10000000 1000)) ; 84
(sfp 6 (* 100000000 1000)) ; 280

; It does seem to cut the amount of time in half. The questions in the exercise
; make it seem like it shouldn't be this way though.