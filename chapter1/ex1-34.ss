(define (square x)
  (* x x))

(define (f g)
  (g 2))

(f square)

(f (lambda (z) (* z (+ z 1))))

(f f)
; using substitution, (f f) because (f (f 2))
; this results in an error because f expects a procedure as its argument
; 2 is not a procedure of course :)