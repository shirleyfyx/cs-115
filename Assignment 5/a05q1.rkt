;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a05q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *************************************
;;    Shirley Fang (20973189)
;;    CS 115 Winter 2024
;;    Assignment 05, Question 1
;; *************************************
;;

;; (divisor-count-helper i number) finds the number of positive divisors 
;; divisor-count-helper: Nat Nat -> Nat

;; Examples:
(check-expect (divisor-count-helper 1 2) 2)
(check-expect (divisor-count-helper 1 12) 6)

(define (divisor-count-helper i number)
  (cond
    [(> i number) 0]
    [(= (remainder number i) 0) (+ 1 (divisor-count-helper (+ 1 i) number))]
    [else (divisor-count-helper (+ 1 i) number)]))

;; (divisor-count number) inputs 1 as i to find the number of positive divisors
;; divisor-count: Nat -> Nat

;; Examples:
(check-expect (divisor-count 12) 6)
(check-expect (divisor-count 4) 3)

(define (divisor-count number) (divisor-count-helper 1 number))

;; (count-sort number lst) sorts the list in decreasing order
;; count-sort: Nat (listof Nat) -> (listof Nat)

;; Examples:
(check-expect (count-sort 49 (list 90 20 14 4)) (list 90 20 14 49 4))
(check-expect (count-sort 5 (list 100 4 2 1)) (list 100 4 5 2 1))

(define (count-sort number lst)
  (cond
    [(empty? lst) (list number)]
    [(> (divisor-count number) (divisor-count (first lst))) (cons number lst)]
    [(and (= (divisor-count number) (divisor-count (first lst)))
          (> number (first lst))) (cons number lst)]
    [(and (= (divisor-count number) (divisor-count (first lst)))
          (< number (first lst)))
     (cons (first lst) (count-sort number (rest lst)))]
    [else (cons (first lst) (count-sort number (rest lst)))]))

;; (divisor-count-sort lst) produces the list in decreasing order of
;;   the number of positive divisors
;; divisor-count-sort: (listof Nat) -> (listof Nat)

;; Examples:
(check-expect (divisor-count-sort (list 5 2 90 14 4 20 1 49))
              (list 90 20 14 49 4 5 2 1))
(check-expect (divisor-count-sort (list 100 2 4 5 1)) (list 100 4 5 2 1))

(define (divisor-count-sort lst)
  (cond
    [(empty? lst) empty]
    [else (count-sort (first lst) (divisor-count-sort (rest lst)))]))