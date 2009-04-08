(define (accumulate op initial sequence)
 (if (null? sequence)
     initial
     (op (car sequence)
         (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))


(define m (list (list 4 2 1) 
                (list 2 1 2) 
                (list 8 7 6)))
(define n (list (list 4 3 2) 
                (list 1 2 1) 
                (list 9 8 7)))
(define v (list 1 2 3))
(define w (list 4 3 2))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(dot-product v w)

(define (matrix-*-vector m v)
  (map (lambda (mi) (dot-product mi v)) m))

(matrix-*-vector m v)

(define (transpose mat)
  (accumulate-n (lambda (col new-mat) 
                  (cons col new-mat)) 
                null 
                mat))

(transpose m)

(define (matrix-*-matrix m n)
  (let ((ncols (transpose n)))
    (map (lambda (mrow) ; for every row in m 
           (map (lambda (ncol) ; with every column in n
                  (dot-product ncol mrow)) ; apply the dot-product
                ncols))
         m)))

(matrix-*-matrix m n)

