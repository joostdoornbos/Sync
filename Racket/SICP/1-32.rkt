#lang racket


(define (accumulate combiner null-value term a next b)
  (define (accumulate-iter a result)
    (if (> a b)
        result
        (accumulate-iter (next a) (combiner result (term a)))))
  (accumulate-iter a null-value))

(define (id x) x)
(define (incr x) (+ 1 x))

(define (product term a next b)
  (accumulate * 1 term a next b))
(define (sum term a next b)
  (accumulate + 0 term a next b))

(product id 1 incr 10)
(sum id 1 incr 100)

(define (accumulate-recursive combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate-recursive combiner null-value term (next a) next b))))

(accumulate-recursive + 0 id 1 incr 100)
