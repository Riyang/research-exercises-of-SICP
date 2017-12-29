; Exercise 1.11

; f(n)=n, if n < 3; 
; f(n) = f(n-1) + 2f(n-2) + 3f(n-3), if n >= 3.

; recursive process definition:
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))

; iterative process definition:
(define (f n)
  (if (< n 3)
      n
      (f-iter 2 1 0 n)))
(define (f-iter a b c count)
  (if (= count 0)
      c
      (f-iter (+ a
                 (* 2 b)
                 (* 3 c))
              a
              b
              (- count 1))))

; test:
(f -3)    ; => -3
(f -2)    ; => -2
(f -1)    ; => -1
(f 0)     ; => 0
(f 1)     ; => 1
(f 2)     ; => 2
(f 3)     ; => 4
(f 4)     ; => 11
