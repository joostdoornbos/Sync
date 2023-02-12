#lang racket


(define (double n) (* n 2))

(define (halve n) (/ n 2))

(define (multiply-iter a b n)
  (if (= 0 n)
      a
      (if (even? b)
          (multiply-iter a (double b) (halve n))
          (multiply-iter (+ a b) b (- n 1)))))

(define (multiply b n) (multiply-iter 0 b n))
