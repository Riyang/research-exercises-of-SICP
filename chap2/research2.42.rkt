;;Exercise 2.42
(load "~/section2.2.3.rkt")

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board '())
;(define (safe? k positions)
;  (and ()  ;;k's row is different from other k-1's rows
;       ()));;k's row is not on the diagonal lines of the other k-1's.
(define (safe? k positions)
  (define (iter index)
    (define (test-row index)
      (let ((k-row (list-ref positions (- k 1)))
            (index-row (list-ref positions index)))
        (and (not (= k-row index-row))
             (not (= (abs (- k-row index-row))
                     (- (- k 1) index))))))
    (if (< index 0)
        #true
        (and (test-row index)
             (iter (- index 1)))))
  (iter (- k 2)))
(define (adjoin-position new-row k rest-of-queens)
  (append rest-of-queens (list new-row)))

;-----------------------------------
; rewrite: how?
;-----------------------------------
(define (not-in-list x list)
  (cond ((null? list) #true)
        ((equal? x (car list)) #false)
        (else (not-in-list x (cdr list)))))
(define (RY-queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (filter (lambda (n) (not-in-list n rest-of-queens))
                         (enumerate-interval 1 board-size))))
          (queen-cols (- k 1))))))
  (queen-cols board-size))
