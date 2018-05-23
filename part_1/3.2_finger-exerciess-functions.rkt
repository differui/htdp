;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3.2_finger-exerciess-functions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; ex 34
;; Design the function string-first, which extracts the first character
;; from a non-empty string. Don’t worry about empty strings.

;; String -> 1String
;; given a string extract first character
;; given: "h" expected "h"
;; given: "hello" expected "h"
(define (string-first str)
  (substring str 0 1))

(check-expect (string-first "h") "h")
(check-expect (string-first "hello") "h")

;; ex 35
;; Design the function string-last, which extracts the last character
;; from a non-empty string.

;; String -> 1String
;; given a string extract last character
;; given: "h" expected "h"
;; given: "hello" expected "o"
(define (string-last str)
  (substring str (- (string-length str) 1)))

(check-expect (string-last "h") "h")
(check-expect (string-last "hello") "o")

;; ex 36
;; Design the function image-area, which counts the number of pixels in
;; a given image.

;; Image -> Number
;; counts the number of pixels in a given image
;; given: (rectangle 5 5 "solid" "red") expect 25
;; given: (rectangle 10 10 "solid" "red") expect 100
(define (image-area image)
  (* (image-width image) (image-height image)))

(check-expect (image-area (rectangle 5 5 "solid" "red")) 25)
(check-expect (image-area (rectangle 10 10 "solid" "red")) 100)

;; ex 37
;; Design the function string-rest, which produces a string like the given
;; one with the first character removed.

;; String -> String
;; given a string return without first character
;; given: (string-reset "h") expect ""
;; given: (string-reset "hello") expect "ello"
(define (string-rest str)
  (substring str 1))

(check-expect (string-rest "h") "")
(check-expect (string-rest "hello") "ello")

;; ex 38
;; Design the function string-remove-last, which produces a string like
;; the given one with the last character removed.

;; String -> String
;; given a string return without last character
;; given: (string-remove-last "h") expect ""
;; given: (string-remove-last "hello") expect "hell"
(define (string-remove-last str)
  (string-append (substring str 0 (- (string-length str) 1))))

(check-expect (string-remove-last "h") "")
(check-expect (string-remove-last "hello") "hell")