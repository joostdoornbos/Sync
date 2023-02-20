#lang racket


(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (if (filter a)
            (iter (next a) (combiner result (term a)))
            (iter (next a) result))))
  (iter a null-value))

(define (incr x)
  (+ 1 x))
(define (square x)
  (* x x))

(define (prime? x)
  (define (divides? a b)
    (= (remainder b a) 0))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ 1 test-divisor)))))
  (define (smallest-divisor n)
    (find-divisor n 2))
  (if (< x 2)
      #false
      (= (smallest-divisor x) x)))

(define (sum-square-prime a b)
  (filtered-accumulate prime? + 0 square a incr b))

(sum-square-prime 1 1000)

(define (product-coprimes n)
  (define (coprime? x y)
    (= (gcd x y) 1))
  (define (filter x)
    (coprime? x n))
  (define (id x) x)
  (filtered-accumulate filter * 1 id 1 incr n))

(product-coprimes 10)
