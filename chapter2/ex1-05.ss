; thanks to eli's help
; http://eli.thegreenplace.net/2007/07/25/sicp-sections-211-212/

(define (divides? n a)
  (= (modulo n a) 0))

(define (mycons a b)
  (* (expt 2 a) (expt 3 b)))

(define (iter total count divisor)
  (if (divides? total divisor)
        (iter (/ total divisor) (+ count 1) divisor)
        count))

(define (mycar z)
  (iter z 0 2))

(define (mycdr z)
  (iter z 0 3))

(mycons 3 2)
(mycar (mycons 4 2))
(mycdr (mycons 3 25))
