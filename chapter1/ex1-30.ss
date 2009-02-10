(define (cube x) (* x x x))

(define (sumr term a next b)
  (if (> a b)
      0
      (+ (term a) 
         (sumr term (next a) next b))))

(define (sum-cubesr a b)
  (define (inc x) (+ x 1))
  (sumr cube a inc b))

(sum-cubesr 1 10)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (sumi term a next b)
  (define (iter a result)
    (if (= a b)
        (+ (term a) result)
        (iter (next a) (+ result (term a)))))
  (iter (next a) (term a)))

(define (sum-cubesi a b)
  (define (inc x) (+ x 1))
  (sumi cube a inc b))

(sum-cubesi 1 10)
