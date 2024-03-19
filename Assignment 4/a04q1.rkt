;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a04q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *************************************
;;    Shirley Fang (20973189)
;;    CS 115 Winter 2024
;;    Assignment 04, Question 1
;; *************************************
;;

;; (list->set lst) takes in a list and produces a set containing the same items
;;   and deletes the duplicates
;; list->set: (listof Any) -> (listof Any)

;; Examples:
(check-expect (list->set (cons 17 (cons 42 (cons false (cons 17 empty)))))
  (cons 42 (cons false (cons 17 empty))))
(check-expect (list->set (cons "hi" (cons 42 (cons "hi" (cons "hi" empty)))))
  (cons 42 (cons "hi" empty)))

(define (list->set lst)
  (cond
    [(empty? lst) empty]
    [(member (first lst) (rest lst)) (list->set (rest lst))]
    [else (cons (first lst) (list->set (rest lst)))]))

;; Tests:
(check-expect (list->set (cons 1 (cons 1 (cons 1 (cons 1 empty)))))
  (cons 1 empty))
(check-expect (list->set (cons 17 (cons 42 (cons false (cons 18 empty)))))
  (cons 17 (cons 42 (cons false (cons 18 empty)))))
