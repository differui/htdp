;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2.5_programs) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)
(require 2htdp/universe)
(require 2htdp/image)

(write-file "sample.dat" "212")

;; ex 31
;; Recall the letter program from Composing Functions.
;; Here is how to launch the program and have it write
;; its output to the interactions area:

(define (letter fst lst signature-name) 
  (string-append
   (opening fst)
   "\n\n"
   (body fst lst) 
   "\n\n"
   (closing signature-name)))

(define (opening fst)
  (string-append "Dear " fst ","))

(define (body fst lst)
  (string-append 
   "We have discovered that all people with the"  "\n"
   "last name " lst " have won our lottery. So, " "\n"
   fst ", " "hurry and pick up your prize."))

(define (closing signature-name)
  (string-append
   "Sincerely,"
   "\n\n"
   signature-name
   "\n"))

;; ex 32
;; Most people no longer use desktop computers just to
;; run applications but also employ cell phones, tablets,
;; and their cars’ information control screen.
;; Soon people will use wearable computers in the form of
;; intelligent glasses, clothes, and sports gear.
;; In the somewhat more distant future, people may come
;; with built-in bio computers that directly interact with
;; body functions. Think of ten different forms of events
;; that software applications on such computers will have to deal with.

;; demo
;; use big-bang draw square
(define (number->square s)
  (square s "solid" "red"))

(big-bang 100
  [to-draw number->square]
  [on-tick sub1]
  [stop-when zero?])

;; demo
;; with keyshorts
(define (reset s ke)
  100)

(big-bang 100
  [to-draw number->square]
  [on-tick sub1]
  [stop-when zero?]
  [on-key reset])

;; figure 14
(define BACKGROUND (empty-scene 100 100))
(define DOT (circle 3 "solid" "red"))

(define (main y)
  (big-bang y
    [on-tick sub1]
    [stop-when zero?]
    [to-draw place-dot-at]
    [on-key stop]))

(define (place-dot-at y)
  (place-image DOT 50 y BACKGROUND))

(define (stop y ke)
  0)