(define (div-interval x y)
  (if (spans-zero? y)
      "Error: The interval you are dividing by spans zero"
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

; true if the sum of the absolute values of the bounds are greater than
; the absolute value of the sum of the bounds
(define (spans-zero? y)
  (> (+ (abs (lower-bound y)) (abs (upper-bound y))) 
     (abs (+ (lower-bound y) (upper-bound y)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (add-interval x
                (make-interval (* -1 (lower-bound y))
                               (* -1 (upper-bound y)))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (make-interval a b) (cons a b))

(define (lower-bound interval)
  (car interval))

(define (upper-bound interval)
  (cdr interval))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define zero-interval
  (make-interval -.1 .1))
(define small-interval
  (make-interval 2.4 2.6))
(define big-interval
  (make-interval 3.4 3.6))

(div-interval small-interval big-interval)
(div-interval small-interval zero-interval)
