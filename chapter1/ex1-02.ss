;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex1-2) (read-case-sensitive #f) (teachpacks ()) (htdp-settings #(#f constructor mixed-fraction #f #f none #f ())))

; 5 + 4 + (2 - (3 - (6 + 4/5))) = 14.8
; 3(6 - 2)(2-7) = -60
; 14.8 / -60 = -0.2467

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) 
   (* 3 (- 6 2 ) (- 2 7)))

