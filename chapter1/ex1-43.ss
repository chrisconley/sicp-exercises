(define (square x)
  (* x x))

(define (compose-it f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter g count)
    (if (= count 1)
        g 
        (iter (compose-it f g) (- count 1))))
  (iter f n))

((repeated square 2) 5)