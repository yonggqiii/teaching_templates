%% yqteach.cls 2023-10-28
%% Copyright (C) 2023 Foo Yong Qi
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2003/12/01 or later.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{yqteach}
[2023/10/24 v0.1 Yong Qi Foo's teaching document formats]

% types of documents
\newif\ifyqexam
\newif\ifyqqn
\newif\ifyqans

\DeclareOption{exam}{\yqexamtrue}
\DeclareOption{assignment}{\yqexamfalse}
\DeclareOption{qn}{\yqqntrue\yqansfalse}
\DeclareOption{ans}{\yqqnfalse\yqanstrue}
\DeclareOption{soln}{\yqqnfalse\yqansfalse}
\ProcessOptions\relax

\LoadClass[12pt,a4paper,twoside]{article}
\raggedbottom

%%%%% global document user settings
\newcommand{\setmodulecode}[1]{\def\modulecode{#1}}
\newcommand{\setmoduletitle}[1]{\def\moduletitle{#1}}
\newcommand{\setdocumenttitle}[1]{\def\documenttitle{#1}}
\newcommand{\setfullacademicyear}[1]{\def\fullacademicyear{#1}}
\newcommand{\setshortacademicyear}[1]{\def\shortacademicyear{#1}}
\newcommand{\setsemester}[1]{\def\semester{#1}}
\newcommand{\setduedate}[1]{\def\duedate{#1}}
\newcommand{\setinstitution}[1]{\def\institution{#1}}
\newcommand{\setdepartment}[1]{\def\department{#1}}
\newcommand{\setcopyrightyear}[1]{\def\copyrightyear{#1}}

%%% margins
\RequirePackage[left=0.7in,right=0.7in,top=1in,bottom=0.8in]{geometry}
\setlength{\parindent}{0cm}
\setlength\parskip{0.5cm}

%%% math
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}

\newtheoremstyle{yqthm}
{10pt}                % Space above
{}                % Space below
{\slshape}        % Theorem body font % (default is "\upshape")
{}                % Indent amount
{\scshape}       % Theorem head font % (default is \mdseries)
{.}               % Punctuation after theorem head % default: no punctuation
{ }               % Space after theorem head
{}                % Theorem head spec
\theoremstyle{yqthm}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}{Lemma}[section]
\newtheorem{corollary}{Corollary}[section]
\newtheorem{proposition}{Proposition}[section]
\newtheorem{conjecture}{Conjecture}[section]

% hyperlinks
\RequirePackage{hyperref}       % hyperlinks
\hypersetup{
colorlinks=true,
linkcolor=violet,
filecolor=violet,
urlcolor=violet,
citecolor=violet
}
\def\sectionautorefname{Section}
\def\subsectionautorefname{Subsection}
\def\figureautorefname{Figure}
\def\tableautorefname{Table}
\def\lemmaautorefname{\textsc{Lemma}}
\def\theoremautorefname{\textsc{Theorem}}
\def\corollaryautorefname{\textsc{Corollary}}
\def\propositionautorefname{\textsc{Proposition}}
\def\conjectureautorefname{\textsc{Conjecture}}

%%% captions
\RequirePackage{caption, float}
\captionsetup[table]{position=top}
\DeclareCaptionFormat{yq}{\sffamily\textbf{#1#2}#3}
\captionsetup{format=yq}

%%% fonts
\RequirePackage{libertine}
\RequirePackage{inconsolata}
\RequirePackage[libertine]{newtxmath}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

%%% headers 
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead{}
\fancyhead[RO,RE]{\yqheader}
\fancyfoot{}
\fancyfoot[LO,LE]{\sffamily\footnotesize \copyright\ \copyrightyear\ \institution. All rights reserved.}
\fancyfoot[RO,RE]{\sffamily \thepage /\numpages}

%%% tables
\RequirePackage{tabularx}

%%% lists
\RequirePackage{enumitem}
\setlist{topsep=0pt,itemsep=5pt,partopsep=0pt, parsep=0pt}

%%% to get the last page and question
\RequirePackage{lastpage}
\RequirePackage{totcount}
\RequirePackage{fmtcount}

%%% graphics
\RequirePackage{graphicx}
\RequirePackage{wrapfig}
\RequirePackage{tikz}

%%% if-else macros
\RequirePackage{ifthen}

%%% Exam sections
\newcommand{\examsection}[2]{\section*{{\sffamily\MakeUppercase{#1} \marksdisplay{#2}}}}
\newcommand{\examsubsection}[2]{\subsection*{{\sffamily #1 \marksdisplay{#2}}}}
\newcommand{\examsubsubsection}[2]{\subsubsection*{{\sffamily #1 \marksdisplay{#2}}}}

%%% Marks display word
\newcommand{\marksdisplay}[1]{\ifthenelse{\equal{#1}{1}}{[#1 mark]}{[#1 marks]}}

%% Topic display word
\def \ifempty#1{\def\temp{#1} \ifx\temp\empty }
\def\topicdisplay#1{\ifempty{#1}\else\ (#1) \fi}

%%% Exam questions
\newcounter{questioncounter} % question counter
\newcounter{subquestioncounter} % subquestion counter
\regtotcounter{questioncounter} % to obtain total number of questions
\def\totalquestions{\total{questioncounter}}
\def\numpages{\pageref*{LastPage}}
% question command
\newcommand{\q}[2][]{\setcounter{subquestioncounter}{0}\refstepcounter{questioncounter}{\sffamily\bfseries Question \thequestioncounter\topicdisplay{#1}} \marksdisplay{#2}.}
% subquestion command
\newcommand{\sq}[2][]{\refstepcounter{subquestioncounter}{\bfseries\sffamily Question \thequestioncounter} (\roman{subquestioncounter})\topicdisplay{#1} \marksdisplay{#2}.}
\makeatletter
% custom question command
\def\cq{%
   \@ifnextchar[%
     {\cq@i}
     {\cq@i[1]}%
}
\def\cq@i[#1]{%
   \@ifnextchar[%
     {\cq@ii{#1}}
     {\cq@ii{#1}[]}%
}
\def\cq@ii#1[#2]#3{%
  \setcounter{questioncounter}{#1}\setcounter{subquestioncounter}{0}{\bfseries\sffamily Question \thequestioncounter\topicdisplay{#2}} \marksdisplay{#3}.
}
% custom subquestion command
\def\csq{%
   \@ifnextchar[%
     {\csq@i}
     {\csq@i[1]}%
}
\def\csq@i[#1]{%
   \@ifnextchar[%
     {\csq@ii[#1]}
     {\csq@ii[#1][1]}%
}
\def\csq@ii[#1][#2]{%
   \@ifnextchar[%
     {\csq@iii[#1][#2]}
     {\csq@iii[#1][#2][]}%
}
\def\csq@iii[#1][#2][#3]#4{%
  \setcounter{questioncounter}{#1}\setcounter{subquestioncounter}{#2}{\bfseries\sffamily Question \thequestioncounter} (\roman{subquestioncounter})\topicdisplay{#3} \marksdisplay{#4}.}
\makeatother

% Exam MCQ options
\newenvironment{letteroptions}{\begin{enumerate}[label={\bfseries\sffamily(\Alph*)}]}{\end{enumerate}}

%%%%% document-specific settings
\ifyqqn
%%% any question booklet
% set document end
\def\endofdocument{\begin{center}\large\sffamily-- \textbf{End of \documenttitle} --\end{center}}
\else\ifyqans\else
%%% any solutions manual
\newcommand{\answer}{\emph{Answer}:\ } % answer macro
\newcommand{\ansopt}[1]{\textbf{(#1)}} % answer option macro
\fi\fi
\ifyqexam
%%%%%%% exam
\newcommand{\settimeallowed}[1]{\def\timeallowed{#1}} % for setting allowed time
% exam kind of booklet
\ifyqqn
\def\yqkind{Question Booklet}
\else
    \ifyqans
    \def\yqkind{Answer Booklet}
    \else
    \def\yqkind{Solutions Manual}
    \fi
\fi
% global exam header
\def\yqheader{\sffamily\textbf{\modulecode} AY\shortacademicyear\ \semester\ \textbf{\documenttitle}\ \yqkind}
% global exam titlepage
\def\maketitle{{
\centering
    \large
    {\sffamily\textbf{\MakeUppercase{\institution}}}\\
    \department\\
    {\sffamily\textbf{\modulecode\textemdash\moduletitle}}\\
    \normalsize
    Academic Year \fullacademicyear, \semester\\
    \Large
    {\MakeUppercase{\sffamily\textbf{\documenttitle}}}\\
    \large
    \yqkind

    \begin{tabularx}{\textwidth}{
        >{\raggedright\arraybackslash}X >{\raggedleft\arraybackslash}X
    }
        \duedate & \textbf{Time allowed:} \timeallowed\\
    \end{tabularx}
    \rule{\textwidth}{1pt}
}}
\ifyqqn
%%%%% exam question booklet
\newcommand{\settotalscore}[1]{\def\totalscore{#1}} % total score
\newcommand{\settotalweight}[1]{\def\totalweight{#1}} % total weightage
\def\instructionshead{\item This question booklet comprises \textbf{\totalquestions\ questions} and \textbf{\numpages\ printed pages} including the cover page. All questions must be answered correctly to obtain the full score.}
\def\clearinstructions{\def\instructionshead{}\def\instructionstail{}}
\def\instructionstail{\item The total attainable score is \textbf{\totalscore}. The assessment constitutes \textbf{\totalweight\%} of your overall grade.
\item You \textbf{cannot} communicate with anyone other than the invigilators throughout the quiz.
\item \textbf{You must attempt the quiz on your own}. The University takes a zero-tolerance approach towards plagiarism and cheating.}
% instructions
\newenvironment{instructions}{
{\sffamily\bfseries INSTRUCTIONS TO CANDIDATES} (\emph{please read carefully}):
\begin{enumerate}[parsep=5pt]
\instructionshead
}{
\instructionstail
\end{enumerate}
\pagebreak}
\else
\ifyqans
%%%%%%% exam answer booklet
\newcommand{\settotalscore}[1]{\def\totalscore{#1}} % total score
\def\instructions{\item This answer booklet contains \textbf{\numpages\ printed pages} including this cover page.
    \item \textbf{Do NOT write your name anywhere in this document}.
    \item Bubbles must be \textbf{completely shaded} with a \textbf{pencil (at least 2B)}. \textbf{You may write with a pencil or pen (no red ink)}.
    \item Write and shade your Student Number (starting with \texttt{A}) on the right.
    \item All your answers must be written/shaded in this answer booklet. No extra sheets will be accepted as answers. You may use the question booklet as scratch paper.}
\def\setinstructions#1{\def\instructions{#1}}
% titlepage
\def\maketitle{{
\centering
    \large
    {\sffamily\textbf{\MakeUppercase{\institution}}}\\
    \department\\
    {\sffamily\textbf{\modulecode\textemdash\moduletitle}}\\
    \normalsize
    Academic Year \fullacademicyear, \semester\\
    \Large
    {\MakeUppercase{\sffamily\textbf{\documenttitle}}}\\
    \large
    \yqkind

    \begin{tabularx}{\textwidth}{
        >{\raggedright\arraybackslash}X >{\raggedleft\arraybackslash}X
    }
        \duedate & \textbf{Time allowed:} \timeallowed\\
    \end{tabularx}
    \rule{\textwidth}{1pt}
}

\begin{minipage}[t][8cm]{\textwidth}

\begin{wrapfigure}{r}{0.41\textwidth}
\centering
\raisebox{0pt}[\dimexpr\height-1.3\baselineskip\relax]{\includegraphics[width=6.5cm]{nu1_student_id_box.png}}
\end{wrapfigure}

\textsf{\textbf{INSTRUCTIONS TO CANDIDATES}}:
\begin{enumerate}[itemsep=5pt,leftmargin=20pt]
\instructions
\end{enumerate}
\end{minipage}
}
%% for the marking summary at the front page
\newenvironment{markingsummary}{
\begin{center}
  \Large\sffamily
  \rule{\textwidth}{1pt}
  
  \textbf{\textsf{For Examiner's Use Only}}
  
  \large
  
\bgroup
\def\arraystretch{1.8}
\begin{tabular}{|l|l|p{0.4\textwidth}|}
\hline
\textbf{Section} & \textbf{Marks}& \textbf{Remarks}\\
\hline
}{
\markingsection{\textbf{Total}}{\totalscore}
\end{tabular}
\egroup
\end{center}
}

\newcommand{\markingsection}[2]{#1 & \ \ \ \ \ \ \ /\ {\normalfont\bfseries#2}&\\
\hline
}
% for creating answer boxes
\newcommand{\answerbox}[1]{\framebox(\textwidth,#1){}}
% for extra space declaration
\def\extraspace{\begin{center}Use the following space ONLY if you need extra space for your answers, and indicate the \textbf{question number
clearly}. \textbf{Do NOT} use it for your rough work.\end{center}}
% end of document
\def\endofdocument{\begin{center}\large\sffamily-- \textbf{End of \yqkind} --\end{center}}
\else
%%%%%%% exam solutions manual
% end of document
\def\endofdocument{\begin{center}\large\sffamily-- \textbf{End of \yqkind} --\end{center}}
\fi
\fi
\else
%%%%%% assignment
% assignment specific settings
\newcommand{\setdocumentsubtitle}[1]{\def\documentsubtitle{#1}} % assignment subtitle
\ifyqqn
%%%%%%%% assignment question
\newcommand{\settotalscore}[1]{\def\totalscore{#1}} % assignment total score
\newcommand{\settotalweight}[1]{\def\totalweight{#1}} % assignment total weight
% header
\def\yqheader{\sffamily\textbf{\modulecode} AY\shortacademicyear\ \semester\ \textbf{\documenttitle}}
% titlepage
\def\maketitle{{
\centering
    \large
    {\sffamily\textbf{\MakeUppercase{\institution}}}\\
    \department\\
    {\sffamily\textbf{\modulecode\textemdash\moduletitle}}\\
    \normalsize
    Academic Year \fullacademicyear, \semester\\
    {\MakeUppercase{\sffamily\textbf{\documenttitle}}}\\
    \Large
    {\MakeUppercase{\sffamily\textbf{\documentsubtitle}}}\\
    \large

    \begin{tabularx}{\textwidth}{
        >{\raggedright\arraybackslash}X >{\raggedleft\arraybackslash}X
    }
        \textbf{Due:}\ \duedate & \textbf{Score}: \marksdisplay{\totalscore} (\totalweight\%)\\
    \end{tabularx}
    \rule{\textwidth}{1pt}
}}
\else
\ifyqans
%%%%% assignment answers
\else
%%%%%% assignment solutions
% header
\def\yqheader{\sffamily\textbf{\modulecode} AY\shortacademicyear\ \semester\ \textbf{\documenttitle} Solutions}
% titlepage
\def\maketitle{{
\centering
    \large
    {\sffamily\textbf{\MakeUppercase{\institution}}}\\
    \department\\
    {\sffamily\textbf{\modulecode\textemdash\moduletitle}}\\
    \normalsize
    Academic Year \fullacademicyear, \semester\\
    \large
    {\sffamily\bfseries\MakeUppercase{\documenttitle\ Solutions}}
    
    \rule{\textwidth}{1pt}
}}
% end of document
\def\endofdocument{\begin{center}\large\sffamily-- \textbf{End of \documenttitle\ Solutions} --\end{center}}

\fi

\fi

\fi
