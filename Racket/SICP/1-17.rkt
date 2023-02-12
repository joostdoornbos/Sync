#lang racket


(define (double n) (* n 2))

(define (halve n) (/ n 2))

(define (multiply a b)
  (if (= 1 b)
      a
      (if (even? b)
          (double (multiply a (halve b)))
          (+ a (multiply a (- b 1))))))
