#lang racket

(provide (all-defined-out))

(require scribble/core
         scribble/html-properties
         scribble/manual)

;;;;
;; Instructional staff
(struct staff (name email))

(define (staff-link person) (link (string-append "mailto:" (staff-email person))
                                  (staff-name person)))

(define prof (staff "Leonidas Lampropoulos"
                    "leonidas@umd.edu"))

(define support-staff
  (list (staff "Pierce Darragh"
               "pdarragh@umd.edu")
        (staff "Justin Frank"
               "jpfrank@umd.edu")))

(define staff-links
  (map staff-link support-staff))

;;;;
;; Logistical information
(define coursename "CMSC 388X")
(define semester "Spring")
(define year "2022")
(define room "CSI 3117")
(define credits "2")
(define midterm-date "TBD")
(define final-date "TBD")
(define lecture-schedule "Monday + Wednesday, 12:00pm--12:50pm")
