;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a06q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *************************************
;;    Shirley Fang (20973189)
;;    CS 115 Winter 2024
;;    Assignment 06, Question 2
;; *************************************
;;

;; (skip lst n count) produces the list by selecting the first item,
;;  skipping the next n items and the next item until the end of the list
;; skip: (listof Any) Nat Nat -> (listof Any)
;; Requires: count starts from 0

;; Examples:
(check-expect (skip (list 2 4 5 8 12 16 17) 0 0) (list 2 4 5 8 12 16 17))
(check-expect (skip (list 2 3 5 7 11 13 17) 3 0) (list 2 11))

(define (skip lst n count)
  (cond
    [(empty? lst) empty]
    [(> count 0) (skip (rest lst) n (sub1 count))]
    [else (cons (first lst) (skip (rest lst) n n))]))

;; (skipping lst n) uses skip to produce the list
;; skipping: (listof Any) Nat -> (listof Any)
(check-expect (skipping (list 2 3 5 7 11 13 17) 3) (list 2 11))
(check-expect (skipping (list 2 4 5 8 12 16 17) 0) (list 2 4 5 8 12 16 17))

(define (skipping lst n)
  (skip lst n 0))

;; Tests:
(check-expect (skipping (list '()) 3) (list '()))
(check-expect (skipping (list 2 4 5 8 12 16 17) 1) (list 2 5 12 17))
(check-expect (skipping (list 1 2 3 4 5 6 7 8 9 10) 10) (list 1))
(check-expect (skipping (list 1 2 3 4 5 6 7 8 9 10 12 13) 10) (list 1 13))
(check-expect (skipping (list 1) 1) (list 1))
(check-expect (skipping (list empty) 10) (list empty))
(check-expect (skipping (list empty) 0) (list empty))
(check-expect (skipping (list 1 2 3 4 empty 6 7 8 9 10) 3) (list 1 empty 9))
(check-expect (skipping (list 1 2 3 4 '() 6 7 8 9 10) 3) (list 1 '() 9))

