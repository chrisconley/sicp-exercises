

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-center-percent c p)
  (make-interval (- c (* c p)) (+ c (* c p))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (percent i)
  (/ (width i) (center i)))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

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

(define (make-interval a b) (cons a b))

(define (lower-bound interval)
  (car interval))

(define (upper-bound interval)
  (cdr interval))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define interval-a (make-center-percent 2 .05))
(define interval-b (make-center-percent 4 .05))
(define product-ab (mul-interval interval-a interval-b))
product-ab
(center product-ab)
(percent product-ab) 
; (percent (mul-interval interval-a interval-b)) ~= (+ (percent a) (percent b))

; From mul-interval, the product's lower bound becomes the product of the two interval's lower bounds
; and the product's upper bound becomes the product of the two interval's upper bounds
;(make-interval (* (- ca (* ca pa)) 
;                  (- cb (* cb pb))) 
;               (* (+ ca (* ca pa)) 
;                  (+ cb (* cb pb))))

; For the lower bound:
; (Ca(1-Pa))(Cb(1-Pb))
; (Ca - CaPa)(Cb - CbPb)
; CaCb - CaCbPa - CaCbPb + CaCbPaPb

; For the upper bound
; (Ca(1+Pa))(Cb(1+Pb))
; (Ca + CaPa)(Cb + CbPb)
; CaCb + CaCbPa + CaCbPb + CaCbPaPb

; To calculate (percent interval) we need the width and center of the interval

; width = (/ (- (upper-bound i) (lower-bound i)) 2)
; ((CaCb + CaCbPa + CaCbPb + CaCbPaPb) - (CaCb - CaCbPa - CaCbPb + CaCbPaPb)) / 2)
; (2CaCbPa + 2CaCbPb) / 2)
; CaCbPa + CaCbPb

; center = (/ (+ (upper-bound i) (lower-bound i)) 2)
; ((CaCb + CaCbPa + CaCbPb + CaCbPaPb) + (CaCb - CaCbPa - CaCbPb + CaCbPaPb)) / 2)
; (2CaCb + 2CaCbPaPb) / 2)
; CaCb + CaCbPaPb

; now to get the percent, we divide the width by the center
; (CaCbPa + CaCbPb) / (CaCb + CaCbPaPb)
; (Pa + Pb) / (1 + PaPb)
; For signicantly small Pa and Pb, PaBb ~= 0 
; therefore the product's percent is Pa + Pb

