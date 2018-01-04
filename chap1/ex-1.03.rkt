; Exercise 1.3 Define a procedure that takes three numbers as arguments
; and returns the sum of the squares of the two larger numbers.

; ------------------------------------------------------------------------------
; ReadMe:
; Three parts of this file:
; Part 1: Seven Methods for Exercise 1.3
; Part 2: Abstraction for Exercise 1.3
; Part 3: My Nagging, which you can totally ignore it.
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Part 1: Seven Methods for Exercise 1.3
; ------------------------------------------------------------------------------
; predefine:
(define (sqaure x) (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))
; The following two procedure is primitive in my DrRacket(R5RS),
; so I can't redefine them. And they can take arbitrary numbers of arguments,
; but I just use it to take two arguments in this exercise.
;(define (max x y)
;  (if (> x y) x y))
;(define (min x y)
;  (if (< x y) x y))
(define (max-of-three x y z)
  (max (max x y) z))
(define (min-of-three x y z)
  (min (min x y) z))
(define (mid-of-three x y z)
  (max (min x y)
       (min (max x y) z)))


; Method One
; First, get the max-of-three and the mid-of-three,
; then, evaluate the sum-of-squares of them.
(define (sum-of-larger2 a b c)
  (sum-of-squares (max-of-three a b c)
                  (mid-of-three a b c)))

; Method Two
; First, sort the three numbers(from max to min, or min to max),
; then, evaluate the sum-of-squares of the larger two.
(define (sum-of-larger2 a b c)
  (if (< a b)
      (sum-of-larger2 b a c)
      (if (< b c)
          (sum-of-larger2 a c b)
          (sum-of-squares a b))))  ; here, a >= b >= c

; Method Three
; First, we should know which number is the min-of-three,
; then, evaluate the sum-of-squares of the rest two.
(define (sum-of-larger2 a b c)
  (cond ((= a (min-of-three a b c)) (sum-of-squares b c))
        ((= b (min-of-three a b c)) (sum-of-squares a c))
        ((= c (min-of-three a b c)) (sum-of-squares a b))))

; Method Four
; Ignore the min-of-three,
; then, evaluate the sum-of-squares of the larger two.
(define (sum-of-larger2 a b c)
  (if (> a b)
      (sum-of-squares a (max b c))    ; here, (min b c) is the min-of-three
      (sum-of-squares b (max a c))))  ; here, (min a c) is the min-of-three

; Method Five
; a math method
(define (sum-of-larger2 a b c)
  (max-of-three (sum-of-squares a b)
                (sum-of-squares a c)
                (sum-of-squares b c)))

; Method Six
; another math method
(define (sum-of-larger2 a b c)
  (- (+ (square a) (square b) (square c))
     (square (min-of-three a b c))))

; Method Seven
; a special, and beautiful method
(define (sum-of-larger2 a b c)
  (+ (if (or (>= a b) (>= a c)) (* a a) 0)
     (if (or (> b a) (>= b c)) (* b b) 0)
     (if (or (> c a) (> c b)) (* c c) 0)))

; ------------------------------------------------------------------------------
; Part 2: Abstraction for Exercise 1.3
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Part 3: My Nagging, which you can totally ignore it.
; ------------------------------------------------------------------------------

