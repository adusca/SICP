; Exercise 1.28

(define (square-test a n)
  (if (and (not (or (= a 1) (= a (- n 1))))
           (= (remainder (* a a) n) 1))
      0
      (remainder (* a a) n)))

(define (even? x)
  (= 0 (remainder x 2)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (square-test (expmod base (/ exp 2) m) m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (mr-test n)
  (define (test a)
    (= (expmod a (- n 1) n) 1))
  (and (test 2) (test 7) (test 61)))

