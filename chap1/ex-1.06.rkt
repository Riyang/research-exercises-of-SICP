; Exercise 1.6
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)
; => 5

(new-if (= 1 1) 0 5)
; => 0

; it seems no wrong.
; but what if we try this:
(define (p) (p))
(if (= 1 1) 0 (p))
(new-if (= 1 1) 0 (p))

; you will figure out that the procedure above makes an endless process.
; why?
; I can tell you that, the reason is just like Exercise 1.5.
; the orders of evaluation are different:
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



; SOMETHING ELSE:
; I guess, every procedure(or function, operator),
; which created from define-expression,
; is based on applicative-order evaluation.
