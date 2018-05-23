;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2.1_function) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; ex 11
;; Define a function that consumes two numbers, x and y, and
;; that computes the distance of point (x,y) to the origin
(define (dist x y)
  (sqrt (+ (* x x) (* y y))))

(check-expect (dist 0 0) 0)
(check-expect (dist 3 4) 5)

;; ex 12
;; Define the function cvolume, which accepts the length of a
;; side of an equilateral cube and computes its volume. If you
;; have time, consider defining csurface, too.
(define (cvolume x)
  (* x x x))

(check-expect (cvolume 0) 0)
(check-expect (cvolume 2) 8)

(define (csurface x)
  (* 6 (* x x)))

(check-expect (csurface 0) 0)
(check-expect (csurface 1) 6)

;; ex 13
;; Define the function string-first, which extracts the first
;; 1String from a non-empty string. 
(define (string-first str)
  (if (> (string-length str) 0)
    (substring str 0 1)
    str))

(check-expect (string-first "s") "s")
(check-expect (string-first "sa") "s")
(check-expect (string-first "") "")

;; ex 14
;; Define the function string-last, which extracts the last
;; 1String from a non-empty string.
(define (string-last str)
  (if (> (string-length str) 0)
      (substring str (- (string-length str) 1))
      str))

(check-expect (string-last "s") "s")
(check-expect (string-last "sa") "a")
(check-expect (string-last "") "")

;; ex 15
;; Define ==>. The function consumes two Boolean values,
;; call them sunny and friday. Its answer is #true if sunny
;; is false or friday is true. Note Logicians call this
;; Boolean operation implication, and they use the notation
;; sunny => friday for this purpose
(define (==> sunny friday)
  (or (not sunny) friday))

(check-expect (==> #true #true) #true)
(check-expect (==> #false #false) #true)
(check-expect (==> #false #true)  #true)
(check-expect (==> #true #false) #false)

;; ex 16
;; Define the function image-area, which counts the number of
;; pixels in a given image. See exercise 6 for ideas.
(define (image-area image)
  (* (image-width image) (image-height image)))

(check-expect (image-area (rectangle 0 0 "solid" "blue")) 0)
(check-expect (image-area (rectangle 5 5 "solid" "blue")) 25)

;; ex 17
;; Define the function image-classify, which consumes an image
;; and conditionally produces "tall" if the image is taller than
;; wide, "wide" if it is wider than tall, or "square" if its
;; width and height are the same. See exercise 8 for ideas.
(define (image-classify image)
  (if (> (image-width image) (image-height image))
      "wide"
      (if (< (image-width image) (image-height image))
          "tall"
          "square")))

(define TALL (rectangle 10 20 "solid" "blue"))
(define WIDE (rectangle 20 10 "solid" "blue"))
(define SQUARE (rectangle 10 10 "solid" "blue"))

(check-expect (image-classify TALL) "tall")
(check-expect (image-classify WIDE) "wide")
(check-expect (image-classify SQUARE) "square")

;; ex 18
;; Define the function string-join, which consumes two strings and
;; appends them with "_" in between. See exercise 2 for ideas.
(define (string-join left right)
  (string-append left "_" right))

(check-expect (string-join "left" "right") "left_right")

;; ex 19
;; Define the function string-insert, which consumes a string str
;; plus a number i and inserts "_" at the ith position of str.
;; Assume i is a number between 0 and the length of the given string (inclusive).
;; See exercise 3 for ideas. Ponder how string-insert copes with "".
(define (string-insert str i)
  (if (string=? str "")
      ""
      (if (and (>= i 0) (< i (string-length str)))
          (string-append (substring str 0 i) "_" (substring str i))
          str)))

(check-expect (string-insert "" 1) "")
(check-expect (string-insert "hellothere" 5) "hello_there")
(check-expect (string-insert "hellothere" -100) "hellothere")
(check-expect (string-insert "hellothere" 100) "hellothere")

;; ex 20
;; Define the function string-delete, which consumes a string plus a number i and
;; deletes the ith position from str. Assume i is a number between 0 (inclusive)
;; and the length of the given string (exclusive). See exercise 4 for ideas.
;; Can string-delete deal with empty strings?
(define (string-delete str i)
  (if (string=? str "")
      ""
      (if (and (>= i 0) (< i (string-length str)))
          (string-append (substring str 0 (if (> i 0) (- i 1) i)) (substring str (+ i 1)))
          str)))

(check-expect (string-delete "" 0) "")
(check-expect (string-delete "hello" 0) "ello")
(check-expect (string-delete "hello" -100) "hello")
(check-expect (string-delete "hello" 100) "hello")
