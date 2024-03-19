;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a02q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *************************************
;;    Shirley Fang (20973189)
;;    CS 115 Winter 2024
;;    Assignment 02, Question 1
;; *************************************
;;

;; Helper function to verify if the IP is within the range
(define (valid-ip? IP)
  (and (>= IP 0) (<= IP 255) (integer? IP)))

(define (valid-ipv4addr? IPv1 IPv2 IPv3 IPv4)
  (cond
    [(not(valid-ip? IPv1)) false]
    [(not(valid-ip? IPv2)) false]
    [(not(valid-ip? IPv3)) false]
    [(not(valid-ip? IPv4)) false]
    [else true]))