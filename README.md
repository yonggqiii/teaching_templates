# Teaching Templates

My templates for creating assignments and exam booklets for [NUS SoC](https://comp.nus.edu.sg).

Templates can be adaptable for any institution.

Student Exam Answer Booklet is compatible with marking using [Softmark](https://www.softmark.org/)

Feel free to modify and/or redistribute these templates (just click Fork!). If you need help with these templates (or for customizing these templates for your own use), please email `yongqi@nus.edu.sg`.

Bug reports can be filed at the Issues tab.

## Included In The Box

Templates for

- Exam Question Booklets (`exam_qn.tex`)
- Exam Answer Booklets (`exam_ans.tex`)
- Exam Solutions Manuals (`exam_soln.tex`)
- Assignments (`ass_qn.tex`)
- Assignment Solutions Manuals (`ass_soln.tex`)
  These templates are powered by the `yqteach` class (`yqteach.cls`)

Also, a Python script for generating MCQ bubble tables (with or without solutions) (`table_generator.py`)

## Getting Started

1. Clone (or fork this repository and open in [Overleaf](https://www.overleaf.com))
2. Fill in the details of your institution and module in `module_details.tex` (see [how to configure the global settings](#configuring-global-settings))
3. Edit whichever template you want
4. Compile! (suggested: [`pdfLaTeX`](https://en.wikipedia.org/wiki/PdfTeX))

# How To Use

## Table of Contents

- [Configuring Global Settings](#configuring-global-settings)
- [Creating Marked Sections](#marked-sections)
- [Creating Marked Questions](#marked-questions)
- [Creating Exam Question Booklets](#exam-question-booklets)
- [Creating Exam Answer Booklets](#exam-answer-booklets)
- [Creating Exam Solutions Manuals](#exam-solutions-manuals)
- [Creating Assignment Questions](#assignment-questions)
- [Creating Assignment Solutions Manuals](#assignment-solutions-manuals)
- [Generating MCQ Bubble Tables](#generating-mcq-bubble-tables)

## Configuring Global Settings

Global settings can be found in `module_details.tex`. There are eight parameters to modify:

- `\setinstitution`: Your institution. Example: `\setinstitution{National University of Singapore}`. The institution will be displayed in the title and the copyright notice in the document footers
- `\setdepartment`: Your department. Example: `\setinstitution{Department of Computer Science, School of Computing}`. The department will be displayed in the title.
- `\setmodulecode`: The module code your document(s) belong(s) to. Example: `\setmodulecode{CS1234}`. The module code will be displayed in the title and the document headers.
- `\setmoduletitle`: The title of the module. Example: `\setmoduletitle{Programming 101}`. The module title will be displayed in the title.
- `\setfullacademicyear`: The current academic year. Example, to display "Academic Year 2023/2024" in the title, use `\setfullacademicyear{2023/2024}`.
- `\setshortacademicyear`: An abbreviation of the academic year to be used in the document headers. For example, `\setshortacademicyear{23/24}` will show "AY23/24" in the document headers.
- `\setsemester`: The current semester. For example, `\setsemester{Special Term II}` will display "Special Term II" in the title and header.
- `\setcopyrightyear`: The copyright year for the document footers.

## Marked Sections

Sections can be created with the usual `\section` and `\section*` commands.

To create marked sections, use the `\examsection` command which creates a `\section*`. The first argument to `\examsection` gives the name of the section, and the second argument is the number of marks this section is worth. For example, `\examsection{My Section}{3}` starts a new unnumbered section called `My Section [3 marks]`. The `\examsubsection` command is the same but for creating `\subsection*`s.

## Marked Questions

There are four commands for creating numbered question headers: `\q` for questions, `\sq` for sub-questions (question parts), and the custom variants `\cq` and `\csq` for creating questions with custom numbering.

`\q{123}` gives a new numbered question worth 123 marks. `\q[Algebra]{456}` gives a new numbered question with topic `Algebra` worth 456 marks. The `\sq` command behaves similarly.

For example,

```latex
\q{3} Cows are animals.
\sq{1} What are cows?
\sq{2} What do cows say?
\q[Ducks]{2} Are ducks also animals?
```

Creates

**Question 1** [3 marks]. Cows are animals.\
**Question 1** (i) [1 mark]. What are cows?\
**Question 1** (ii) [2 marks]. What do cows say?\
**Question 2 (Ducks)** [2 marks]. Are ducks also animals?

`\cq[123]{456}` creates Question 123 worth 456 marks. Similarly, `\csq[123][4]{567}` creates a subquestion Question 123 (iv) worth 567 marks. You may also optionally include the topic as the last optional argument in either command. Optional question numbering arguments default to `1`. The custom (sub)question commands changes the question and subquestion counter, and uses of `\q` or `\sq` after `\cq` or `\csq` will use those updated counter values.

For example,

```latex
\cq[4]{3} Cows are animals.
\csq[5]{1} What are cows?
\csq[1][3][Cow]{2} What do cows say?
\cq[9][Ducks]{2} Are ducks also animals?
\q{5} This is a normal question.
```

Creates

**Question 4** [3 marks]. Cows are animals.\
**Question 5** (i) [1 mark]. What are cows?\
**Question 1** (iii) (Cow) [2 marks]. What do cows say?\
**Question 2 (Ducks)** [2 marks]. Are ducks also animals?\
**Question 3** [5 marks]. This is a normal question.

_Use the `\cq` and `\csq` commands sparingly_. They can be used for example in answer booklets where you have MCQ bubbles from 1 to 10, and want to start an answer box for a written question starting at Question 11. Use `\cq` for question 11, then you can use the `\q` and `\sq` commands afterwards.

## MCQ Question Options

The convenience environment `letteroptions` creates an ordered list where the numbers are MCQ options (A, B, C etc.). This is basically an alias for `\begin{enumerate}[label={\bfseries\sffamily(\Alph*)}]`.
For example,

```latex
\begin{letteroptions}
\item An option
\item A second option
\end{letteroptions}
```

Gives

**(A)** An option\
**(B)** A second option

## Exam Question Booklets

Create a blank document, or use the provided `exam_qn.tex` template file.

### Preamble

The first statement must be `\documentclass[exam,qn]{yqteach}`. You may include any additional settings and packages after.

Input the details of the module. You can issue `\input{module_details}` if the module details are found in `module_details.tex`. See [Configuring Global Settings](#configuring-global-settings) if you have not configured it yet.

Issue the commands `\setdocumenttitle{Your Assessment Name}`, `\setduedate{Date Of Assessment}`, `\settimeallowed{Exam Time Limit}`, `\settotalscore{Exam Total Attainable Score}` and `\settotalweight{Toal Assessment Weightage}`. Most of these should be relatively straightforward. The total weight of the assessment is how much the assessment contributes to the students' overall grade. For example, `\settotalweight{20}` will tell students that the assessment is worth 20% of their overall grade. Example values can be seen in the `exam_qn.tex` file.

Then you can begin the document like so:

```latex
% all your earlier settings
\begin{document}
\maketitle

%%% your content will be here %%%

\endofdocument
\end{document}
```

### Instructions

The exam question class provides an `instructions` environment. This environment writes instructions for the students, then breaks the page.

Some instructions come with this environment. For example, the number of questions, number of pages, total attainable score, assessment weightage and plagiarism/cheating notice will be automatically added to the instructions list. The number of questions is based on the total question counter, thus _ensure that you use `\cq` and `\csq` correctly, otherwise the total number of questions reported will be wrong_.

Each instruction item is delimited with `\item`. For example:

```latex
\begin{instructions}
\item An instruction
\item Another instruction
\end{instructions}
```

Gives

1. Some instructions (automatically generated) for number of questions and pages etc.
2. An instruction
3. Another instruction
4. Other automatically generated instructions

If you want to remove the automatically generated instructions, issue the `\clearinstructions` command right after `\maketitle`. Then, to obtain the total number of questions and number of pages of the document, use the `\totalquestions` and `\numpages` commands respectively.

After this, you may proceed to fill in the sections and questions in this question booklet (see [Creating Marked Sections](#marked-sections) and onwards).

## Exam Answer Booklets

Create a blank document, or use the provided `exam_ans.tex` template file.

### Preamble

The first statement must be `\documentclass[exam,ans]{yqteach}`. You may include any additional settings and packages after.

Input the details of the module. You can issue `\input{module_details}` if the module details are found in `module_details.tex`. See [Configuring Global Settings](#configuring-global-settings) if you have not configured it yet.

Issue the commands `\setdocumenttitle{Your Assessment Name}`, `\setduedate{Date Of Assessment}`, `\settimeallowed{Exam Time Limit}` and `\settotalscore{Exam Total Attainable Score}`. Example values can be seen in the `exam_ans.tex` file.

The template automatically generates instructions for your students. If you would like to override these instructions, use the `\setinstructions{Your Instructions}` command. For example,

```latex
\setinstructions{
\item This answer booklet consists of \numpages\ printed pages.
}
```

Instruction items are delimited by `\item`.

Then you can begin the document like so:

```latex
% all your earlier settings
\begin{document}
\maketitle

%%% your content will be here %%%

\endofdocument
\end{document}
```

### Marking Summary

The exam answer booklets class provides a `markingsummary` environment. This environment gives a marking summary at the cover page, then breaks the page. It also gives the total score row that was set by `\settotalscore`.

Each marked section is delimited with the `\markingsection{Your Section Name}{Number of Marks}` command. For example:

```latex
\settotalscore{50}
% ...
\begin{markingsummary}
\markingsection{Multiple Choice Questions}{20}
\markingsection{Short Answer Questions}{30}
\end{markingsummary}
```

Gives

| Section                   | Marks | Remarks |
| ------------------------- | ----- | ------- |
| Multiple Choice Questions | /20   |         |
| Short Answer Questions    | /30   |         |
| Total                     | /50   |         |

### MCQ Bubbles for Shading

After describing the marking summary you may proceed to fill in the contents of the answer booklet.

You may use the `table_generator.py` Python script to generate mcq bubbles for students to shade (see [Generating MCQ Bubble Tables](#generating-mcq-bubble-tables)). In the `exam_ans.tex` file, you may paste the generated tables into `blank_mcq_tables.tex` and the tables will show up in the booklet.

### Answer Boxes

Typically, answer booklets come with some boxes for students to write answers. For this, you may use the `\answerbox{height of box}` command. If you want to leave some extra space for students to write answers, you may use the `\extraspace` macro to generate an extra space declaration.

Example uses of these can be found in `exam_ans.tex`.

## Exam Solutions Manuals

Create a blank document, or use the provided `exam_soln.tex` template file.

### Preamble

The first statement must be `\documentclass[exam,soln]{yqteach}`. You may include any additional settings and packages after.

Input the details of the module. You can issue `\input{module_details}` if the module details are found in `module_details.tex`. See [Configuring Global Settings](#configuring-global-settings) if you have not configured it yet.

Issue the commands `\setdocumenttitle{Your Assessment Name}`, `\setduedate{Date Of Assessment}` and `\settimeallowed{Exam Time Limit}`. Example values can be seen in the `exam_soln.tex` file.

Then you can begin the document like so:

```latex
% all your earlier settings
\begin{document}
\maketitle

%%% your content will be here %%%

\endofdocument
\end{document}
```

You may then proceed to fill in the contents of the solutions manual.

To describe MCQ solutions you may use the `table_generator.py` Python script to generate shaded mcq bubbles (based on correct answers, of course) (see [Generating MCQ Bubble Tables](#generating-mcq-bubble-tables)). When writing out answers, you may use the `\answer` and `\ansopt{MCQ Option}` macros to typeset the answer keyword and MCQ options properly.

For example:

```latex
\q{1} \answer \ansopt{B}. This is an answer.
```

Gives

**Question 1** [1 mark]. _Answer_: **(B)**. This is an answer.

## Assignment Questions

Create a blank document, or use the provided `ass_qn.tex` template file.

### Preamble

The first statement must be `\documentclass[ass,qn]{yqteach}`. You may include any additional settings and packages after.

Input the details of the module. You can issue `\input{module_details}` if the module details are found in `module_details.tex`. See [Configuring Global Settings](#configuring-global-settings) if you have not configured it yet.

Issue the commands `\setdocumenttitle{Your Assignment Name}`, `\setdocumentsubtitle{Your Assignment Subtitle}`, `\setduedate{Assignment Due Date}`, `\settotalscore{Assignment Total Score}` and `\settotalweight{Assignment Total Weight}`. Most of these should be relatively straightforward. If your assignment is called "Assignment 1: Functions" then you may let the title be `Assignment 1` and subtitle be `Functions`. The total weight of the assignment is how much the assignment contributes to the students' overall grade. For example, `\settotalweight{20}` will tell students that the assignment is worth 20% of their overall grade. Example values can be seen in the `ass_qn.tex` file.

Then you can begin the document like so:

```latex
% all your earlier settings
\begin{document}
\maketitle

%%% your content will be here %%%

\endofdocument
\end{document}
```

You may then proceed to fill in the contents of the assignment.

## Assignment Solutions Manuals

Create a blank document, or use the provided `ass_soln.tex` template file.

### Preamble

The first statement must be `\documentclass[ass,soln]{yqteach}`. You may include any additional settings and packages after.

Input the details of the module. You can issue `\input{module_details}` if the module details are found in `module_details.tex`. See [Configuring Global Settings](#configuring-global-settings) if you have not configured it yet.

Issue the command `\setdocumenttitle{Your Assignment Name}`. If your assignment is called "Assignment 1: Functions" then you may let the title be `Assignment 1`. Example values can be seen in the `ass_soln.tex` file.

Then you can begin the document like so:

```latex
% all your earlier settings
\begin{document}
\maketitle

%%% your content will be here %%%

\endofdocument
\end{document}
```

You may then proceed to fill in the contents of the solutions manual.

## Generating MCQ Bubble Tables

Use the provided `table_generator.py` Python script.

Then, configure the script based on what you need:

- In line 3, change `first_qn` and `last_qn` to denote the range of questions you want to generate bubbles for
- In line 5, change `options` and `num_cols` for the question options and number of columns. For example, if there are options A to D and you want three columns in your bubble table, do `options, num_cols = [A, B, C, D], 3`

To generate bubbles for students to shade (i.e. generate unshaded bubbles), call the `gen_table` function omitting the `answers` argument (uncomment line 12).

To generate solution bubbles, uncomment line 9 and enter your answer key, then call the `gen_table` function including the `answers` argument (uncomment line 15).

Run `python table_generator.py` which produces the table as LaTeX. Copy the output and paste it in your document to see the bubble table.
