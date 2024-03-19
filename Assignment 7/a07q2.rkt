;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a07q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *************************************
;;    Shirley Fang (20973189)
;;    CS 115 Winter 2024
;;    Assignment 07, Question 2
;; *************************************
;;

;; (day-of-week y m d) calculates the day of the week for the given date
;;  based on the Schwerdtfeger's Method
;; day-of-week: Nat Nat Nat -> (anyof 'sunday 'monday 'tuesday 'wednesday
;;                              'thursday 'friday 'saturday )
;; Requires: the inputs are not empty and the year is on or after 1583

;; Examples:
(check-expect (day-of-week 2024 03 13) 'wednesday)
(check-expect (day-of-week 2024 03 8) 'friday)

(define (day-of-week y m d)
  (local
    [;; (find-W year month day) uses the formula to calculate a natural
     ;;  number which will indicate the day of the date
     ;; W: Nat Nat Nat -> Nat
     (define (find-w year month day)
       (remainder (+ day (find-e month) f g (quotient g 4)) 7))

     ;; (find-y-prime y m) calculates y' based on the given month
     ;; find-y-prime: Nat Nat -> Nat
     (define (find-y-prime y m) 
       (cond
         [(or (equal? m 1) (equal? m 2)) (- y 1)]
         [else y]))

     ;; (find-e m) finds the e value from the e-list
     ;;  based on the month of the date
     ;; find-e: Nat -> Nat
     (define (find-e m)  (list-ref e-list (- m 1)))
     
     (define e-list (list 0 3 2 5 0 3 5 1 4 6 2 4))
     
     (define c
       (quotient (find-y-prime y m) 100))

     (define g (remainder (find-y-prime y m) 100))

     (define f
       (cond
         [(equal? (remainder c 4) 0) 0]
         [(equal? (remainder c 4) 1) 5]
         [(equal? (remainder c 4) 2) 3]
         [(equal?(remainder c 4) 3) 1]))]
    
    (cond
      [(equal? (find-w y m d) 0) 'sunday] 
      [(equal? (find-w y m d) 1) 'monday]
      [(equal? (find-w y m d) 2) 'tuesday]
      [(equal? (find-w y m d) 3) 'wednesday]
      [(equal? (find-w y m d) 4) 'thursday]
      [(equal? (find-w y m d) 5) 'friday]
      [(equal? (find-w y m d) 6) 'saturday]))) 

;; Tests:
(check-expect (day-of-week 2026 05 04) 'monday)
(check-expect (day-of-week 2024 03 12) 'tuesday)
(check-expect (day-of-week 2015 06 17) 'wednesday)
(check-expect (day-of-week 2024 02 29) 'thursday)
(check-expect (day-of-week 2031 02 28) 'friday)
(check-expect (day-of-week 2043 12 26) 'saturday)
(check-expect (day-of-week 2043 12 27) 'sunday)
(check-expect (day-of-week 2000 12 27) 'wednesday)
(check-expect (day-of-week 1999 1 13) 'wednesday)
(check-expect (day-of-week 1998 11 15) 'sunday)
(check-expect (day-of-week 1997 11 15) 'saturday)
(check-expect (day-of-week 1877 11 15) 'thursday)
(check-expect (day-of-week 1797 04 15) 'saturday)