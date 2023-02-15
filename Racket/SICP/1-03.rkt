#lang racket


(define (sum-squares x y) (+ (* x x) (* y y)))

(define (sum-squares-two-largest x y z) (if (> x y) (sum-squares x z) (sum-squares y z)))
