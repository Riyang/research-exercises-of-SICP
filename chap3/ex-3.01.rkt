; Exercise 3.1
(define (make-accumulator sum)
  (lambda (num)
    (begin (set! sum (+ sum num))
           sum)))

;test:
(define A (make-accumulator 5))
(A 0)     ; => 5
(A 10)    ; => 15
(A 10)    ; => 25

(newline)

(define B (make-accumulator 55))
(B 0)     ; => 55
(B 5)     ; => 60
(B 15)    ; => 75
(B 15)    ; => 90
(B 9)     ; => 99
