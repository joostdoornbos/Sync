#lang racket


(define (square x) (* x x))

(define (pow-iter a b n)
  (if (= 0 n)
      a
      (if (even? n)
          (pow-iter a (square b) (/ n 2))
          (pow-iter (* a b) b (- n 1)))))

(define (pow b n) (pow-iter 1 b n))
