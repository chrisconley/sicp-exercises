(define (width interval)
  (/ (abs (- (upper-bound interval) (lower-bound interval))) 2))

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

(define (div-interval x y)
  (mul-interval x
                 (make-interval (/ 1.0 (upper-bound y))
                                (/ 1.0 (lower-bound y)))))

(define (make-interval a b) (cons a b))

(define (lower-bound interval)
  (car interval))

(define (upper-bound interval)
  (cdr interval))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define small-interval
  (make-interval 2.4 2.6))
(define big-interval
  (make-interval 3.4 3.6))

(define summed-interval
  (add-interval small-interval big-interval))
summed-interval
(width summed-interval)
(+ (width small-interval) (width big-interval))

(define subbed-interval
  (sub-interval summed-interval big-interval))
subbed-interval
(width subbed-interval)
(- (width summed-interval) (width big-interval))

(define multed-interval
  (mul-interval small-interval big-interval))
multed-interval
(width multed-interval)
(* (width small-interval) (width big-interval))

(define divved-interval
  (div-interval small-interval big-interval))
divved-interval
(width divved-interval)
(/ (width small-interval) (width big-interval))