;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Exercise 1.31a ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (cube x) (* x x x))
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
            
(define (sum-squares-primesr a b)
  (filtered-accumulater + 0 square a inc b))

(sum-squares-primesr 1 5)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Iterative ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (filtered-accumulatei combiner null-value term a next b)
  (define (iter a result)
    (cond ((= a b) (combiner (term a) result))
          ((prime? a) (iter (next a) (combiner result (term a))))
          (else (iter (next a) result))))
  (iter (next a) (term a)))

(define (sum-squares-primesi a b)
  (filtered-accumulatei + 0 square a inc b))

(sum-squares-primesi 0 5)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Exercise 1.31b ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (my-gcd a b)
  (if (= b 0)
      a
      (my-gcd b (remainder a b))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Recursive ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (filtered-accumulater combiner null-value term a next b)
  (cond ((= a b) null-value)
        ((= (my-gcd a b) 1) (combiner (term a)
                                      (filtered-accumulater combiner null-value term (next a) next b)))
        (else (filtered-accumulater combiner null-value term (next a) next b))))
            
(define (sum-relative-primesr b)
  (filtered-accumulater * 1 identity 1 inc b))

(sum-relative-primesr 10)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Iterative ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (filtered-accumulatei combiner null-value term a next b)
  (define (iter a result)
    (cond ((= a b) (combiner null-value result))
          ((= (my-gcd a b) 1) (iter (next a) (combiner result (term a))))
          (else (iter (next a) result))))
  (iter (next a) (term a)))

(define (sum-relative-primesi b)
  (filtered-accumulatei * 1 identity 1 inc b))

(sum-relative-primesi 10)