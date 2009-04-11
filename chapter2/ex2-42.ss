;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; library ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
 (if (null? sequence)
     initial
     (op (car sequence)
         (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (unique-triples n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k) (list i j k))
                             (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (make-triple-sum triple)
  (append triple (accumulate + 0 triple)))

(define (sum-equals-s? triple s)
  (= (accumulate + 0 triple) s))

(define (s-sum-triples n s)
  (map make-triple-sum
       (filter (lambda (i) (sum-equals-s? i s)) (unique-triples n))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Exercise 2.42 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (queens board-size)
  (define empty-board (list))
;    (map (lambda (i) (list)) 
;     (enumerate-interval 1 board-size)))
  (define (adjoin-position row k rest-of-queens)
    (cons (list row k) rest-of-queens))
  (define (safe? k positions)
    (cond ((> k 1)
           (display "pos: ")
           (display positions)
           (newline)
           (display "car")
           (display (car (car positions)))
           (newline)
           (display "cdr")
           (display (car (cadr positions)))
           (newline)))
    (if (= k 1)
        true
        (not (= (car (car positions)) (car (cadr positions))))))
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))
(queens 2)

            ;
  