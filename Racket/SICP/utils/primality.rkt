#lang racket


(define (prime? x)
  (define (divides? a b)
    (= (remainder b a) 0))
  (define (square x)
    (* x x))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ 1 test-divisor)))))
  (define (smallest-divisor n)
    (find-divisor n 2))
  (if (< x 2)
      #false
      (= (smallest-divisor x) x)))

(define (coprime? x y)
  (= (gcd x y) 1))
