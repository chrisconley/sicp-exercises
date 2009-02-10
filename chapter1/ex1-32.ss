(define (cube x) (* x x x))
(define (inc x) (+ x 1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Recursive ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (accumulater combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulater combiner null-value term (next a) next b))))
            
(define (product-cubesr a b)
  (accumulater * 1 cube a inc b))

(define (sum-cubesr a b)
  (accumulater + 0 cube a inc b))

(product-cubesr 1 4)
(sum-cubesr 1 4)

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