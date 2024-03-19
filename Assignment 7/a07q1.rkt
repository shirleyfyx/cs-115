;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a07q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *************************************
;;    Shirley Fang (20973189)
;;    CS 115 Winter 2024
;;    Assignment 07, Question 1
;; *************************************
;;

;; (mean-of-all lol) produces the average of all the numbers contained
;;  in all the sublists 
;; mean-of-all: (listof (listof Int)) -> Num
;; Requires: at least one list in the input is non-empty

;; Examples:
(check-expect (mean-of-all (list (list 1) empty)) 1)
(check-expect (mean-of-all (list (list 1 2 3))) 2)

(define (mean-of-all lol)
  (local
    [;; (count lst n) computes the total number of elements
     ;;  within a single list
     ;; count: (listof Int) -> Nat
     (define (count lst n)
       (cond
         [(empty? lst) n]
         [else (count (rest lst) (add1 n))]))

     ;; (total-count los) calculates the total number of elements
     ;;  across all sublists
     ;; total-count: (listof (listof Int)) -> Nat
     (define (total-count los)
       (cond
         [(empty? los) 0]
         [else (+ (count (first los) 0) (total-count (rest los)))]))

     ;; (sum lst) calculates the sum of elements within a single list
     ;; sum: (listof Int) -> Num
     (define (sum lst)
       (cond
         [(empty? lst) 0]
         [else (+ (first lst) (sum (rest lst)))]))

     ;; (total-sum) calculates the total sum of elements across all sublists
     ;; total-sum: (listof (listof Int)) -> Num
     (define (total-sum los)
       (cond
         [(empty? los) 0]
         [else (+ (sum (first los)) (total-sum (rest los)))]))]

    (/ (total-sum lol) (total-count lol))))
 
;; Tests:
(check-expect (mean-of-all (list empty (list 5 6 7 8) (list 9 10 11 12 13))) 9)
(check-expect (mean-of-all (list empty empty (list 3) (list 4))) 3.5)
(check-expect (mean-of-all (list empty empty (list 3) (list -4 4))) 1)
(check-expect (mean-of-all (list (list -3 -2) (list 3)
                                 (list -1 -5 4 0 0))) -0.5)
(check-expect (mean-of-all (list (list 3 4 5 6) (list 4))) 4.4)
(check-expect (mean-of-all (list (list 1 2 3 4)
                                 (list 5 6 7 8) (list 9 10 11 12 13))) 7)

