; Exercise 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

;Exercise 1.3
(define (sum-square-largers x y z)
  (cond ((and ((< x y) (< x z))) (+ (* y y) (* z z)))
        ((and ((< y x) (< y z))) (+ (* x x) (* z z)))
        (else (+ (* x x) (* y y)))))

; Exercise 1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

#| So if b > 0, the if expression returns + and the function is equal to a + b,
and, because b is positive, a + (abs b) is just a + b, so everything works 
but if b <= 0, the if expression returns - and the function is equal to a - b,
because b is negative (or 0), a + (abs b) = a + (- b) = a - b, so it also works|#

;Exercise 1.5

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

#| In normal-order evaluation, the interpreter would just return 0 after checking
that x = 0, but in application order evaluation the interpreter would first try
to evaluate (p), wich would just give (p) then it will try again to evaluate (p),
wich gives us an infinite loop |#


      
