; I think she's right because the more times you introduce an uncertain number,
; the more uncertain your computations will grow.
; Not sure though because even though you are only representing r1 and r2 once each,
; you are repeatedly applying procedures to those uncertain numbers.
; I would guess that this would have the same affect of growing the uncertainty. But
; this isn't the case in par1 and par2, par2 works better.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

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
(define (print-cp i)
  (display (center i))
  (display " +- ")
  (display (percent i))
  (newline))

(define r1 (make-center-percent 1 .05))
(define r2 (make-center-percent 4 .05))
(print-cp (par1 r1 r2))
(print-cp (par2 r1 r2))
; Lem is right; the two procedures don't produce the same result

(print-cp (div-interval r1 r1))
(print-cp (div-interval r1 r2))

; The result when dividing the bounds into 1 in the div-interval procedure is not exact

