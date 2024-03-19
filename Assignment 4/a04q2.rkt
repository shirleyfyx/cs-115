;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a04q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *************************************
;;    Shirley Fang (20973189)
;;    CS 115 Winter 2024
;;    Assignment 04, Question 2
;; *************************************
;;

;; (cipher lst) applies the cipher rule with recursion to shift the character
;;   by 3
;; cipher: (listof Char) -> (listof Char)

;; Examples:
(check-expect (cipher (cons #\H (cons #\I empty))) (cons #\K (cons #\L empty)))
(check-expect (cipher (cons #\Y (cons #\O empty))) (cons #\B (cons #\R empty)))

(define (cipher lst)
  (cond
    [(empty? lst) empty]
    [(< (char->integer (first lst)) 88)
     (cons (integer->char (+ 3 (char->integer (first lst))))
           (cipher (rest lst)))]
    [else (cons (integer->char (- (char->integer (first lst)) 23))
                (cipher (rest lst)))]))

;; (rscipher-3 s) produces the a new string with the right shift of 3 cipher
;;   rule applied to s using cipher as a helper function
;; rscipher-3: Str -> Str

;; Examples:
(check-expect (rscipher-3 "HELLOO") "KHOORR")
(check-expect (rscipher-3 "XYZ") "ABC")

(define (rscipher-3 s)
  (list->string(cipher (string->list s))))

;; Tests:
(check-expect (rscipher-3 "AAA") "DDD")
(check-expect (rscipher-3 "CZ") "FC")