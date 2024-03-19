;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a03q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; *************************************
;;    Shirley Fang (20973189)
;;    CS 115 Winter 2024
;;    Assignment 03, Question 1
;; *************************************
;;

;; (suit-compare suit) maps a number value to the suit 
;; suit-compare: Sym -> Nat

;; Example:
(check-expect(suit-compare 'Diamonds) 2)
(check-expect(suit-compare 'Hearts ) 3)

(define (suit-compare suit)
 (cond
  [(equal? suit 'Clubs) 1]
  [(equal? suit 'Diamonds) 2]
  [(equal? suit 'Hearts) 3]
  [(equal? suit 'Spades) 4]))

;; (card<=? suit1 rank1 suit2 rank2) produces the bool to determine whether
;;  suit1 comes before suit2 in Bridge ordering, or suit1 and suit2 are the
;;  same and rank1 <= rank2
;; card<=?: Sym Nat Sym Nat -> Bool

;; Examples:
(check-expect (card<=? 'Diamonds 3 'Spades 3) true)
(check-expect (card<=? 'Spades 5 'Diamonds 3) false)

(define (card<=? suit1 rank1 suit2 rank2)
 (cond
  [(< (suit-compare suit1)(suit-compare suit2)) true]
  [(and (equal? suit1 suit2) (<= rank1 rank2)) true]
  [else false]))

;; Tests:
(check-expect (card<=? 'Diamonds 3 'Diamonds 3) true)
(check-expect (card<=? 'Hearts 5 'Diamonds 3) false)
(check-expect (card<=? 'Hearts 5 'Hearts 3) false)
(check-expect (card<=? 'Clubs 5 'Diamonds 3) true)
