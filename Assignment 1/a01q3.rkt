;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a01q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *************************************
;;    Shirley Fang (20973189)
;;    CS 115 Winter 2024
;;    Assignment 01, Question 3
;; *************************************

;; The assignments worth 40 percent
;; The concept-checks worth 20 percent
(define (min-exam-grade assignments concept-checks)
  (max 50(/ (- 50 (* 0.4 assignments)(* 0.2 concept-checks)) 0.4)))