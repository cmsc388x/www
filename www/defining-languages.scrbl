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
Backus-Naur Form}, or EBNF for short. Let's consider the EBNF grammar for EBNF
grammars:

@BNF[(list @nonterm{grammar}
           @nonterm{rule-list})
     (list @nonterm{rule-list}
           @nonterm{rule}
           @BNF-seq[@nonterm{rule}
                    @litchar{\n}
                    @nonterm{rule-list}])
     (list @nonterm{rule}
           @BNF-seq[@nonterm{metavariable}
                    @litchar{::=}
                    @nonterm{production-list}])
     (list @nonterm{metavariable}
           @italic{any symbol or string of symbols})
     (list @nonterm{production-list}
           @nonterm{production}
           @BNF-seq[@nonterm{production}
                    @litchar{|}
                    @nonterm{production-list}])
     (list @nonterm{production}
           @nonterm{metavariable}
           @nonterm{terminal}
           @BNF-seq[@nonterm{production}
                    @nonterm{production}]
           @BNF-seq[@nonterm{production}
                    @litchar{|}
                    @nonterm{production}]
           @BNF-seq[@litchar{(}
                    @nonterm{production}
                    @litchar{)}])
     (list @nonterm{terminal}
           @italic{any symbol or string of symbols that may exist in the
                   language})
     ]

This tells us that a @boldtt{grammar} consists of a list of one or more
@boldtt{rule}s, each of which has three parts: (1) a @boldtt{metavariable},
which is used as the name of the rule; (2) the symbol @tt{::=}; and (3) a list
of one or more @boldtt{production}s.

@margin-note{
  @bold{What is a metavariable?}

  A @emph{metavariable}, also called a @emph{metasyntactic variable}, is a word
  or symbol that stands for other words or symbols. In the same way that we use
  letters like @emph{x} to represent numbers in algebra, we can use letters or
  words in grammars to represent rules in the grammar.}

The @boldtt{metavariable} can be written as any word or symbol that you care to
write. This word or symbol is not itself part of the langauge; it's just a way
to reference rules in the grammar. Notice that in the grammar, we describe this
property using italicized text.

A @boldtt{production} is a recipe for how to @emph{expand} a metavariable. In
the same way that you might substitute the variable @emph{x} with an actual
number in an algebraic expression, you can substitute metavariables with one of
their productions when you want to construct a string in the language to which
the grammar corresponds. (We will do some examples of this in a bit, so hang
tight if this doesn't quite make sense yet!)

There are a few kinds of productions you can write. The simplest one is to
replace the metavariable to which the production corresponds with a
@boldtt{literal}. A literal is any symbol or string of symbols that are part of
the language. If we were talking about the language of arithmetic expressions
(like @tt{1 + 1} or @tt{6 x 9}), the list of literals used would include
@litchar{1}, @litchar{6}, @litchar{9}, @litchar{+}, and @litchar{x}. These are
symbols that cannot be expanded to anything else.

In addition to literals, there are also @emph{non-literals}: rules! When you
see a metavariable in a production, it represents another part of the grammar.
Variables in algebra are also non-literals, so the expression @tt{x + 1}
contains the non-literal @tt{x} and the two literals @litchar{+} and
@litchar{1}.

The next kind of production is one which points to another rule by using a
metavariable. Although you could hypothetically write anything and call it a
metavariable, a grammar is only considered to be well-formed ("useful") if the
metavariables used in productions are defined as rules in the same grammar.

Next, productions can be sequences of other productions. (Yes, rules can
reference themselves recursively!)

You can also provide multiple alternate productions using @litchar{|}. This is
the same as if you were to write multiple rules with the same metavariable. It
means that, whenever you encounter that metavariable, you can use any one of
the associated productions.

Lastly, a production can be a production wrapped in parentheses. This is useful
if you want to provide sequences or alternates within a larger production.


@subsubsection{A Grammar for the Lambda Calculus}

To give another example, let's consider an EBNF grammar for the
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

The first rule, named @boldtt{x}, corresponds to variable names. The italic
text to the right of the @tt{::=} symbol is meant to be read literally rather
than as a mathematical concept. Whatever you think "any variable name" means,
that's how we've defined @boldtt{x}.

The second rule, @boldtt{e}, corresponds to @emph{expressions}. According to
this grammar, an expression can be one of three things:

@itemlist[

  @item{A variable (shown using the metavariable @boldtt{x}). Some langauges
        may choose to constrain what exactly a "variable" may be, but for our
        purposes right now we will simply allow any string of letters that are
        not used as literals in the grammar, which in this case is just λ
        (lambda).}

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
and @emph{values} when we discuss semantics.}

The third and final rule, @boldtt{v}, corresponds to @emph{values}. In this
grammar, we define values to be identical to @emph{abstractions} from the
expressions.


@subsection{Producing Syntax}

Once a grammar has been established, it can be used to generate strings in the
corresponding langauge. To start building productions, you start at a
non-terminal. Let's start with the rule for expressions, @boldtt{e}, from our
grammar for the lambda calculus, and expand the non-terminals until we get to a
sequence of terminals.

@itemlist[

  @item{@boldtt{e}}

  @item{@litchar{(} @nonterm{e} @nonterm{e} @litchar{)}}

  @item{@litchar{(} @litchar{(} @litchar{λ} @litchar{(} @nonterm{x} @litchar{)}
        @nonterm{e} @litchar{)} @nonterm{e} @litchar{)}}

  @item{@litchar{(} @litchar{(} @litchar{λ} @litchar{(} @litchar{x} @litchar{)}
        @nonterm{e} @litchar{)} @nonterm{e} @litchar{)}}

  @item{@litchar{(} @litchar{(} @litchar{λ} @litchar{(} @litchar{x} @litchar{)}
        @nonterm{x} @litchar{)} @nonterm{e} @litchar{)}}

  @item{@litchar{(} @litchar{(} @litchar{λ} @litchar{(} @litchar{x} @litchar{)}
        @litchar{x} @litchar{)} @nonterm{e} @litchar{)}}

  @item{@litchar{(} @litchar{(} @litchar{λ} @litchar{(} @litchar{x} @litchar{)}
        @litchar{x} @litchar{)} @nonterm{x} @litchar{)}}

  @item{@litchar{(} @litchar{(} @litchar{λ} @litchar{(} @litchar{x} @litchar{)}
        @litchar{x} @litchar{)} @litchar{y} @litchar{)}}

]

We can see from this process that generating a string from a grammar involves a
sequence of @emph{rewriting steps} (also called @emph{substitutions}). You
start with a non-terminal, then rewrite that non-terminal with one of its
productions, then continue rewriting the non-terminals generated from those
productions until you end up with a string that consists of only terminals.
(Although not strictly necessary, it is typical to expand the non-terminals
from left to right, as we did in the above example.)
