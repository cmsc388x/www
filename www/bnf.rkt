#lang racket

(require scribble/core
         scribble/decode
         (except-in scribble/bnf
                    nonterm))

(provide (all-from-out scribble/bnf)
         boldtt
         (contract-out
          [nonterm (-> pre-content? ...
                       element?)]))

(define (boldtt . s)
  (make-element 'bold (make-element 'tt (decode-content s))))

(define (nonterm . s)
  (boldtt s))
