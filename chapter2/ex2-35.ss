(define (accumulate op initial sequence)
 (if (null? sequence)
     initial
     (op (car sequence)
         (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(enumerate-tree (list 1 (list 2 3(list 3 4)) 5))

; this is bit of a cheat since i'm using enumerate-tree instead of map
(define (count-leaves t)
  (accumulate (lambda (x y) (+ 1 y)) 0 (enumerate-tree t)))

(count-leaves (list 1 4 5 5 (list 2 3 4(list 3 4)) 5))