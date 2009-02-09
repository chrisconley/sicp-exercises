(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) 
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(integral cube 0 1 0.01)

(define (const k n)
  (cond ((or (= k 0) (= k no)) 1)
        ((even? k) 4)
        (else 2)))

(define (simpson-integral f a b n)
  (define (h) (/ (- b a) n))
  (define (inc x) (+ x (/ 1 n)))
  (* (sum f (* (const a n) (+ a (* a (h)))) inc b)
     (h)))

(simpson-integral cube 0 1 100)


      