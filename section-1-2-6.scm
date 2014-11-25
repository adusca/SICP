; Section 1.2.6 - Examples: Testing for Primality

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (square x) (* x x))

(define (divides? a b)
  (= 0 (remainder b a)))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (even? n)
  (= (remainder n 2) 0))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

; Exercise 1.21

(display (smallest-divisor 199))
(newline)
(display (smallest-divisor 1999))
(newline)
(display (smallest-divisor 19999))
(newline)

; Exercise 1.22

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display "*** ")
  (display elapsed-time))

(define (search-next n end) 
  (if (< n end) (timed-prime-test n)) 
  (if (< n end) (search-next (+ n 2) end)))

(define (search-for-primes start end)  
  (search-next (if (even? start) (+ start 1) start) end)) 

(search-for-primes 1000000 1000100)

; Exercise 1.23

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (new-find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (new-find-divisor n (next test-divisor)))))

; Exercise 1.24

(define (start-prime-test n start-time)
  (if (fast-prime? n)
      (report-prime (- (runtime) start-time))))

(search-for-primes 1000000 1000100)

#| Exercise 1.25

a = b (mod m) -> a^n = b^n (mod m)
We used this fact when we defined expmod to avoid dealing with
numbers larger then m. If we'd used fast-exp we would probably  end up 
working with larger numbers

Exercise 1.26

The interpreter is going to evaluate each (expmod ...) separately before
multiplying in all recursive calls, since it is applicative-order
|#

; Exercise 1.27

(define (carmicheal-test n a)
    (= (expmod a n n) a))

(define (carmicheal? n)
  (define (test a)
    (cond ((= a 1) #t)
          ((not (carmicheal-test n a)) #f)
          (else (test (- a 1)))))
  (test (- n 1)))

(carmicheal? 561)

(carmicheal? 6601)
