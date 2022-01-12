#lang racket
(require racket/match
         scribble/core
         scribble/html-properties
         scribble/manual)

(provide (all-defined-out))

(struct venue (short long))

(define cacm (venue "CACM"
                    "Communications of the ACM"))

(define venue-list
  (list cacm))

(struct paper (title authors venue year description pdf))

(define paper-list
  (list (paper "Recursive Functions of Symbolic Expressions and Their Computation by Machine, Part I"
               '("John McCarthy")
               cacm
               "1960"
               "Introduction of the LISP programming language."
               "http://www-formal.stanford.edu/jmc/recursive.pdf")
        (paper "The Next 700 Programming Languages"
               '("P.J. Landin")
               cacm
               "1966"
               "Introduction of the ISWIM language family."
               "https://www.cs.cmu.edu/~crary/819-f09/Landin66.pdf")))

(define (author-list authors)
  (match authors
    ['()
     ""]
    [(list author)
     author]
    [(list author1 author2)
     (string-append author1 " and " author2)]
    [(list-rest initial-authors ... last-author)
     (string-append
      (add-between initial-authors
                   ", ")
      " and "
      last-author)]))

(define (paper->item paper)
  (item (list (string-append "\""
                             (paper-title paper)
                             "\", by "
                             (author-list (paper-authors paper))
                             ". Published in "
                             (paper-year paper)
                             " at "
                             (venue-short (paper-venue paper))
                             ". ")
              (link (paper-pdf paper)
                    "Direct PDF link."))))
