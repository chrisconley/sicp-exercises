;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex1-3) (read-case-sensitive #f) (teachpacks ()) (htdp-settings #(#f constructor mixed-fraction #f #f none #f ())))

(define (largest x y z)
  (cond ((and (< x y) (< x z)) (sum-of-squares y z))
        ((and (< y x) (< y z)) (sum-of-squares x z))
        ((and (< z x) (< z y)) (sum-of-squares x y))
        (else "The two largest numbers could not be determined.")))
  
(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (square x) (* x x))

(largest 1 2 3) ; y and z are largest
(largest 2 3 1) ; x and y are largest
(largest 3 1 2) ; x and z are largest
(largest 3 3 1) ; x and y are largest and are equal
(largest 3 3 3) ; the two largest can't be determined
(largest 2 2 3) ; the two largest can't be determined