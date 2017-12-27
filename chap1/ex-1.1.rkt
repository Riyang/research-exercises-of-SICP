; Exercise 1.1
10
; a number's value is the number itself.

(+ 5 3 4)
; you can add numbers as many as you want, like (+ 1 2 3 4 ...)

(- 9 1)
; what if (- 9 1 2)? Does it mean that 9 - 1 - 2? Test it, research.
; (+ 9 1)'s value is the same as (+ 1 9)'s.
; but (- 9 1), (- 1 9), otherwise. Think about it.

(/ 6 2)
; 3, but you can try something else: (/ 6 2.0), (/ 2 6), (/ 2.0 6), etc.

(+ (* 2 4) (- 4 6))
;   (+ (?) (?))
;-> (* 2 4): ? , (- 4 6): ?
;-> (+ (?) (?)): ?

(define a 3)
; this is a definition of a, which means the value of a is 3.
; also means, a is an astraction of 3, or a name of 3.

(define b (+ a 1))
; b's value is (+ a 1), then what is (+ a 1)?
; we add a by 1, so what is a?
; according to the definition of a, we can know a's value is 3, thus (+ a 1) is 4.
; so, what is b's value?

(+ a b (* a b))
; this is an expression of an addition of three expressions: a, b, and (* a b).
; a: 3, b: 4, (* a b): ?
; (+ a b (* a b)): ?

(= a b)
; the expressions of =, >, <, ... is asking a question, the answer is always Yes or No.
; the value of it, is always #t or #f, which #t means true or Yes, #f means false or No.
; so, a: 3, b: 4, (= a b): ?

(if (and (> b a) (< b (* a b)))
    b
    a)
; what is (and () ())? what is the first ()? then what is the second ()?
; you can figure it out.

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
; what is the value of a? and b?

(+ 2 (if (> b a) b a))
; (+ 2 (?)) -> (+ 2 (if (?) b a)) -> ...

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
; (* () ()) -> (* (cond (?) (?) (?)) (+ a 1)) -> ...

; P.S.: "what if ..." means: what is it, if we try ...
