; In Euler's expansion, Di = (i + 1) * 2/3 if (i + 1) % 3 = 0
; else Di = 1

; This isn't correct, but the iterative procedure below seems to be working
; I think I'm working backwards
(define (cont-frac-r n d k)
  (display (d k))
  (newline)
  (if (= k 1)
      (/ (n k) (+ (d k) (/ (n (- k 1)) (d (- k 1)))))
      (/ (n k) (+ (d k) (cont-frac-r n d (- k 1))))))



(cont-frac-r (lambda (i) 1.0)
             (lambda (i)
               (if (= (remainder (+ i 1) 3) 0)
                   (/ (* (+ i 1) 2) 3)
                   1))
             100)

(define (cont-frac-i n d k)
  (define (iter current-value count)
    ;(display (d count))
    ;(newline)
    (if (= count 0)
        current-value
        (iter (/ (n count) (+ (d count) current-value)) (- count 1))))
  (iter 1 k))

(define (computed-e)
  (+ 2
     (cont-frac-i (lambda (i) 1.0)
                  (lambda (i)
                    (if (= (remainder (+ i 1) 3) 0)
                        (/ (* (+ i 1) 2) 3)
                        1))
                  8)))
(computed-e)


