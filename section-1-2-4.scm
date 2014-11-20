; Section 1.2.4 - Exponentiation

(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(define (iter-expt b n)
  (expt-iter b n 1)

(define (expt-iter b counter product)
  (if (= counter 0)
      product
      (expt-iter b
                 (- counter 1)
                 (* b product))))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (square n) (* n n))

(define (even? n)
  (= (remainder n 2) 0))

; Exercise 1.16

(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (square b) (/ n 2) a))
        (else (fast-expt-iter b (- n 1) (* a b)))))

(define (iter-fast-expt b n)
  (fast-expt-iter b n 1))

; Exercise 1.17

(define (double x) (+ x x))

(define (halve x) (/ x 2))

#| The idea here is that a*b = 2a*(b/2) = (* (double a) (halve b))
which works OK when b is even and
a*b = a*(b - 1) + a
|#

(define (fast* a b)
  (cond ((= b 0) 0)
        ((even? b) (fast* (double a) (halve b)))
        (else (+ a (fast* a (- b 1))))))

; Exercise 1.18

(define (fast*-iter a b c)
  (cond ((= b 0) c)
        ((even? b) (fast*-iter (double a) (halve b) c))
        (else (fast*-iter a (- b 1) (+ a c)))))

(define (iter-fast* a b)
  (fast*-iter a b 0))

; Exercise 1.19

(define (fib n)
  (define  (fib-iter a b p q count)
    (cond ((= count 0) b)
          ((even? count)
           (fib-iter a
                     b
                     (+ (* p p) (* q q))
                     (+ (* 2 p q) (* q q))
                     (/ count 2)))
          (else (fib-iter (+ (* b q) (* a q) (* a p))
                          (+ (* b p) (* a q)) p q (- count 1))))))
