; Exercise 1.2
;                                4
;        5 + 4 + (2 - (3 - (6 + ---)))
;                                5
;        -----------------------------
;              3(6 - 2)(2 - 7)
; What is it?
; Some thing: () / ()
; What is the first ()?
; An expression of addtion of three arguments: 5 + 4 + ()
; What is the second ()?
; An expression of multiplication of three arguments: 3 * () * ()
; What is the last arguments of the addtion?
; (2 - ())
; then?
; (2 - (3 - ()))
; and?
; (2 - (3 - (6 + ())))
; the last?
; (2 - (3 - (6 + (4 / 5))))
; What is the second argument of the multiplication?
; (6 - 2)
; What is the third argument of the multiplication?
; (2 - 7)
; Well done, that's all we need to know.
; Then, we can combine it all.
; Let's try to use lisp in the order above:
; (/ () ())
; (/ (+ 5 4 ())
;    (* 3 () ()))
; (/ (+ 5 4 (- 2 ()))
;    (* 3 (- 6 2) (- 2 7)))
; (/ (+ 5 4 (- 2 (- 3 ())))
;    (* 3 (- 6 2) (- 2 7)))
; (/ (+ 5 4 (- 2 (- 3 (+ 6 ()))))
;    (* 3 (- 6 2) (- 2 7)))
; (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
;    (* 3 (- 6 2) (- 2 7)))
; The final expression is:
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))
