(define (exptr b n)
  (cond ((= n 0) 1)
        ((= n 1) b)
        (else (iter 1 b n))))

(define (iter a b n)
    (cond ((= n 2) (* a (sqr b)))
          ((even? n) (iter a (sqr b) (/ n 2)))
          (else (iter (* a b) b (- n 1)))))

(define (sqr x)
  (* x x))

(exptr 3 7)
