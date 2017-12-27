; Exercise 1.12
(define (Y row column)
  (cond ((= column 1) 1)
        ((= column row) 1)
        (else (+ (Y (- row 1) (- column 1))
                 (Y (- row 1) column)))))
