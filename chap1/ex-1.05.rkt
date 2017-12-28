; Exercise 1.5
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

; ---- Analysis ----
; What's the value of (test 0 (p))?
; There are two models(orders) of evaluation:
; Applicative Order and Normal Order
; In applicative order:
; the interpreter will first evaluates test and 0, (p),
; and then applies test to 0 and (p).
; What's test?
; We can see it in its definition, it's an if expression.
; What's 0 and (p)?
; Well, 0 is 0 itself. But what is (p)?
; We can also see the definition of (p). What is it?
; What is (define (p) (p))? Did it tell us what the (p) is?
; No. (p) is nothing we can know.
; Thus, if the interpreter evaluates the operand (p),
; it will do an endless evaluation.
; So, if your interpreter to evaluate (test 0 (p)),
; you will get nothing, just make the interpreter do an endless work.
;
; In normal order:
; The interpreter will not evaluate the operands
; until their values were needed.
; So, when it evaluate (test 0 (p)), it will not evaluate the values
; of 0 and (p), until it needs it.
; (test 0 (p)) will just applies test to 0 and (p).
; it will come to the if expression of test's definition.
; (if (= x 0) 0 y)
; Here, x is 0,
; so, (test 0 (p)) is 0.
