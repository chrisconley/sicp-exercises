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

(define (mult a b n)
  (cond ((= kh 0) 1)
        ((even? (/ a h) 2)
        (else 4))))

(define (sum-with-mult term a next b n)
  (if (> a b)
      0
      (* (mult) (+ (term a) 
                    (sum term (next a) next b)))))

(define (simpson-integral f a b n)
  (define (h) (/ (- b a) n))
  (define (add-kh x) (+ x (h)))
  (* (sum f a add-kh b)
     (/ (h) 3)))

(simpson-integral cube 0 1 100.0)