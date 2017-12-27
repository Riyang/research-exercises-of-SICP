;; Exercise 1.6
(define (p) (p))
(if (= 0 0) 0 (p)) ;;value: 0
(cond ((= 0 0) 0)
       (else (p))) ;;value: 0
;;so, if-express and cond-express are both evaluated
;;by normal-order evaluation.
;;so, it's possible to express if-expression using cond-expression.
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
;;try to define sqrt-iter using the new-if expression.
(define (sqrt-iter guess x)
  (cond ((good-enough? guess x) guess)
        (else (sqrt-iter (improve guess x) x))))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average a b)
  (/ (+ a b) 2.0))
(define (square x) (* x x))
