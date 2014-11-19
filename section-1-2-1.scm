(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

#| Using this to calculate by hand 3! 
 (factorial 3)
 (= 3 1) -> #f
 returns (* 3 (factorial (- n 1))) = 3*(factorial 2)
 So we have to evaluate (factorial 2)
 (= 2 1) -> #f
 returns (* 2 (factorial (- n 1))) = 2*(factorial 1)
 (factorial 1)
 (= 1 10 -> #t
 returns 1
 going up we find that (factorial 2) = 2*(factorial 1) = 2
 and (factorial 3) = 3*(factorial 2) = 6
 so (factorial 3) evaluates to 6

The Python equivalent would be:

def factorial (n):
    if n == 1:
        return 1
    else:
        return factorial(n - 1)
|#

(define (iter-factorial n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))

#| Let's do 3! again:
 (iter-factorial 3)
 (fact-iter 1 1 3)
 So fact-iter with product = 1, counter = 1, and max-count = 3
 (> 1 3) -> #f
 returns fact-iter counter*product counter+1 max-count
 wich is fact-iter with product = 1, counter = 2, and max-count = 3
 (> 2 3) -> #f
 returns fact-iter counter*product counter+1 max-count
 wich is fact-iter with product = 2, counter = 3, and max-count = 3
 (> 3 3) -> #f
 returns fact-iter counter*product counter+1 max-count
 wich is fact-iter with product = 6, counter = 4, and max-count = 3
 (> 4 3) -> #t
 returns product
 So (iter-factorial 3) will evaluate to 6, as expected.

The Python equivalent would be:

def iter-factorial(n):
    product = 1
    for counter in range(1, n + 1):
        product *= counter
    return product
|#

; Exercise 1.9

(define (inc n)
  (+ n 1))

(define (dec n)
  (- n 1))

(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

#| So how do we evaluate (+ 4 5)?
 (= 4 0) -> #f
 (inc (+ (dec 4) 5))
 (inc (+ 3 5))
 So now we have to evaluate (inc (+ 3 5)):
 (= 3 0) -> #f
 (inc (+ (dec 3) 5))
 (inc (+ 2 5))
  So now we have to evaluate (inc (inc(+ 2 5))):
 (= 2 0) -> #f
 (inc (+ (dec 2) 5))
 (inc (+ 1 5))
 So now we have to evaluate (inc (inc (inc (+ 1 5)))):
 (= 1 0) -> #f
 (inc (+ (dec 1) 5))
 (inc (+ 0 5))
 So now we have to evaluate (inc (inc (inc (inc (+ 0 5))))):
 (= 0 0) -> #t
 returns 5, so going back now we have:
 (inc (inc (inc (inc 5))))
 (inc (inc (inc 6)))
 (inc (inc 7))
 (inc 8)
 9
|#

(define (+ a b)
 (if (= a 0)
     b
     (+ (dec a) (inc b))))

#| So how do we evaluate (+ 4 5)?
 (= 4 0) -> #f
 (+ (dec 4) (inc 5))
 (+ 3 6))
So now we have to evaluate (+ 3 6):
 (= 3 0) -> #f
 (+ (dec 3) (inc 6))
 (+ 2 7)
So now we have to evaluate (+ 2 7):
 (= 2 0) -> #f
 (+ (dec 2) (inc 7))
 (+ 1 8)
So now we have to evaluate (+ 1 8):
 (= 1 0) -> #f
 (+ (dec 1) (inc 8))
 (+ 0 9)
So now we have to evaluate (+ 0 9):
 (= 0 0) -> #t
returns 9, so going back now we have:
 (inc (inc (inc (inc 5))))
 (inc (inc (inc 6)))
 (inc (inc 7))
 (inc 8)
9
|#

; Exercise 1.10

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

#| Ackermann's function is a famous example of a total computable function that is not primitive recursive,
and simple arguments like (A 4 3) would be just too much for my computer,
but these cases were simple enough that my computer could actually evaluate them
 (A 1 10) = 1024
 (A 2 4) = (A 3 3) = 65536
|#

(define (f n) (A 0 n))
; (f n) = 2*n

(define (g n) = (A 1 n))
; (g n) = (A 1 n) = (A 0 (A 1 n-1)) = 2*(A 1 n-1) = 2*2*(A 1 n-2) = ... = 2**(n - 1)*(A 1 1) = 2**n

(define (h n) = (A 2 n))
; (h n) = (A 2 n) = 2^(A 2 n-1) = ... 2^(2^...) n times
