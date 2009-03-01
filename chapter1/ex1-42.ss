(define (inc x)
  (+ x 1))

(define (square x)
  (* x x))

(define (compose-it f g)
  (lambda (x) (f (g x))))


((compose-it square inc) 6)