;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Recursive ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (cube x) (* x x x))

(define (productr term a next b)
  (if (> a b)
      1
      (* (term a) 
         (productr term (next a) next b))))

(define (product-cubesr a b)
  (define (inc x) (+ x 1))
  (productr cube a inc b))

(product-cubesr 1 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Iterative ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (producti term a next b)
  (define (iter a result)
    (if (= a b)
        (* (term a) result)
        (iter (next a) (* result (term a)))))
  (iter (next a) (term a)))

(define (product-cubesi a b)
  (define (inc x) (+ x 1))
  (producti cube a inc b))

(product-cubesi 1 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Factorial ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (factorial n)
  (define (inc x) (+ x 1))
  (define (identity x) x)
  (producti identity 1 inc n))

(factorial 6)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Pi ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (converge x)
  (if (even? x)
      (/ (+ x 2.0) (+ x 1.0))
      (/ (+ x 1.0) (+ x 2.0))))

(define (approximate-pi n)
  (define (inc x) (+ x 1))
  (producti converge 1 inc n))

(* 4 (approximate-pi 1000000))