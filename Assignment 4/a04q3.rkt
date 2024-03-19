;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a04q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *************************************
;;    Shirley Fang (20973189)
;;    CS 115 Winter 2024
;;    Assignment 04, Question 3
;; *************************************
;;

;; (drop-grades lst) produces the grades list after
;;   skipping excused assignments
;; drop-grades: (listof Num 'x) -> (listof Num)

;; Examples:
(check-expect (drop-excused (cons 'x (cons 80 (cons 30 empty))))
              (cons 80 (cons 30 empty)))
(check-expect (drop-excused (cons 100 (cons 'x (cons 15 empty))))
              (cons 100 (cons 15 empty)))

(define (drop-excused lst)
  (cond
    [(empty? lst) empty]
    [(and (symbol? (first lst))(symbol=? 'x (first lst)))
     (drop-excused (rest lst))]
    [else (cons (first lst) (drop-excused (rest lst)))]))

;; (list-minium n lst) finds the smallest number in the list
;; list-minium: (listof Num) -> Num

;; Example:
(check-expect (list-minium 80 (cons 80 (cons 30 empty))) 30)
(check-expect (list-minium 1000 (cons 1000 (cons 999 empty))) 999)
      
(define (list-minium n lst)
  (cond
    [(empty? lst) n]
    [(< (first lst) n) (list-minium (first lst) (rest lst))]
    [else (list-minium n (rest lst))]))

;; (lowest-grade lst) drops the lowest grade from the list
;; lowest-grade: (listof Num 'x) -> (listof Num)

;; Examples:
(check-expect (lowest-grade (cons 80 (cons 30 empty)))
              (cons 80 empty))
(check-expect (lowest-grade (cons 80 (cons 'x (cons 30 empty))))
              (cons 80 empty))

(define (lowest-grade lst)
        (remove (list-minium (first (drop-excused lst)) (drop-excused lst))
                  (drop-excused lst)))

;; (sum-grade lst) finds the total sum of a list
;; sum-grade: (listof Num) -> Num

;; Examples:
(check-expect (sum-grade (cons 100 (cons 80 (cons 90 (cons 30 empty))))) 300)
(check-expect (sum-grade (cons 95 (cons 20 (cons 90 (cons 30 empty))))) 235)

(define (sum-grade lst)
  (cond
    [(empty? lst) 0]
    [else (+ (first lst)
             (sum-grade (rest lst)))]))

;; (assignment-grade lst) produces the average assignment grade after dropping
;;  the lowest grade and excused exam grades
;; assignment-grade: (listof Num 'x) -> Num

;; Example:
(check-expect
 (assignment-grade (cons 100 (cons 80 (cons 'x (cons 30 empty))))) 90)
(check-expect
 (assignment-grade
  (cons 40 (cons 100 (cons 100 (cons 'x (cons 30 empty)))))) 80)

(define (assignment-grade lst)
  (/ (sum-grade (lowest-grade lst)) (length (lowest-grade lst)))) 

;; Tests:
(check-expect
 (assignment-grade (cons 100 (cons 71 (cons 'x (cons 30 empty))))) 85.5)
(check-expect
 (assignment-grade
  (cons 40 (cons 'x (cons 'x (cons 'x (cons 30 empty)))))) 40)
