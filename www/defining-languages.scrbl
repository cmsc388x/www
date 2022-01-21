#lang scribble/manual
@(require scribble/core
          scribble/html-properties
          "bnf.rkt"
          "common.rkt")

@title[#:style 'unnumbered]{Defining Languages}

Throughout this class, we will be reading and writing language definitions
quite frequently. To make this process easier, we should all be sure to have
the same terminology and tools.


@section{Syntax}

When we define a programming language, we often first begin with some notion of
the language's
@link["https://en.wikipedia.org/wiki/Syntax_(programming_languages)"]{@emph{syntax}}.
Syntax is what a language looks like or how it is written.


@subsection{Syntactic Terminology}

First, let's go over some quick definitions:

@itemlist[

  @item{@emph{symbol} --- Any atomic thing that can be written, such as letters
        or numbers.}

  @item{@emph{alphabet} --- A @emph{set} of @emph{symbols}.}

  @item{@emph{string} --- A finite @emph{sequence} of @emph{symbols} from a
        single @emph{alphabet}. Sometimes also called a @emph{word}.}

  @item{@link["https://en.wikipedia.org/wiki/Formal_language"]{@emph{language}}
        --- A @emph{set} of @emph{strings} composed from a single
        @emph{alphabet}.}

]

When defining a language, we @emph{could} just stick to sets of strings, such
as @tt{@"{"foo, bar, baz@"}"}. However, this is limiting in two ways:

@itemlist[#:style 'ordered

  @item{We can only write finite languages this way.}

  @item{If the language grows even slightly, writing it becomes quite tedious.}

]

Instead, let's use @emph{grammars}.


@subsection{Grammars}

A @link["https://en.wikipedia.org/wiki/Formal_grammar"]{@emph{grammar}} is a
set of rules that allow you to transform an abstract specification for a
language into a concrete string contained by that language. (This may feel a
bit abstract, so just hang tight and keep reading a bit further.)

There are various ways to write language grammars, but in this class we will
use a variant of what is known as
@link["https://en.wikipedia.org/wiki/Extended_Backus–Naur_form"]{Extended
Backus-Naur Form}, or EBNF for short. Let's consider an EBNF grammar for the
@link["https://en.wikipedia.org/wiki/Lambda_calculus"]{lambda calculus}:

@(let ([open @litchar{(}]
       [close @litchar{)}])
   @BNF[(list @nonterm{x}
              @italic{any variable name})
        (list @nonterm{e}
              @nonterm{x}
              @BNF-seq[open @nonterm{e} @nonterm{e} close]
              @BNF-seq[open @litchar{λ}
                       open @nonterm{x} close
                       @nonterm{e} close])
        (list @nonterm{v}
              @BNF-seq[open @litchar{λ}
                       open @nonterm{x} close
                       @nonterm{e} close])])

We see three definitions, each consisting of a @emph{metavariable} (@boldtt{x},
@boldtt{e}, and @boldtt{v}), the symbol @tt{::=}, and some other stuff on the
right side of the @tt{::=} symbol.

The first metavariable, @boldtt{x}, corresponds to variable names. The italic
text to the right of the @tt{::=} symbol is meant to be read literally rather
than as a mathematical concept. Whatever you think "any variable name" means,
that's how we've defined @boldtt{x}.

The second metavariable, @boldtt{e}, corresponds to @emph{expressions}.
According to this grammar, an expression can be one of three things:

@itemlist[

  @item{A variable (shown using the metavariable @boldtt{x}).}

  @item{A sequence consisting of: a literal left parenthesis, an expression, a
        second expression, and a literal right parenthesis. Note that the two
        inner expressions do not need to be the same. This rule is often called
        @emph{application}.}

  @item{A sequence consisting of: a literal left parenthesis, a literal lambda
        character, a literal left parenthesis, any variable, a literal right
        parenthesis, any expression, and a literal right parenthesis. This rule
        is often called @emph{abstraction}, @emph{function}, or @emph{lambda}.}

]

@margin-note{We will come back to the distinction between @emph{expressions}
and @emph{values} shortly.}

The third and final metavariable, @boldtt{v},
corresponds to @emph{values}. We define values here to be identical to
@emph{abstractions} from the expressions.
