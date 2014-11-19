; Section 1.2.2 Tree Recursion

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

; This will reapeat the evaluation of fib(n - 2) two times for each value of n

(define (iter-fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds)
  (cond ((= amount 0) 1)
        ((< amount 0) 0)
        ((= kinds 0) 0)
        (else (+ (cc amount
                     (- kinds 1))
                 (cc (- amount (first-denom kinds)) kinds)))))

(define (first-denom kinds)
  (cond ((= kinds 1) 1)
        ((= kinds 2) 5)
        ((= kinds 3) 10)
        ((= kinds 4) 25)
        ((= kinds 5) 50)))

(count-change 100)

; Exercise 1.11

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

(define (f-iter a b c count)
  (if (= count 2)
      a
      (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))

(define (iter-f n)
  (f-iter 2 1 0 n))

#| 
If I stored the results in a array result[0,1,2,f(3),...]
Then it would start with a = result[2], b = result[1] and c = result[0]
and for each iteration
m = m + 1, wich implies 
a = result[m - 1] -> result[m] = a + 2b + 3c
b = result[m - 2] -> result[m -1]
c = result[m - 3] -> result[m - 2]
f(n) = result[n + 1] = a at iteration m = n + 2
|#

; Exercise 1.12

(define (pascal linha coluna)
  (cond ((< linha 3) 1)
        ((= coluna 1) 1)
        ((= coluna linha) 1)
        ((> coluna linha) 0)
        ((< coluna 1) 0)
        (else (+ (pascal (- linha 1) coluna) (pascal (- linha 1) (- coluna 1)))))) 
