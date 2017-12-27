; Exercise 1.3
;Define a procedure that takes three numbers as arguments and ruturns
;the sum of the squares of the two larger numbers.

;;the names of the procedure from other learner:
;;Exercise1.3, sum-sq-max-two, largest-two-square-sum, sum-of-squared-largest-two,
;;sum-of-squares-of-two-largest, sumsqrs-largest, sum-max2-sqr, sum-sq-max2

;(define (sum-squares-larger x y z ) ;;how to name the procedure?
;  (+ (squares (max (max x y) z))
;     (squares ())))
;how to compute the middle number?
;(min (max 2 3) 1) = 1 ;wrong!
;(max (min 1 2) 3) = 3 ;wrong!
;(max (min x y) (min y z))
;(max (min 1 2) (min 2 3)) = 2 ;right!
;(max (min 2 1) (min 1 3)) = 1 ;wrong! how to change it?
;(max (min 1 3) (min 3 2)) = 2 ;right!

;;the worst method:
(define (sum-squares-larger x y z )
  (cond ((= x (min (min x y) z)) (+ (square y) (square z)))
        ((= y (min (min x y) z)) (+ (square x) (square z)))
        ((= z (min (min x y) z)) (+ (square x) (square y)))))
(define (square x) (* x x))
;;another:
(define (sum-squares-max2 a b c)
  (- (+ (square a) (square b) (square c))
     (square (min (min a b) c))))
;;the third:
(define (sum-sq-max2 a b c)
  (if (> a b)
      (+ (square a) (square (max b c)))
      (+ (square b) (square (max a b)))))
;;the fourth:
(define (largest-two-square-sum x y z) 
   (sum-of-squares (mid x y z) (biggest x y z)))
;the key:
(define (mid x y z)
  (max (min x y)
       (min (max x y) z)))
;;the fifth, a beautiful one:
(define (ex13 x y z) 
   (+ (if (or (>= x y) (>= x z)) (* x x) 0) 
      (if (or (> y x) (>= y z)) (* y y) 0) 
      (if (or (> z x) (> z y)) (* z z) 0)))
;;the sixth one:
(define (Ymax x y)
  (if (> x y) 
      x 
      y))   
(define (Ymin x y) 
  (if (< x y) 
      x 
      y))   
;; sum of squares 
(define (sos x y) (+ (square x) (square y)))   
;; sum of squares of the two max numbers in a triple 
(define (sos_two_max x y z) 
  (sos (max x y) (max (min x y) z)))
;;the seventh method:
(define (sum-sq-max2 a b c)
  (if (< a b)
      (sum-sq-max2 b a c)
      (if (< b c)
          (sum-sq-max2 a c b)
          (+ (* a a) (* b b)))))

;;test:
;(sum-squares-larger 1 2 3)
;(sum-squares-larger 2 3 1)
;(sum-squares-larger 3 1 2)
;(sum-squares-larger 3 2 1)
;(sum-squares-larger 2 1 3)
;(sum-squares-larger 1 3 2)
;(sum-squares-larger 1 2 2)
;(sum-squares-larger 2 1 2)
;(sum-squares-larger 2 2 1)
;(sum-squares-larger 1 1 1)

;;further more:
;;what if we want to enlarge arguments? 4 arguments, 5, 6, ..., n?
;;I think that if we just use the confidition, it will be very complicated.
;;There's another method, use recursion or iteration.
;;for instance:
(define (sum-sq-max-two a b c d)
  (cond ((< a b) (sum-sq-max-two b a c d))
        ((< b c) (sum-sq-max-two a c b d))
        ((< c d) (sum-sq-max-two a b d c))
        (else (+ (square a) (square b))))) ;;here, a>=b>=c>=d? It's right! True! Research harder!
;;well, I use a normal method to sort a b c d. I think there're some
;;more intelligent method to do that. I don't know how yet, but I'll
;;figure out one day.

;;well, tlehman was wrong:
;;https://github.com/tlehman/sicp-exercises/blob/master/ex-1.03.scm
;(define (sum-sq-max-two a b c)
;  (define (max x y) (if (< x y) y x))
;  (+ (square (max a b)) (square (max b c))))
	
;(sum-sq-max-two 2 3 4)
; => 25

;what if I try to compute (sum-sq-max-two 2 4 3)?
;;;;;;;;;;
;;I've wrote a full test for (sum-sq-max-two 2 4 3), which has 10 expressions.
;;If your procedure pass my 10 expresses, than it is right.
