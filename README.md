# Teaching Templates
My templates for creating assignments and exam booklets for [NUS SoC](https://comp.nus.edu.sg).

Templates can be adaptable for any institution.

Student Exam Answer Booklet is compatible for marking with [Softmark](https://www.softmark.org/)

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
2. Fill in the details of your institution and module in `module_details.tex`
3. Compile whichever template you want! (suggested: [`pdfLaTeX`](https://en.wikipedia.org/wiki/PdfTeX))

# How To Use
## Configuring Global Settings
Global settings can be found in `module_details.tex`. There are eight parameters to modify:
- `\setinstitution`: Your institution. Example: `\setinstitution{National University of Singapore}`. The institution will be displayed in the title and the copyright notice in the document footers
- `\setdepartment`: Your department. Example: `\setinstitution{Department of Computer Science, School of Computing}`. The department will be displayed in the title.
- `\setmodulecode`: The module code your document(s) belong(s) to. Example: `\setmodulecode{CS1234}`. The module code will be displayed in the title and the document headers.
- `\setmoduletitle`: The title of the module. Example: `\setmoduletitle{Programming 101}`. The module title will be displayed in the title.
- `\setfullacademicyear`: The current academic year. Example, to display "Academic Year 2023/2024" in the title, use `\setfullacademicyear{2023/2024}`.
- `\setshortacademicyear`: An abbreviation of the academic year to be used in the document headers. For example, `\setshortacademicyear{23/24}` will show "AY23/24" in the document headers.
- `\setsemester`: The current semester. For example, `\setsemester{Special Term II}` will display "Special Term II" in the title.
- `\setcopyrightyear`: The copyright year for the document footers.
