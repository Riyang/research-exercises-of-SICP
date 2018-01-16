; Exercise 1.7

; predefine:
(define (Ysqrt x) (sqrt-iter 1.0 x))
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average a b)
  (/ (+ a b) 2.0))
(define (square x) (* x x))

; Part 1: try some small numbers, and some large numbers
; small numbers:
(Ysqrt 0.01)
(Ysqrt 0.0001)
(Ysqrt 0.000001)
(Ysqrt 0.00000001)
(Ysqrt 0.0000000001)
(Ysqrt 0.0000000000000001)

; large numbers:
(Ysqrt 4444444)
(sqrt 4444444)
(Ysqrt 44444444444)
(sqrt 44444444444)
(Ysqrt 44444444444444444)
(sqrt 44444444444444444)

; Part 2: change the good-enough procedure to a better method
(define (good-enough? guess x)
  (< (abs (- (/ (improve guess x) guess) 1))
     0.00001))

; To be continue ...
