#lang racket

;; TASK 1: coneVolume

(define (coneVolume r h)
  (let ((pi (/ 22 7)))
    (if (or (<= r 0) (<= h 0))
        0
        (/ (* pi r r h) 3))))

;; Test cone volume
(display "TASK 1: coneVolume Tests ")
(newline)

;;coney testing
(display "1.5, 2.1: ")
(display (coneVolume 1.5 2.1))
(newline)

;; Edge cases
;; radius = 0
(display "radius of 0: ")
(display (coneVolume 0 5))
(newline)

;; height = 0
(display "height of 0: ")
(display (coneVolume 5 0))
(newline)

;; both 0
(display "h & r of 0: ")
(display (coneVolume 0 0))
(newline)

;; neg val
(display "neg radius ")
(display (coneVolume -3 5))
(newline)

;;neg height
(display "neg height: ")
(display (coneVolume 3 -5))
(newline)

;; both negative
(display "h & r neg vals: ")
(display (coneVolume -3 -5))
(newline)

;; integers
(display "integers (+): ")
(display (coneVolume 2 3))
(newline)

;; big boi values
(display "big chnugus vals: ")
(display (coneVolume 15 67))
(newline)

;;decimals
(display "decimals: ")
(display (coneVolume 2.5 3.5))
(newline)

(newline)

; TASK 2: countNonZeroValues

(define (countNonZeroValues lst)
  (cond
    ((null? lst) 0)
    ((zero? (car lst)) (countNonZeroValues (cdr lst)))
    (else (+ 1 (countNonZeroValues (cdr lst))))))

;; Test cases for countNonZeroValues
(display "TASK 2: countNonZeroValues Tests ")
(newline)

;; Empty list
(display "Empty list: ")
(display (countNonZeroValues '()))
(newline)

;; All zeros
(display "All zeros: ")
(display (countNonZeroValues '(0 0)))
(newline)

;; integers
(display "Integers (+ & -) (3 0 -8 0): ")
(display (countNonZeroValues '(3 0 -8 0)))
(newline)

;; + vals only
(display "+ vals only: ")
(display (countNonZeroValues '(1 2 3)))
(newline)

;; - vals only
(display "- values: ")
(display (countNonZeroValues '(-1 -2 -3)))
(newline)

;; one zero
(display "one zero (0): ")
(display (countNonZeroValues '(0)))
(newline)

;; Single  natural num
(display "one natural num): ")
(display (countNonZeroValues '(5)))
(newline)

;; Mix
(display "mix 0 1 2 0): ")
(display (countNonZeroValues '(0 1 2 0)))
(newline)

;; big boi list
(display "big boi list (1 0 2 0 3 0 4 0 5): ")
(display (countNonZeroValues '(1 0 2 0 3 0 4 0 5)))
(newline)

;; Mix of + and _
(display "Mix of po+sitive and - : ")
(display (countNonZeroValues '(-5 0 3 -2 0 7)))
(newline)

(newline)

; TASK 3: doubleEverySecondElement

(define (doubleEverySecondElement lst)
  (define (helper lst position)
    (cond
      ((null? lst) '())
      ((even? position) (cons (* 2 (car lst)) (helper (cdr lst) (+ position 1))))
      (else (helper (cdr lst) (+ position 1)))))
  (helper lst 2))

;; Test cases for doubleEverySecondElement
(display "TASK 3: doubleEverySecondElement Tests: ")
(newline)

;; Empty list
(display "Empty list: ")
(display (doubleEverySecondElement '()))
(newline)

;; Single element 
(display "Single element : ")
(display (doubleEverySecondElement '(4)))
(newline)

;; 2 elements 
(display "2 elements (4 6): ")
(display (doubleEverySecondElement '(4 6)))
(newline)

;; 4 elements
(display " 4 elements (4 6 2 3): ")
(display (doubleEverySecondElement '(4 6 2 3)))
(newline)

;; Odd length list
(display "Odd length list: ")
(display (doubleEverySecondElement '(1 2 3 4 5)))
(newline)

;; Even length list
(display "Even length list: ")
(display (doubleEverySecondElement '(1 2 3 4)))
(newline)

;; - num
(display "Testing With - values: ")
(display (doubleEverySecondElement '(5 -3 7 -2)))
(newline)

;; testing w 0s
(display "TestingWith zeros (0 1 0 2 0 3): ")
(display (doubleEverySecondElement '(0 1 0 2 0 3)))
(newline)

;; big boyi list
(display "fatty boom boom list : ")
(display (doubleEverySecondElement '(1 2 3 4 5 6 7 8)))
(newline)

;; Single element list 
(display "Test 10 - Three elements (10 20 30): ")
(display (doubleEverySecondElement '(10 20 30)))
(newline)
