;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex1-04) (read-case-sensitive #f) (teachpacks ()) (htdp-settings #(#f constructor mixed-fraction #f #f none #f ())))
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; (if (> b 0) + -) evaluates to either + or - depending what sign b has
; so you're left with (+ a b) if b is positive and (- a b) b is negative

(a-plus-abs-b 5 -7)
(a-plus-abs-b 5 7)