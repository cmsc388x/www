#lang scribble/manual
@(require scribble/core
          scribble/html-properties
          scriblib/footnote
          "common.rkt")

@title[#:style 'unnumbered]{Syllabus}

@local-table-of-contents[]


@section{Prerequisites and Description}

There is no explicit prerequisit for @coursename, but we highly recommend
students to have taken CMSC 330. We assume basic knowledge of functional
programming in OCaml, operational semantics, and the lambda calculus.

@coursename is an introduction to research in the field of programming
languages (PL) that is specifically tailored to undergraduate students. We will
explore foundational results in PL reseearch as well as the skills and
techniques used in developing new research.


@section{Course Organization}

@margin-note{As this is the first semester for @coursename, the organization of
the class is still under active development!}

@coursename will meet twice a week, with the first meeting of each week
focusing on papers and the second meeting focusing on lambda calculi, type
systems, and other important concepts in PL research.

@subsection{Research Papers}

The class will read and discuss published PL research each week. We understand
that research papers can be dense, difficult to comprehend, and otherwise very
time-consuming to read. Part of the goal of @coursename is to help you develop
techniques for effectively reading research papers.

We also will not expect every student to read every paper in its entirety each
week. Instead, students will be assigned a specific paper (possibly with a
small group of other students). It will be their responsibility to have read
this paper in its entirety prior to the scheduled discussion for that paper,
and then lead a discussion about the paper.

When it is not your turn to present/lead discussion, we still expect you to
read @emph{some} of the scheduled paper. Specifically, we expect students to
have read the Abstract, Introduction, and Conclusion sections, as those can
give at least some information to use in discussion. (But we heavily encourage
students to read as much of every paper as possible.)

@subsection{Practical Material}

The other meeting each week will focus on developing practical skills for
conducting PL research. For example, we will implement a series of interpreters
based on the simple lambda calculus, adding features to the basic language
until we arrive at a more complex and fully-featured language.

From there, we will shift focus to the development of interesting type systems
using a different system. Throughout this process, we will use operational
semantics to model the features with which we wish to extend our languages.


@section{COVID-19}

As the COVID-19 pandemic continues, we refer students to the Provost's
@link["https://provost.umd.edu/node/4265"]{FAQ on Fall 2021 instruction}.

@bold{Face coverings over the nose and mouth are required while you are indoors
at all times.} There are no exceptions when it comes to classrooms,
laboratories, and campus offices. Students not wearing a mask will be given a
warning and asked to wear one, or will be asked to leave the room immediately.
Students who have additional issues with the mask expectation after a first
warning will be referred to the Office of Student Conduct for failure to comply
with a directive of University officials.


@section{Grading}

Although it is designed for undergraduates, this course will introduce advanced
(graduate-level) material. We will conduct grading similar to what you may find
in a graduate-level course. Final grades will be determined holistically based
on your participation and effort given over the course of the semester.


@section{Attendance}

Because participation is important to your grades in this class, attendance is
also important. However, you are adults and we trust you to make choices in
your best interest. Below, we provide some policies regarding what you can do
if you miss a day of class.

However, in any of these cases, please reach out to the course staff and they
will work with you to come to a reasonable solution. Our primary interest in
this class is for you to learn and grow as a computer scientist and,
potentially, as a researcher.

Additionally, your personal health is more important than anything that will
happen in class. Always prioritize your own physical and emotional needs, and
we will work with you to the extent possible.

@subsection{Reading Days (Presenting)}

If you miss a reading day when you are scheduled to present for the class and
lead the subsequent discussion, we will need to work something out. Leading a
discussion is seen as a critical component of the class, so this will have to
be handled on a case-by-case basis.

@subsection{Reading Days (Not Presenting)}

If you miss a reading day when you are @emph{not} scheduled to present, we will
ask you to read the presented paper on your own and either turn in a (brief)
write-up of your thoughts or meet with us in office hours to go over the paper.
If you choose the write-up option, we may also provide a short list of
questions to guide your response.

@subsection{Practice Days}

If you miss a practice day, you will still be expected to complete whatever
homework was due on that day or assigned on that day. Additionally, you will
probably want to watch the recorded lecture or meet with the instructor(s) in
office hours to learn the material you missed.

@subsection{Midterm}

If there is a midterm and you miss it, you will need to work something out with
us directly. We will handle these as needed on a case-by-case basis.

@subsection{Final Project}

The final project must be submitted to pass the class. If something comes up
that prohibits you from completing your project in some way, please contact the
course staff immediately.


@section{Students with Disabilities}

Students with disabilities who have been certified by Disability Support
Services as needing any type of special accommodations should see the
instructor as soon as possible during the schedule adjustment period (the first
two weeks of class). Please provide DSS’s letter of accommodation to the
instructor at that time.

All arrangements for exam accommodations as a result of disability @bold{must}
be made and arranged with the instructor @bold{at least} three business days
prior to the exam date; later requests (including retroactive ones) will be
refused.


@section{University of Maryland Policies for Undergraduate Students}

Please read the university's guide on
@link["https://www.ugst.umd.edu/courserelatedpolicies.html"]{Course Related
Policies}, which provides you with resources and information relevant to your
participation in a UMD course.


@section{Academic Integrity}

The Campus Senate has adopted a policy asking students to include the following
statement on each examination or assignment in every course: "I pledge on my
honor that I have not given or received any unauthorized assistance on this
examination (or assignment)." Consequently, you will be requested to include
this pledge on each exam and assignment. Please also carefully read the Office
of Information Technology's @link["http://www.nethics.umd.edu/aup/"]{policy}
regarding acceptable use of computer accounts.

Assignments and projects are to be completed @bold{individually}, therefore
cooperation with others or use of unauthorized materials on assignment or
projects is a violation of the University's Code of Academic Integrity. Both
the person receiving assistance @bold{and the person providing assistance} are
in violation of the honor code. @bold{Any evidence} of this, or of unacceptable
use of computer accounts, use of unauthorized materials or cooperation on exams
or quizzes, or other possible violations of the Honor Code, @bold{will be
submitted} to the Student Honor Council, which could result in an XF for the
course, suspension, or expulsion.

@itemlist[

  @item{For learning the course concepts, students are welcome to study
        together or to receive help from anyone else. You may discuss with
        others the assignment or project requirements, the features of the
        programming languages used, what was discussed in class and in the
        class web forum, and general syntax errors. Examples of questions that
        would be allowed are "Does a cond expression always end with an
        else-clause?" or "What does a 'mismatched parenthesis' error
        indicate?", because they convey no information about the contents of an
        assignment.}

  @item{When it comes to actually writing an assignment, other than help from
        the instructional staff, assignments must solely and entirely be your
        own work. Working with another student or individual, or using anyone
        else's work @bold{in any way} except as noted in this paragraph, is a
        violation of the code of academic integrity and @bold{will be reported}
        to the Honor Council. You may not discuss design of any part of an
        assignment with anyone except the instructor and teaching assistants.
        Examples of questions you may @bold{not} ask others might be "How did
        you implement this part of the assignment?" or "Please look at my code
        and help me find my stupid syntax error!". You may not use any
        disallowed source of information in creating either the design or code.
        When writing assignment you are free to use ideas or @bold{short
        fragments} of code from @bold{published} textbooks or @bold{publicly
        available} information, but the specific source must be cited in a
        comment in the relevant section of the program.}

]

@bold{Violations of the Code of Academic Integrity may include, but are not
limited to:}

@itemlist[

  @item{Failing to do all or any of the work on a project by yourself, other
        than assistance from the instructional staff.}

  @item{Using any ideas or any part of another person's project, or copying any other individual's work in any way.}

  @item{Giving any parts or ideas from your project, including test data, to
        another student.}

  @item{Allowing any other students access to your program on any computer
        system.}

  @item{Posting solutions to your projects to publicly-accessible sites, e.g.,
        on github.}

  @item{Transferring any part of an assignment or project to or from another
        student or individual by any means, electronic or otherwise.}

]

If you have any question about a particular situation or source then consult
with the instructors in advance. Should you have difficulty with a programming
assignment you should @bold{see the instructional staff in office hours}, and
not solicit help from anyone else in violation of these rules.

@bold{It is the responsibility, under the honor policy, of anyone who suspects
an incident of academic dishonesty has occurred to report it to their
instructor, or directly to the Honor Council.}

Every semester the department has discovered a number of students attempting to
cheat on assignments, in violation of academic integrity requirements.
Students' academic careers have been significantly affected by a decision to
cheat. Think about whether you want to join them before contemplating cheating,
or before helping a friend to cheat.

You are welcome and encouraged to study and compare or discuss their
implementations of the assignment with any others after they are graded,
@bold{provided that} all of the students in question have received nonzero
scores for that assignment, and if that assignment will not be extended upon in
a later assignment.


@section{Right to Change}

The @coursename instructional staff reserve the right to change any information
presented on this syllabus. Any such changes will be announced to students.


@section{Course Materials}

The materials for this course have been developed by Pierce Darragh and Justin
Frank, under supervision of Leonidas Lampropoulos.

Some of the elements of the course are based on material by:

@itemlist[

  @item{Matthew Flatt}
  @item{Benjamin C. Pierce}
  @item{David Van Horn}

]