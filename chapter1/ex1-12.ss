(define (pascal n k)
  (cond ((or (< k 0) (> k n)) 0 )
        ((or (<= n 1) (= k 0) (= k n )) 1 )
        (else (+ (pascal (- n 1) (- k 1))
                 (pascal (- n 1) k)))))

(pascal 7 3)