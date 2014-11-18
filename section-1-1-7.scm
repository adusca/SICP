; Exercise 1.6

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (square x) (* x x))

#| This new form will cause an infinite loop  because of applicative order evaluation.
Since new-if is a function, scheme will deal with it as a function and evaluate
everything before the next step. "if" is an exception to that, in wich the
interpreter only evaluate the  pertinent expression, avoiding the infinite loop
|#

; Exercise 1.7

(define (new-good-enough? guess x)
  (< (abs (- (square guess) x)) (* 0.001 guess)))

(define (new-sqrt-iter guess x)
  (if (new-good-enough? guess x)
          guess
          (new-sqrt-iter (improve guess x) x)))

; Exercise 1.8

(define (cube x)
  (* x x x))

(define (cube-iter guess x)
  (if (c-good-enough? guess x)
          guess
          (cube-iter (c-improve guess x) x)))

(define (c-improve guess x)
  (/ (+ (/ x (square guess) (* 2 guess) 3))))

(define (c-good-enough? guess x)
  (< (abs (- (cube  guess) x)) 0.001))

(define (cubert x)
  (cube-iter 1.0 x))
