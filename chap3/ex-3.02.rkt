; Exercise 3.2
(define (make-monitored f)
  (define (mf times)
    (define (dispatch m)
      (cond ((eq? m 'how-many-calls?) times)
            ((eq? m 'reset-count) (set! times 0))
            (else
             (begin (set! times (+ times 1))
                    (f m)))))
    dispatch)
  (mf 0))

; a better way:
(define (make-monitored f)
  (define (mf times)
    (lambda (m)
      (cond ((eq? m 'how-many-calls?) times)
            ((eq? m 'reset-count) (set! times 0))
            (else
             (begin (set! times (+ times 1))
                    (f m))))))
  (mf 0))

; test:
(define s (make-monitored sqrt))
(s 100)                           ; => 10
(s 'how-many-calls?)              ; => 1
(s 25)                            ; => 5
(s 9)                             ; => 3
(s 'how-many-calls?)              ; => 3
(s 'reset-count)                  ; 
(s 4)                             ; => 2
(s 'how-many-calls?)              ; => 1
(s 'how-many-calls?)              ; => 1