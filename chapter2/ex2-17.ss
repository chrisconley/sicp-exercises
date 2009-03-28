(define (my-last-pair list)
  (if (null? (cdr list))
      (car list)
      (my-last-pair (cdr list))))

(my-last-pair(list 23 72 149 34))