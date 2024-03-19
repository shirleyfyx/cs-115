;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a06q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *************************************
;;    Shirley Fang (20973189)
;;    CS 115 Winter 2024
;;    Assignment 06, Question 1
;; *************************************
;;

;; (filter-prefix string omit) checks if omit is the prefix for the string
;; filter-prefix: Str (listof Str) -> Bool

;; Examples:
(check-expect (filter-prefix "cs115" (list "phy" "CS")) true)
(check-expect (filter-prefix "haha" (list "ahaha" "hehe")) false)

(define (filter-prefix string omit)
  (cond
   [(empty? omit) false]
   [(empty? (first omit)) (filter-prefix string (rest omit))]
   [(< (string-length string) (string-length (first omit)))
    (filter-prefix string (rest omit))]
   [(equal?
     (string-downcase (substring string 0 (string-length (first omit))))
     (string-downcase (first omit))) true]
   [else (filter-prefix string (rest omit))]))

;; (filter-strings los omit) produces a list of strings only including strings 
;;  that do not begin with any of the case-insentitive strings in omit
;; filter-string: (listof Str) (listof Str) -> (listof Str)

;; Examples:
(check-expect (filter-strings 
               (list "cs115" "cs136" "PHYS111" "math135" "math117" "cive341") 
               (list "cs" "phys")) (list "math135" "math117" "cive341"))
(check-expect (filter-strings
               (list "cs115" "is" "awesome" "." "I" "like" "programming" "!") 
               (list "cs" "a" "s" "programming"))
              (list "is" "." "I" "like" "!")) 

(define (filter-strings los omit)
  (cond
    [(empty? los) empty]
    [(empty? (first los)) (cons (first los) (filter-strings (rest los) omit))]
    [(filter-prefix (first los) omit)
     (filter-strings (rest los) omit)]
    [else (cons (first los) (filter-strings (rest los) omit))]))

;; Tests:
(check-expect (filter-strings 
               (list "Science" "Computer") 
               (list '())) (list "Science" "Computer"))
(check-expect (filter-strings 
               (list "cs115" "cs136" "PHYS111" '() "math117") 
               (list "CS115" "phys")) (list "cs136" '() "math117"))
(check-expect (filter-strings 
               (list '()) 
               (list "CS115" "phys")) (list '()))
(check-expect (filter-strings 
               (list "Science" "Computer") 
               (list "Science" '())) (list "Computer"))
(check-expect (filter-strings 
               (list "cs115" "cs136" "PHYS111" "math135" "math117") 
               (list "CS115" "phys")) (list "cs136" "math135" "math117"))
(check-expect (filter-strings 
               (list "cs115" "PHYS111" "math117") 
               (list "115" "111")) (list "cs115" "PHYS111" "math117"))
(check-expect (filter-strings 
               (list "CS115" "PHY114") 
               (list "cs1154" "PHY1144")) (list "CS115" "PHY114"))
(check-expect (filter-strings 
               (list "Science" "Computer") 
               (list "Compute" "Sciencee")) (list "Science"))
