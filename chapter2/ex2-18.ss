(define (my-length list)
  (if (null? list)
      0
      (+ 1 (my-length (cdr list)))))

(define (my-append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (my-list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))


(define (my-reverse old-list)
  (let ((list-size (my-length old-list)))
    (define (build-list new-list ref)
      (if (= ref 0)
          new-list
          (build-list
           (my-append new-list (list (my-list-ref old-list (- ref 1))))
           (- ref 1))))
    (build-list null list-size)))

(my-reverse (list 1 4 9 16 25))
