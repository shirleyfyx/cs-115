;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a02q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *************************************
;;    Shirley Fang (20973189)
;;    CS 115 Winter 2024
;;    Assignment 02, Question 3
;; *************************************
;;

;; Helper function to find the price for new customers
(define (new-customers cups-orders)
  (cond
    [(>= 10 cups-orders)
     (+ 5 (* 13.97 cups-orders))]
    [(>= 60 cups-orders)
     (+ 5 (* 13.97 10) (* 11.97 (- cups-orders 10)))]
    [(> cups-orders 60)
     (+ 5 (* 13.97 10) (* 11.97 50) (* 10.97 (- cups-orders 60)))]))

;; Helper function to find the price for returned customers
(define (returned-customers cups-orders)
  (cond
    [(>= 10 cups-orders)
     (* 13.97 cups-orders)]
    [(>= 60 cups-orders)
     (+ (* 10 13.97) (* 11.50 (- cups-orders 10)))]
    [(> cups-orders 60)
     (+ (* 13.97 10) (* 11.50 50) (buy-five-get-one-free cups-orders))]))

;; Helper function to calculate buy five get one free
(define (buy-five-get-one-free cups-orders)
  (* 10.97
     (+ (* (quotient (- cups-orders 60) 6) 5)
        (remainder (- cups-orders 60) 6))))

(define (photo-mugs cups-orders past-orders)
  (cond
    [(>= 3 past-orders) (new-customers cups-orders)]
    [(< 3 past-orders) (returned-customers cups-orders)]))