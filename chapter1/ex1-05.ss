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