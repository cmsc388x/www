#lang scribble/manual
@(require scribble/core
          scribble/html-properties
          "common.rkt")

@title[#:style 'unnumbered]{Materials}

There are various materials that may be useful to know about for this class.


@section{Development Environment}

The practical compononents of this class, at least to start, will be completed
using OCaml.


@subsection{OCaml}

It is recommend to follow the
@link["https://ocaml.org/learn/tutorials/up_and_running.html"]{official OCaml
installation instructions} to get up and running with OCaml. (Be sure to follow
all the instructions on that page, including installing Dune and configuring
your favorite editor to support OCaml.)

This class requires an OCaml version of at least 4.12. If you only just
installed OCaml, you should be good to go. However, if you already had an
installation of OCaml then you'll want to check @tt{ocaml --version} to see
what your version is. If it's lower than 4.12, you should create a new switch
and install the necessary packages:

@verbatim|{
$ opam switch create 4.12.1
$ opam install dune utop ocaml-lsp-server merlin ounit ounit2
}|


@subsection{Camlrack}

We will be using a custom library for writing our parsers, called
@link["https://github.com/pdarragh/camlrack"]{Camlrack}. You will need to
install the @tt{ppxlib} dependency, then clone the Camlrack repository and
install it locally with @tt{dune}:

@verbatim|{
$ opam install ppxlib
$ cd /path/to/where/you/put/repositories
$ git clone https://github.com/pdarragh/camlrack.git
$ cd camlrack
$ dune build @install
$ dune install
}|


@section{Textbooks}

This course has no required textbook, but there are some books that can be used
for reference or inspiration:

@itemlist[

  @item{@emph[@link["http://cs.brown.edu/courses/cs173/2012/book/"]{Programming
        Languages: Application and Interpretation}] by Shriram Krishnamurthi.}

  @item{@emph{Types and Programming Languages} by Benjamin C. Pierce.}

  @item{@emph{Semantics Engineering with PLT Redex} by Matthias Felleisen,
        Robert Bruce Findler, and Matthew Flatt.}

]