; Exercise 1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; test
(a-plus-abs-b 1 1)
; => 2

(a-plus-abs-b 1 -1)
; => 2

(a-plus-abs-b 1 0)
; => 1

; it can work, so operators can be some complicated expressions.
; here, in this example,
; if b > 0, then (a-plus-abs-b a b) = (+ a b);
; else, which means b = 0 or b < 0, then (a-plus-abs-b a b) = (- a b).
; Thus, (a-plus-abs-b a b) is really computes: a plus the absolute value of b.
