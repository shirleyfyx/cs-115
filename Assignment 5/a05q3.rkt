;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a05q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *************************************
;;    Shirley Fang (20973189)
;;    CS 115 Winter 2024
;;    Assignment 05, Question 3
;; *************************************
;;

(define methane (list 'C 'H 4))                 ; CH4
(define glucose (list 'C 6 'H 12 'O 6))         ; C6H12O6
(define acetic-acid (list 'C 'H 3 'C 'O 'O 'H)) ; CH3COOH 
(define hydrazine (list 'H 2 'N 'N 'H 2))       ; H2NNH2
(define caffeine (list 'C 8 'H 10 'N 4 'O 2))   ; C8H10N4O2
(define ethanol (list 'C 'H 3 'C 'H 2 'O 'H))   ; CH3CH2OH

(define (atom-mass element)
  (cond
    [(equal? element 'H) 1]
    [(equal? element 'C) 12]
    [(equal? element 'N) 14]
    [(equal? element 'O) 16]))

;; (molar-mass compound) calculates the molar mass for a compound
;; molar-mass: (listof (anyof Nat 'C 'H 'N 'O)) -> Nat

;; Examples:
(check-expect (molar-mass methane) 16)
(check-expect (molar-mass caffeine) 194)
(check-expect (molar-mass ethanol) 46)

(define (molar-mass compound)
  (cond
    [(empty? compound) 0]
    [(and (symbol? (first compound))
          (or (empty? (rest compound))(symbol? (second compound))))
     (+ (atom-mass (first compound)) (molar-mass (rest compound)))]
    [(and (symbol? (first compound)) (number? (second compound)))
     (+ (* (atom-mass (first compound)) (second compound))
        (molar-mass (rest compound)))]
    [(number? (first compound)) (molar-mass (rest compound))]))

;; (heaviest-helper current-max compounds) finds the heaviest compound
;; heaviest-helper: (listof Str) -> (listof (anyof Nat 'C 'H 'N 'O))

;; Examples:
(check-expect (heaviest-helper glucose (list acetic-acid hydrazine caffeine))
              (list 'C 8 'H 10 'N 4 'O 2))

(define (heaviest-helper current-max compounds)
  (cond
    [(empty? compounds) current-max]
    [(> (molar-mass(first compounds)) (molar-mass current-max))
     (heaviest-helper (first compounds) (rest compounds))]
    [else (heaviest-helper current-max (rest compounds))]))

;; (heaviest compounds) returns the list in the order of the highest molar mass
;; heaviest: (listof Str) -> (listof (anyof Nat 'C 'H 'N 'O))

;; Examples:
(check-expect (heaviest (list glucose acetic-acid hydrazine caffeine ethanol))
              (list 'C 8 'H 10 'N 4 'O 2))

(define (heaviest compounds)
  (heaviest-helper (first compounds) (rest compounds)))

;; Tests:
(check-expect (heaviest (list glucose acetic-acid hydrazine ethanol))
              (list 'C 6 'H 12 'O 6))
(check-expect (heaviest (list methane acetic-acid hydrazine ethanol))
              (list 'C 'H 3 'C 'O 'O 'H))