#lang racket


(define (sum start end f step)
  (if (> start end)
      0
      (+ (f start) (sum (step start) end f step))))

(define (inc k) (+ k 1))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (coef k)
    (cond ((= 0 k) 1)
          ((= n k) 1)
          ((even? k) 2)
          (else 4)))
  (define (term k)
    (* (f (+ a (* k h))) (coef k) 1.0))
  (/ (* (sum 0 n term inc) h) 3))
