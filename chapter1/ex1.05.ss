;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex1.05) (read-case-sensitive #f) (teachpacks ()) (htdp-settings #(#f constructor mixed-fraction #f #f none #f ())))
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

; applicative would replace (p) with (p) then replace (p) with (p) and so on

; normal would result in
; (if (= 0 0)
;     0
;     (p))
; so in this case it would result in zero
; and never evaluate the never ending loop