;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise1-2) (read-case-sensitive #f) (teachpacks ()) (htdp-settings #(#f constructor mixed-fraction #f #f none #f ())))
; 5 + 1 + (2 - (3 - (6 + 1/3))) = 11.33
; 3(6 - 2)(2-7) = -60
; 11.33 / -60 = -0.1888 

(/ (+ 5 1 (- 2 (- 3 (+ 6 (/ 1 3))))) (* 3 (- 6 2 ) (- 2 7)))

; -17/90 ~= -0.1888

