;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a06q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *************************************
;;    Shirley Fang (20973189)
;;    CS 115 Winter 2024
;;    Assignment 06, Question 3
;; *************************************
;;

;; An Element is a (list Sym Num)
;; Requires: Num > 0
  
;; Constructor
;; make-element: Sym Num -> Element
(define (make-element key val) (list key val))

(define elements
    (list
      (make-element 'C 12)        ; carbon
      (make-element 'H 1)         ; hydrogen
      (make-element 'N 14)        ; nitrogen
      (make-element 'O 16)        ; oxygen
      (make-element 'S 32)        ; sulphur
      (make-element 'Hg 200.59)   ; mercury
      (make-element 'Vb 640)))    ; vibranium

;; Selectors
;; element-key: Element -> Sym
(define (element-key elem) (first elem))
;; element-val: Element -> Num
(define (element-val elem) (second elem))

;; (lookup-compound Compound Element) finds the compound's atomic weight
;;  in the dictionary
;; lookup-compound: Sym (listof (list Sym Num)) -> Num

;; Examples:
(check-expect (lookup-compound 'C elements) 12)
(check-expect (lookup-compound 'Hg elements) 200.59)

(define (lookup-compound Compound Element)
  (cond
    [(equal? Compound (element-key (first Element)))
     (element-val (first Element))]
    [else (lookup-compound Compound (rest Element))]))

;; (molar-mass Compound Element) computes the molar mass of the compound
;;  based on the atomic weights
;; molar-mass: (listof Sym Num) (listof (list Sym Num)) -> (listof Sym Num)

;; Examples:
(check-expect (molar-mass (list 'C 3 'H 5 'N 3 'O 9) elements) 227)
(check-expect (molar-mass (list 'Vb 'C 'O 3) elements) 700)

(define (molar-mass Compound Element)
  (cond
    [(empty? Compound) 0]
    [(and (symbol? (first Compound))
          (or (empty? (rest Compound)) (symbol? (second Compound))))
     (+ (lookup-compound (first Compound) Element)
        (molar-mass (rest Compound) Element))]
    [(and (symbol? (first Compound)) (number? (second Compound)))
     (+ (* (lookup-compound (first Compound) Element) (second Compound))
        (molar-mass (rest Compound) Element))]
    [(number? (first Compound)) (molar-mass (rest Compound) Element)]))

;; Tests:
(check-expect (molar-mass '() elements) 0)
(check-expect (molar-mass (list 'Hg 'S) elements) 232.59)
(check-expect (molar-mass (list 'C 'H 3 'S 'C 'H 3) elements) 62)
(check-expect (molar-mass (list 'C 'O 2) elements) 44)
(check-expect (molar-mass (list 'Vb 3) elements) 1920)
