; Section 1.2.5 Greatest Common Divisors

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

#| Exercise 1.20
Normal-order evaluation
 (gcd 206 40)
 (= 40 0) -> #f
 (gcd 40 (remainder 206 40)
 (= (remainder 206 40) 0)
 (= 6 0) -> #f
 (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
 (= (remainder 40 (remainder 206 40)) 0)
 (= (remainder 40 6) 0)
 (= 4 0) -> #f
 (gcd (remainder 40 6) (remainder 6 (remainder 40 (remainder 206 40))))
 (= (remainder 6 (remainder 40 6)) 0)
 (= (remainder 6 4) 0)
 (= 2 0) -> f
 (gcd (remainder 6 (remainder 40 6)) (remainder (remainder 40 6) (remainder 6 (remainder 40 6))))
 (= (remainder (remainder 40 6) (remainder 6 (remainder 40 6))) 0)
 (= (remainder 4 2) 0)
 (= 0 0) -> #t
 (remainder 6 (remainder 40 6))
 (remainder 6 4)
 2

Applicative-order evaluation
 (gcd 206 40)
 (= 40 0) -> #f
 (gcd 40 (remainder 206 40))
 (gcd 40 6)
 (= 6 0) -> #f
 (gcd 6 (remainder 40 6))
 (gcd 6 4)
 (= 4 0) -> #f
 (gcd 4 (remainder 6 4))
 (gcd 4 2)
 (= 2 0) -> #f
 (gcd 2 (remainder  4 2))
 (gcd 2 0)
 (= 0 0) -> #t
 2
#|
