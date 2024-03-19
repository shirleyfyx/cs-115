;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a01q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *************************************
;;    Shirley Fang (20973189)
;;    CS 115 Winter 2024
;;    Assignment 01, Question 4
;; *************************************

;; Function to find the volume of the jar
(define (jar-volume radius height)
  (* pi height (expt radius 2)))

;; Function to find the volumes of the balls 
(define (balls-volume c-radius)
  (* pi (/ 4 3) (expt c-radius 3)))

(define (count-cheeseballs radius height c-radius efficiency)
  (floor
   (inexact->exact
    (* efficiency
       (/ (jar-volume radius height)
          (balls-volume c-radius))))))