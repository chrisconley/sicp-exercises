(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) 
         (sum term (next a) next b))))

(define (sum-cubes a b)
  (define (inc x) (+ x 1))
  (sum cube a inc b))

(sum-cubes 1 10)

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(integral cube 0 1 0.01)

(define (const k n)
  (cond ((or (= k 0) (= k no)) 1)
        ((even? k) 2)
        (else 4)))

(define (simpson-integral f a b n)
  (define (h) (/ (- b a) n))
  (define (add-kh x) (+ x (* (h) (/ 1 n))))
  (* (sum f a add-kh b)
     (h)))

(simpson-integral cube 0 1 100)