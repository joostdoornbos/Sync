#lang racket


(define (binom n k) (if (or (= 0 k) (= n k))
                        1
                        (+ (binom (- n 1) k) (binom (- n 1) (- k 1)))))
