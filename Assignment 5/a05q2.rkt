;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a05q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *************************************
;;    Shirley Fang (20973189)
;;    CS 115 Winter 2024
;;    Assignment 05, Question 2
;; *************************************
;;

(define (make-image id patient-id age finding)
  (list id patient-id age finding))

(define (patient-age image) (third image))

(define (patient-finding image) (third (rest image)))
  
;; (image-filter images low high finding) finds the same disease finding
;;   and accurate age range for the patient
;; image-filer: (listof (anyof Nat 'Fibrosis 'Emphysema
;;                       'Pneumothorax 'Cardiomegaly 'None)) ->
;;              (listof (anyof Nat 'Fibrosis 'Emphysema
;;                       'Pneumothorax 'Cardiomegaly 'None))

(define images
  (list (make-image 1 1 35 'Fibrosis)
        (make-image 2 1 24 'Cardiomegaly)
        (make-image 3 2 60 'Emphysema)
        (make-image 4 3 30 'None)
        (make-image 5 4 35 'Pneumothorax)
        (make-image 6 5 76 'Emphysema)
        (make-image 7 6 81 'None)
        (make-image 8 7 12 'None)))

;; Examples:
(check-expect (image-filter images 20 50 'None) (list (list 4 3 30 'None)))
(check-expect (image-filter images 20 76 'Emphysema)
              (list (list 3 2 60 'Emphysema) (list 6 5 76 'Emphysema)))

(define (image-filter images low high finding)
  (cond
    [(empty? images) empty]
    [(and (<= low (patient-age (first images)))
          (>= high (patient-age (first images)))
          (symbol=? finding (patient-finding (first images))))
     (cons (first images) (image-filter (rest images) low high finding))]
    [else (image-filter (rest images) low high finding)]))

;; Tests:
(check-expect (image-filter images 1 2 'None) '())
(check-expect (image-filter images 35 35 'Pneumothorax)
              (list (list 5 4 35 'Pneumothorax)))
