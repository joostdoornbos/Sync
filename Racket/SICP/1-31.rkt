#lang racket


(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))  

(define (product term a next b)
  (define (product-iter a result)
    (if (> a b)
        result
        (product-iter (next a) (* result (term a)))))
  (product-iter a 1))

(define (factorial n) (product id 1 plus-one n))
(define (plus-one x) (+ 1 x))
(define (id x) x)

(factorial 10)

(define (wallis num-steps)
  (define (wallis-term x)
    (if (odd? x)
        (/ (+ 1 x) (+ 2 x))
        (/ (+ 2 x) (+ 1 x))))
  (product wallis-term 1 plus-one num-steps))

(wallis 5)

(define (product-recursive term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-recursive term (next a) next b))))

(product-recursive id 1 plus-one 10)
