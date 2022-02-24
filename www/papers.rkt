#lang racket
(require racket/match
         scribble/core
         scribble/html-properties
         scribble/manual)

(provide (all-defined-out))

(struct venue (short long))

(define cacm (venue "CACM"
                    "Communications of the ACM"))

(define uist (venue "UIST"
                    "ACM Symposium on User Interface Software and Technology"))

(define scp (venue "SCP"
                   "Science of Computer Programming"))

(define toplas (venue "TOPLAS"
                      "ACM Transactions on Programming Languages and Systems"))

(define oopsla (venue "OOPSLA"
                      "ACM Conference on Object-Oriented Programming, Systems, Languages & Applications"))

(define pldi (venue "PLDI"
                    "ACM Conference on Programming Language Design & Implementation"))

(define venue-list
  (list cacm
        uist
        scp
        toplas
        oopsla
        pldi))

(struct paper (title authors venue year description pdf))

;; Ply
;; Expressive Power
;; FW Java
;; Full Monty
;; Prop as Type
;; Cyclone

(define paper-list
  (list (paper "Recursive Functions of Symbolic Expressions and Their Computation by Machine, Part I"
               (list "John McCarthy")
               cacm
               "1960"
               "Introduction of the LISP programming language."
               "http://www-formal.stanford.edu/jmc/recursive.pdf")
        (paper "The Next 700 Programming Languages"
               (list "P.J. Landin")
               cacm
               "1966"
               "Introduction of the ISWIM language family."
               "https://www.cs.cmu.edu/~crary/819-f09/Landin66.pdf")
        (paper "Finding and Understanding Bugs in C Compilers"
               (list "Xuejun Yang"
                     "Yang Chen"
                     "Eric Eide"
                     "John Regehr")
               pldi
               "2011"
               "Report on Csmith, a tool that found hundreds of bugs in C compilers."
               "https://www.cs.utah.edu/~regehr/papers/pldi11-preprint.pdf")
        (paper "Ply: A Visual Web Inspector for Learning from Professional Webpages"
               (list "Sarah Lim"
                     "Joshua Hibschman"
                     "Haoqi Zhang"
                     "Eleanor O'Rourke")
               uist
               "2018"
               "A tool for visualizing problematic CSS layouts."
               "https://slim.computer/assets/papers/ply-uist.pdf")
        (paper "On the Expressive Power of Programming Languages"
               (list "Matthias Felleisen")
               scp
               "1991"
               "A mathematical definition for distinguishing semantically distinct languages."
               "https://homepage.cs.uiowa.edu/~jgmorrs/eecs762f19/papers/felleisen.pdf")
        (paper "Featherweight Java: A Minimal Core Calculus for Java and GJ"
               (list "Atsushi Igarashi"
                     "Benjamin C. Pierce"
                     "Philip Wadler")
               toplas
               "2001"
               "A semantics for a core form of Java."
               "https://www.cis.upenn.edu/~bcpierce/papers/fj-toplas.pdf")
        (paper "Python: The Full Monty"
               (list "Joe Gibbs Politz"
                     "Alejandro Martinez"
                     "Matthew Milano"
                     "Sumner Warren"
                     "Daniel Patterson"
                     "Junsong Li"
                     "Anand Chitipothu"
                     "Shriram Krishnamurthi")
               oopsla
               "2013"
               "A semantics for a core form of Python."
               "https://cs.brown.edu/~sk/Publications/Papers/Published/pmmwplck-python-full-monty/paper.pdf")
        (paper "Propositions as Types"
               (list "Philip Wadler")
               cacm
               "2015"
               "Uses the Curry-Howard relation to connect mathematical propositions to types."
               "https://homepages.inf.ed.ac.uk/wadler/papers/propositions-as-types/propositions-as-types.pdf")
        (paper "Region-Based Memory Management in Cyclone"
               (list "Dan Grossman"
                     "Greg Morrisett"
                     "Trevor Jim"
                     "Michael Hicks"
                     "Yanling Wang"
                     "James Cheney")
               pldi
               "2002"
               "The introduction of region-based memory management, later adopted by Rust."
               "https://www.cs.umd.edu/projects/cyclone/papers/cyclone-regions.pdf")))


(define (author-list authors)
  (match authors
    [(list)
     "[no authors listed]"]
    [(list author)
     author]
    [(list author1 author2)
     (string-append author1 " and " author2)]
    [(list-rest initial-authors ... (cons last-author '()))
     (string-append
      (apply string-append (add-between initial-authors ", "))
      ", and "
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
