;;Section 2.2.3
;predefine:
(define nil '())
(define square (lambda (x) (* x x)))
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 2))
                 (fib (- n 1))))))
(define (prime? n)
  (define (smallest-divisor n)
    (define (find-divisor n test-divisor)
      (define (divides? a b)
        (= 0 (remainder b a)))
      (cond ((> (square test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
            (else (find-divisor n (+ test-divisor 1)))))
    (find-divisor n 2))
  (= n (smallest-divisor n)))

;two examples:
(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
        ((not (pair? tree))
         (if (odd? tree) (square tree) 0))
        (else (+ (sum-odd-squares (car tree))
                 (sum-odd-squares (cdr tree))))))
(define (even-fibs n)
  (define (next k)
    (if (> k n)
        nil
        (let ((f (fib k)))
          (if (even? f)
              (cons f (next (+ k 1)))
              (next (+ k 1))))))
  (next 0))

;four things: enumerate, filter, map, accumulate
;enumerate:
;for tree:
(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))
;for interval:
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
;filter:
(define (filter predicate sequance)
  (cond ((null? sequance) nil)
        ((not (pair? sequance))    ;;too much work, cause (car sequance) is always not a pair.
         (if (predicate sequance)
             (cons sequance (filter predicate (cdr sequance)))
             (filter predicate (cdr sequance))))
        (else
         (cons (filter predicate (car sequance))
               (filter predicate (cdr sequance))))))
(define (filter predicate sequance)
  (cond ((null? sequance) nil)
        ((predicate (car sequance))
         (cons (car sequance)
               (filter predicate (cdr sequance))))
        (else (filter predicate (cdr sequance)))))
;map:
(define (RY-map proc sequance)
  (if (null? sequance)
      nil
      (cons (proc (car sequance))
            (RY-map proc (cdr sequance)))))
;accumulate:
(define (accumulate op initial sequance)
  (if (null? sequance)
      initial
      (op (car sequance)
          (accumulate op initial (cdr sequance)))))
;--------------------------------------------------
(define (sum-odd-squares tree)
  (accumulate +
              0
              (map square
                   (filter odd?
                           (enumerate-tree tree)))))
(define (even-fib n)
  (accumulate cons
              nil
              (filter even?
                      (map fib
                           (enumerate-interval 0 n)))))
;----
(define (whole-fib n)
  (accumulate cons
              nil
              (map fib
                   (enumerate-interval 0 n))))
;the list of squares of fibonacci sequance:
(define (list-fib-squares n)
  (accumulate cons
              nil
              (map square
                   (map fib
                        (enumerate-interval 0 n)))))
;the product of squares of odds of a sequance:
(define (product-squares-odd-elements sequance)
  (accumulate *
              1
              (map square
                   (filter odd?
                           sequance))))
;test:
(define A (list (list 1 (list 2 3)) (list (list 4 5) (list 6 7))))
(sum-odd-squares A)
(whole-fib 9)
(even-fib 9)
(list-fib-squares 9)
(product-squares-odd-elements (list 1 2 3 4 5))
(product-squares-odd-elements (enumerate-tree A))

;;part2--Nested Mappings
(define (get-ij-pair n)
  (accumulate append
              nil
              (map (lambda (i)                   
                     (map (lambda (j) (list i j))
                          (enumerate-interval 1 (- i 1))))
                   (enumerate-interval 1 n))))
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap (lambda (i)
                          (map (lambda (j) (list i j))
                               (enumerate-interval 1 (- i 1))))
                        (enumerate-interval 1 n)))))
;further more:
(define (permutations s)
  (if (null? s)
      (list nil)
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))
(define (remove item sequance)
  (filter (lambda (x) (not (= x item)))
          sequance))
