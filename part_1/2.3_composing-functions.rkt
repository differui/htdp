;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2.3_composing-functions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; ex 27
;; Our solution to the sample problem contains several constants in the middle
;; of functions. As One Program, Many Definitions already points out, it is best
;; to give names to such constants so that future readers understand where these
;; numbers come from. Collect all definitions in DrRacket’s definitions area and
;;change them so that all magic numbers are refactored into constant definitions.
(define START_ATTENTEE 120)
(define START_PRICE 5.0)
(define STEP_ATTENTEE 15)
(define STEP_PRICE 0.1)
(define FIXED_COST 180)
(define PRICE_PER_ATTENDEE 0.04)

(define (attendees ticket-price)
  (- START_ATTENTEE (* (- ticket-price START_PRICE) (/ STEP_ATTENTEE STEP_PRICE))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED_COST (* PRICE_PER_ATTENDEE (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

;; ex 28
;; Determine the potential profit for these ticket prices: $1, $2, $3, $4, and $5.
;; Which price maximizes the profit of the movie theater? Determine the best
;; ticket price to a dime.
(define (profit-difficult price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (+ 180
        (* 0.04
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price)))))))

(profit 1)
(profit 2)
(profit 3) ;; highest
(profit 4)
(profit 5)

(check-expect (profit 1) (profit-difficult 1))
(check-expect (profit 2) (profit-difficult 2))
(check-expect (profit 3) (profit-difficult 3))
(check-expect (profit 4) (profit-difficult 4))
(check-expect (profit 5) (profit-difficult 5))

;; ex 29
;; After studying the costs of a show, the owner discovered several ways of
;; lowering the cost. As a result of these improvements, there is no longer a
;; fixed cost; a variable cost of $1.50 per attendee remains.
(define FIXED_COST_PER_ATTENTEE 1.5)

(define (cost-variable tick-price)
  (* FIXED_COST_PER_ATTENTEE (attendees tick-price)))

(define (profit-variable ticket-price)
  (- (revenue ticket-price)
     (cost-variable ticket-price)))

(profit-variable 1.00)
(profit-variable 2.00)
(profit-variable 3.00) ;; highest
(profit-variable 4.00)
(profit-variable 5.00)