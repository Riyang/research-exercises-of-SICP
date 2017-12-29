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
; Applicative Order and Normal Order.
;
; In applicative order:
; the interpreter will first evaluates test and 0, (p),
; and then applies test to 0 and (p).
; What's test?
; We can see it in its definition, it's an if expression.
; What's 0 and (p)?
; Well, 0 is 0 itself. But what is (p)?
; We can also see the definition of (p). What is it?
; What does (define (p) (p)) mean? Did it tell us what the (p) is?
; No. It told us that (p) is (p) itself.
; It's just like that:
; I ask, "what's your name?"
; You answer, "My name is my name."
; So, it's bullshit.
; (p) is nothing we can know.
; Thus, if the interpreter evaluates the operand (p),
; it will do an endless evaluation.
; So, if your interpreter to evaluate (test 0 (p)),
; you will get nothing, but just make the interpreter do an endless work.
;
; In normal order:
; The interpreter will not evaluate the operands,
; until their values were needed.
; So, when it evaluate (test 0 (p)), it will not evaluate the values
; of 0 and (p), until it needs it.
; (test 0 (p)) will just applies test to 0 and (p).
; It will come to the if expression of test's definition:
; (if (= x 0) 0 y)
; What is x? x is the first argument of test.
; So, what is it? Of course, it is 0.
; And then?
; (if (= x 0) 0 y) is 0.
; Thus, (test 0 (p)) is 0.
;
; In general:
; When you evaluate (test 0 (p)) on your interpreter,
; if you get nothing, it means your interpreter uses applicative-order evaluation;
; if you get 0, it means your interpreter uses normal-order evaluation.
;
; That's it.
