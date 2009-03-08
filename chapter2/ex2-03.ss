(define (avg a b)
  (/ (+ a b) 2))

(define (make-point x y)
  (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-segment start end)
  (cons start end))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (midpoint-segment s)
  (make-point (avg (x-point (start-segment s)) (x-point (end-segment s)))
              (avg (y-point (start-segment s)) (y-point (end-segment s)))))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

(define seg (make-segment (make-point -5.0 2.0) (make-point 2.0 -4.0)))

(print-point (midpoint-segment seg))

(define (make-rect x y)
  (cons x y))
(define (x-length-rect rect) (car rect))
(define (y-length-rect rect) (cdr rect))

(define (rect-area rect)
  (* (x-length-rect rect) (y-length-rect rect)))

(define (rect-perim rect)
  (+ (* 2 (x-length-rect rect))
     (* 2 (y-length-rect rect))))

(define small-rect (make-rect 3 4))
(rect-area small-rect)
(rect-perim small-rect)

(define (make-rectangle start-point x-length y-length)
  (cons (make-segment start-point (make-point (y-point start-point) (+ x-length (x-point start-point))))
        (make-segment start-point (make-point (x-point start-point) (+ y-length (y-point start-point))))))
(define (y-segment-rect rect) (car rect))
(define (x-segment-rect rect) (cdr rect))

              