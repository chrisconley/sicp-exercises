; thanks again to eli for some hints and help
; http://eli.thegreenplace.net/2007/07/25/sicp-sections-211-212/

(define zero 
  (lambda (f)
    (lambda (x) x)))

(define (add-1 n)
  (lambda (f) 
    (lambda (x) (f ((n f) x)))))

(add-1 zero)
(lambda (f)
  (lambda (x) (f ((zero f) x))))
(lambda (f)
  (lambda (x) (f (((lambda (f) (lambda (x) x) f) x)))))
(lambda (f)
  (lambda (x) (f ((lambda (x) x) x))))
(lambda (f)
  (lambda (x) (f x))) ;one

(define one
  (lambda (f)
    (lambda (x) (f x))))

(add-1 one)
(lambda (f)
  (lambda (x) (f ((one f) x))))
(lambda (f)
  (lambda (x) (f (((lambda (f) (lambda (x) (f x)) f) x)))))
(lambda (f)
  (lambda (x) (f ((lambda (x) (f x) x)))))
(lambda (f)
  (lambda (x) (f (f x)))) ;two

(define two
  (lambda (f)
    (lambda (x) (f (f x)))))

