; Exercise 1.6
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; ------------------------------------------------------------------------------

(new-if (= 1 2) 3 4)
; => 4

(new-if (= 1 1) 3 4)
; => 3

; it seems no wrong.
; but what if we try this:
(define (p) (p))
(if (= 1 1) 0 (p))          ; => 0
; (new-if (= 1 1) 0 (p))    ; => ?

; You will figure out that the new-if procedure above makes an endless process.
; Why?
; I can tell you that, the reason is just like Exercise 1.5.
; The orders of evaluation are different:
; the if procedure is based on normal-order evaluation, but
; the new-if procedure is based on applicative-order evaluation.
; Thus,
; (if (= 1 1) 0 (p)) will not evaluate (p) when it is not necessary,
; otherwise,
; (new-if (= 1 1) 0 (p)) will always evaluate every argument, including (p),
; which makes an endless process.

; So, you can work out what will happens
; when Alyssa attempts to use this to compute square roots:
;
; (define (sqrt-iter guess x)
;  (new-if (good-enough? guess x)
;          guess
;          (sqrt-iter (improve guess x)
;                     x)))
;
; Here's my answer:
; ---------------------------------------------------
; What if we try to evaluate (sqrt-iter 1.0 1.0)?
;
; (sqrt-iter 1.0 1.0)
; =>
; (new-if (good-enough? 1.0 1.0)
;         1.0
;         (sqrt-iter (improve 1.0 1.0) 1.0))
; =>
; (new-if #t
;         1.0
;         (sqrt-iter (improve 1.0 1.0) 1.0))
; => ?
; would it be 1.0?
; No.
; Because new-if based on applicative-order evaluation,
; it will evaluate every argument first.
; So, the third argument (sqrt-iter (improve 1.0 1.0) 1.0)) will be evaluated,
; whatever the first, second arguments are.
; What is (sqrt-iter (improve 1.0 1.0) 1.0))?
; (sqrt-iter 1.0 1.0) again.
; So, it became a loop, an endless loop.
;
; The new-if keep asking the evalue of its third argument (sqrt-iter ...),
; but (sqrt-iter ...) will never gives a value back,
; cause it just calls the new-if function,
; which again ask another (sqrt-iter ...)'s value.
; Thus, it will be all endless process, whatever the guess and x are.
;
; You can try to analysis (sqrt-iter 1.0 2.0), (sqrt-iter 2.0 4.0), etc.
; You will figure out.
; The answers are the same, an endless process.
;
; ---------------------------------------------------

; SOMETHING ELSE:
; I guess, every procedure(or function, operator),
; which created from define-expression,
; is based on applicative-order evaluation.

; test
(define (sqrt-iter guess x)
 (new-if (good-enough? guess x)
         guess
         (sqrt-iter (improve guess x)
                    x)))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average a b)
  (/ (+ a b) 2.0))
(define (square x) (* x x))

; try:
; (sqrt-iter 1.0 1.0)
; (sqrt-iter 1.0 2.0)
; (sqrt-iter 2.0 4.0)

; ------------------------------------------------------------------------------
