; Ok, I was way off base here, the correct answer is described very well
; at http://eli.thegreenplace.net/2007/06/21/sicp-section-11/
; My original notes are below



; I believe that the new-if function will return something like
; "compound data structure" as described at the end of video lecture 1a
; This is because it is evaluating 'else-clause' which is just a value and
; sqrt-iter needs to be run as a procedure to return a value.
; Maybe this could be fixed by wrapping else-clause in parens?


(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (my-sqrt x)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; my-sqrt scoped definitions ;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (define (sqrt-iter prev-guess guess)
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; sqrt-iter scoped definitions ;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (define (good-enough?)
      (< (abs (- prev-guess guess)) 0.001))
    (define (improve-guess)
      (average guess (/ x guess)))
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; sqrt-iter ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (new-if (good-enough?)
      guess
      (sqrt-iter guess (improve-guess))))
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; my-sqrt ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (sqrt-iter 0 1.0))

(my-sqrt 49)

; it got caught in an endless loop and wrapping else-clause in parens didn't help

(new-if (= 2 3) 0 (square (square 5)))

; testing new-if returns a correct value so it does know how to evaluate a procedure
; It's gotta have to do something with calling sqrt-iter
; Maybe it can't improve the guess?