#| Exercise 1.14

 (count-change 11)
 (cc 11 5)
 (+ (cc 11 4) (cc -39 5))
 So we have to evaluate (cc 11 4) and (cc -39 5)
 (cc -39 5) = 0  
 (+ (cc 11 4) 0)
 (cc 11 4)
 (+ (cc 11 3) (cc -14  4))
 (+ (cc 11 3) 0)
 (cc 11 3)
 (+ (cc 11 2) (cc 1 3))
 Evaluating each part:
 (cc 11 2) = (+ (cc 11 1) (cc 6 2))
 Again:
 (cc 11 1) = (+ (cc 11 0) (cc 10 1))
 = (+ 0 (cc 10 1)) = (cc 10 1)
 = (+ (cc 10 0) (cc 9 1)) = (cc 9 1)
 = ... (cc 1 1) = (+ (cc 1 0) (cc 0 0)
 = 1
 (cc 6 2) = (+ (cc 6 1) (cc 1 2))
 Evaluating (cc 6 1):
 (cc 6 1) = (+ (cc 6 0) (cc 5 1))
 = (cc 5 1) = ... (cc 0 0) = 1
 Now (cc 1 2):
 (cc 1 2) = (+ (cc 0 2) (cc 1 1)) = 1
 Going back:
 (cc 6 2) = (+ (cc 6 1) (cc 1 2)) = (+ 1 1) = 2
 (cc 11 2) = (+ (cc 11 1) (cc 6 2)) = (+ 1 2) = 3
 Now (cc 1 3):
 (cc 1 3) = (+ (cc 0 3) (cc 1 2)) = (+ 0 (cc 1 2))
 = (cc 1 2) = (+ (cc 0 2) (cc 1 1)) = (+ 0 1) = 1
 So we had:
 (cc 11 5) = (cc 11 3) = (+ (cc 11 2) (cc 1 3))
 = (+ 3 1) = 4
|#

; Exercise 1.15

(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p sine (/ angle 3.0))))

#| a.  Let's evaluate (sine 12.15):
 (not (> 12.5 0.1)) -> #f
 (p (sine 4.05))
 Evaluating (sine 4.05):
 ... (p (p (p (p (p (sine 0.05))))))
 = (p (p (p (p (p 0.05)))))
 = (p (p (p (p 0.14950000000000002)))) 
 = (p (p (p 0.43513455050000005)
 = (p (p 0.9758465331678772))
 = (p -0.7895631144708228)
 = -0.39980345741334
 Since 12.5 = 0.05*(3^5) and 0.15*(3^4), we have to use p five times
 b. Resources are proportional to log(sine)
