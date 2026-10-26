#lang racket
; Task 1
; negative val = abs(val)
; positive val = 1 / val  
; zero val = 1
; final = sum of all vals

(define (sumAbsNegativeFracPositivesCountZeros lst)
  (if (null? lst)
      0
      (let ((val (car lst)))
        (+ (cond
             ((zero?     val) 1)
             ((negative? val) (abs val))
             (else (/ 1.0 val)))   
           (sumAbsNegativeFracPositivesCountZeros (cdr lst))))))

(display (sumAbsNegativeFracPositivesCountZeros '()))
(newline)
(display (sumAbsNegativeFracPositivesCountZeros '(2 4)))
(newline)
(display (sumAbsNegativeFracPositivesCountZeros '(-2 -4)))
(newline)
(display (sumAbsNegativeFracPositivesCountZeros '(0 2 -4)))
(newline)