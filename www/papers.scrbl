#lang scribble/manual
@(require scribble/core
          scribble/html-properties
          "common.rkt"
          "papers.rkt")

@title[#:style 'unnumbered]{Papers}

Each week of the semester, we will read one published, peer-reviewed research
paper from the field of programming languages and discuss it as a group in
class.

This semester, the papers we will read are:

@itemlist[#:style 'ordered @(map paper->item paper-list)]

@section[#:style 'unnumbered]{Venues}

The above list of papers uses short names for conference venues. Those names
correspond to the following full names:

@itemlist[@(map (lambda (v)
                  (item (string-append (venue-short v) ": " (venue-long v))))
                venue-list)]