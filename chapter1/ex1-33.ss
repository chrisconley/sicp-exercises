
(define (square x) (* x x))
(define (inc x) (+ x 1))

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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Recursive ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (filtered-accumulater combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((prime? a) (combiner (term a)
                              (filtered-accumulater combiner null-value term (next a) next b)))
        (else (filtered-accumulater combiner null-value term (next a) next b))))
            
(define (sum-squares-primes a b)
  (filtered-accumulater + 0 square a inc b))

(sum-squares-primes 1 9)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Iterative ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (accumulatei combiner null-value term a next b)
  (define (iter a result)
    (if (= a b)
        (combiner (term a) result)
        (iter (next a) (combiner result (term a)))))
  (iter (next a) (term a)))

(define (product-cubesi a b)
  (accumulatei * 1 cube a inc b))

(define (sum-cubesi a b)
  (accumulatei + 0 cube a inc b))

(product-cubesi 1 4)
(sum-cubesi 1 4)