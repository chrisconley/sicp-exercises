(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1 )))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (square n)
  (* n n))

(define (sfp count n)
  (define (timed-prime-test n)
    (start-prime-test n (current-process-milliseconds)))
  (define (start-prime-test n start-time)
    (if (fast-prime? n 50)
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

; The time for 1 million with the fast-prime? procedure should be similar to the time
; for 1000 with the prime? procedure.

; (random) can't handle numbers larger than 4294967087 so the last two tests are worthless.
; But the search for 1million does run much faster(0 or 1 milliseconds)
; The time can be changed by increasing the amount of times the fermat-test is applied.