#lang racket


(define (smallest-divisor n) (find-divisor n 2))
(define 
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primesi-helper prime-product counter max-count)
  (if (> counter max_count)
      (list-divisors prime-product)
      (if (prime? counter)
          (search-for-primes (* counter prime-product) (+ 1 counter) max-count)
          (search-for-primes prime-product (+ 1 counter) max-count))))

(define (search-for-primes from to)
  (search-for-primes-helper 1 from to))

