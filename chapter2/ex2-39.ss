; same definition as accumulate
(define (fold-right op initial sequence)
  ;(display (cdr sequence))
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    ;(display (car rest))
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (reverse-right sequence)
  (fold-right (lambda (x y) 
                ;(display y)
                ;(newline)
                (if (null? y)
                    x
                    (list y x))) 
                null sequence))

(define (reverse-left sequence)
  (fold-left (lambda (x y) (cons y x)) null sequence))

(reverse-right (list 1 2 3 4))
(reverse-left (list 1 2 3 4))