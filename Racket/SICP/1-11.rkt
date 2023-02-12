#lang racket


(define (f n) (if (< n 3)
                  n
                  (+ (f (- n 1))
                     (* (f (- n 2)) 2)
                     (* (f (- n 3)) 3))))

(define (g-iter x y z n)
  (if (= n 2)
      x
      (g-iter (+ x (* 2 y) (* 3 z)) x y (- n 1))))

(define (g n) (if (> n 2) (g-iter 2 1 0 n) n))

(f 10)

(g 10)
