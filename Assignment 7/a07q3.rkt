;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname a07q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *************************************
;;    Shirley Fang (20973189)
;;    CS 115 Winter 2024
;;    Assignment 07, Question 3
;; *************************************
;;

;; A Point is a (list Num Num)
 
;; make-point: Num Num -> Point
(define (make-point x y) (list x y))
;; point-x: Point -> Num
(define (point-x pt) (first pt))
;; point-y: Point -> Num
(define (point-y pt) (second pt))

;; (rotated-rect-inside-lines? P1 P2 P3 P4 theta D) checks if the four vertices
;;  of a rectangle is with the interval of -D and D after rotating
;;  counterclockwise by theta around the origin
;; rotated-rect-inside-lines?: Num Num Num Num Num Num -> Bool
;; Requires: D is a non-negative number

;; Examples:
(check-expect (rotated-rect-inside-lines?
               (make-point 0 0) (make-point 0 0.5) (make-point 1 0.5) 
               (make-point 1 0) (/ pi 3) 0.5) true)

(check-expect (rotated-rect-inside-lines?
               (make-point 0 0) (make-point 0 1) (make-point 1 1)
               (make-point 1 0) pi 0.5) false)

(define (rotated-rect-inside-lines? P1 P2 P3 P4 theta D)
  (local
    [;; (rotation point theta) finds the x coordination after the rotation
     ;; rotation: Num Num -> Num
     (define (rotation point theta)
       (- (*(cos theta) (point-x point)) (*(sin theta) (point-y point))))

     ;; (check-range point theta D) verifies if the point after rotation is
     ;;  within the range of -D and D
     (define (check-range point theta D)
       (cond
         [(and (<= (- (+ D 0.0001)) (rotation point theta))
               (>= (+ D 0.0001) (rotation point theta))) true] 
         [else false]))]
    
    (cond
     [(and (check-range P1 theta D) (check-range P2 theta D)
           (check-range P3 theta D) (check-range P4 theta D)) true]
     [else false])))

;; Tests:
(check-expect (rotated-rect-inside-lines?
               (make-point 0 0) (make-point 0 1) (make-point 1 1) 
               (make-point 1 0) (/ pi 6) 0.5) false)
(check-expect (rotated-rect-inside-lines?
               (make-point 0 0) (make-point 0 1) (make-point 1 1) 
               (make-point 1 0) (/ pi 6) 4) true)
(check-expect (rotated-rect-inside-lines?
               (make-point -1 0) (make-point -1 1) (make-point 0 -1) 
               (make-point 0 0) (-(/ pi 7)) 2) true)
(check-expect (rotated-rect-inside-lines?
               (make-point 0 0) (make-point 5.5 0)
               (make-point 5.5 5.5) (make-point 5.5 0) (/ pi 2) 5.5) true)
(check-expect (rotated-rect-inside-lines?
               (make-point 0 0) (make-point -5.5 0)
               (make-point -5.5 -5.5) (make-point -5.5 0) 2.3 8) true)
(check-expect (rotated-rect-inside-lines?
               (make-point 0 0) (make-point -5.5 0)
               (make-point -5.5 -5.5) (make-point -5.5 0) -2.3 8) true)