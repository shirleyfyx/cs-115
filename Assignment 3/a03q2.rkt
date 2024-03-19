;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a03q02) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *************************************
;;    Shirley Fang (20973189)
;;    CS 115 Winter 2024
;;    Assignment 03, Question 2
;; *************************************
;;

;; (listen s) listens to the string and produces the calculation result
;;  based on the string
;; listen: Str -> Num

;; Examples:
(check-expect (listen "subtract 4 from 8") 4)
(check-expect (listen "divide 6 by 3") 2)

(define (listen s)
  (cond
    [(number? (string->number s))
     (string->number s)]
    [(string-contains? "add" s)
     (+ (string->number (string-ith s 4))
     (string->number (string-ith s 10)))]
    [(string-contains? "subtract" s)
     (- (string->number(string-ith s 16)) (string->number(string-ith s 9)))]
    [(string-contains? "divide" s)
     (/ (string->number(string-ith s 7)) (string->number(string-ith s 12)))]
    [(string-contains? "multiply" s)
     (* (string->number(string-ith s 9)) (string->number(string-ith s 14)))])) 

;; Tests:
(check-expect (listen "1") 1)
(check-expect (listen "add 0 and 1") 1)
(check-expect (listen "multiply 5 by 3") 15)