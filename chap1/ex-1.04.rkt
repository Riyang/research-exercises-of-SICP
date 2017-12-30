; Exercise 1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; test:
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

; -------------------------------
; something beyond the exercise:
; -------------------------------
(define (abs-of x)
  ((if (> x 0) + -) x))
; test:
(abs-of 1)
(abs-of -1)
(abs-of 0)
; then, we can think about the two operators: + and -, do more tests:
(+ 1)
(+ -1)
(+ 0)
; and try (+), just evaluate (+), without any argument.
(- 1)
(- -1)
(- 0)
; and try (-), just evaluate (-), without any argument.
; something else:
(+ +1)
(- +1)

; Is that funny? Enjoy it. :)
