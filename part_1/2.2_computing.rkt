;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2.2_computing) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define (ff a)
  (* 10 a))

;; ex 21
;; Use DrRacket’s stepper to evaluate (ff (ff 1)) step-by-step.
;; Also try (+ (ff 1) (ff 1)). Does DrRacket’s stepper reuse the
;; results of computations? 
(ff (ff 1))
(+ (ff 1) (ff 1))

;; ex 22
;; Use DrRacket’s stepper on this program fragment:
(define (distance-to-origin x y)
  (sqrt (+ (sqr x) (sqr y))))

(distance-to-origin 3 4)

;; ex 23
;; The first 1String in "hello world" is "h".
;; How does the following function compute this result?
(define (string-first s)
  (substring s 0 1))

;; ex 24
;; Here is the definition of ==>: y
(define (==> x y)
  (or (not x) y))
(==> #true #false)

;; Take a look at this attempt to solve exercise 17:
(define (image-classify img)
  (cond
    [(>= (image-height img) (image-width img)) "tall"]
    [(= (image-height img) (image-width img)) "square"]
    [(<= (image-height img) (image-width img)) "wide"]))

;; What do you expect as the value of this program:
(define (string-insert s i)
  (string-append (substring s 0 i)
                 "_"
                 (substring s i)))
 
(string-insert "helloworld" 6)