(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; (if (> b 0) + -) evaluates to either + or - depending what sign b has
; so you're left with (+ a b) if b is positive and (- a b) b is negative

(a-plus-abs-b 5 -7)
(a-plus-abs-b 5 7)