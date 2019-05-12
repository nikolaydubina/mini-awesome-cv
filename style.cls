% Visual theme inspired by https://github.com/posquit0/Awesome-CV
% Nikolay Dubina <nikolay.dubina.pub@gmail.com>
% LPPL v1.3c (http://www.latex-project.org/lppl)

% Identification

\ProvidesClass{style}[2019/05/12 style]
\NeedsTeXFormat{LaTeX2e}
\LoadClass[11pt, a4paper]{article}

\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{xcolor}
\RequirePackage{xifthen}
\RequirePackage[quiet]{fontspec}
\RequirePackage{unicode-math}
\RequirePackage{fontawesome}
\RequirePackage{parskip}
\RequirePackage[default,opentype]{sourcesanspro}
\RequirePackage[unicode]{hyperref}
\hypersetup{pdftitle={}, pdfauthor={}, pdfsubject={}, pdfkeywords={}}

% Layout

\geometry{left=1.4cm, top=.8cm, right=1.4cm, bottom=1.8cm, footskip=.5cm}
\pagestyle{fancy}
\fancyhf{}
\fancyfoot{}
\fancyfoot[L]{\footerstyle{\today}}
\fancyfoot[R]{\footerstyle{\thepage}}

% Fonts

\defaultfontfeatures{Ligatures=TeX}
\newfontfamily\FA[Path=fonts/]{FontAwesome}
\newfontfamily\headerfont[
  Path=fonts/,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}
\newfontfamily\headerfontlight[
  Path=fonts/,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}
\newcommand{\bodyfont}{\sourcesanspro}
\newcommand{\bodyfontlight}{\sourcesansprolight}

% Colors

\definecolor{darktext}{HTML}{414141}
\definecolor{text}{HTML}{333333}
\definecolor{ligthtext}{HTML}{5D5D5D}

\newcommand{\headernamestyle}[2]{
    {\fontsize{32pt}{1em}\headerfontlight\color{ligthtext} #1\space{}}%
    {\fontsize{32pt}{1em}\headerfont\bfseries\color{text} #2}
}
\newcommand{\headersocialstyle}[1]{{\fontsize{8pt}{1em}\headerfont\color{text} #1}}
\newcommand{\footerstyle}[1]{{\fontsize{8pt}{1em}\bodyfontlight\color{ligthtext} #1}}
\newcommand{\sectionstyle}[1]{{\fontsize{16pt}{1em}\bodyfont\bfseries\color{text}#1}}
\newcommand{\entrytitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand{\entrysubtitlestyle}[1]{{\fontsize{8pt}{1em}\bodyfont\scshape\color{ligthtext} #1}}
\newcommand{\entryinfostyle}[1]{{\fontsize{8pt}{1em}\bodyfontlight\slshape\color{ligthtext} #1}}
\newcommand{\descriptionstyle}[1]{{\fontsize{8pt}{1em}\bodyfontlight\upshape\color{text} #1}}
\newcommand{\hgroupstyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand{\publicationsourcestyle}[2]{
    {\fontsize{10pt}{1em}\bodyfont\bfseries\color{text} #1}%
    {\fontsize{10pt}{1em}\bodyfont\color{darktext} #2}
}

% Components

\newcommand{\cvsection}[1]{
  \vspace{3mm}
  \sectionstyle{#1}
  \color{ligthtext}\leavevmode\leaders\hrule\hfill
  \vspace{3mm}
}

\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

\newcommand{\hgroup}[2]{\hgroupstyle{#1} & \descriptionstyle{#2} \\}
\newenvironment{hgroups}{
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} r L{\textwidth - 2.5cm}}
}{\end{tabular*}}

\newcommand{\cventry}[5]{
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 5.5cm} r}
        \entrytitlestyle{#2} & \entryinfostyle{#3} \\
        \entrysubtitlestyle{#1} & \entryinfostyle{#4} \\
        \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}}
    \end{tabular*}%
}

\newenvironment{cvitems}{
    \vspace{-4.0mm}
    \begin{itemize}[leftmargin=2ex, nosep, noitemsep]
    \renewcommand{\labelitemi}{\bullet}
}{
    \end{itemize}
    \vspace{-4.0mm}
}

\newcommand{\publication}[5]{
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} p{1.5cm} p{\textwidth - 7cm} >{\raggedleft\arraybackslash}p{5cm}}
        \publicationsourcestyle{#1}{#2}
        & {
            \entrytitlestyle{#3}
            \newline \descriptionstyle{#4}
        }
        & \descriptionstyle{#5}
    \end{tabular*}%
}
