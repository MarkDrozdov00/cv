\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ExpressiveResume}[2021/12/13 Expressive Resume Template]

%% ----- Options -----
% https://www.latex-project.org/help/documentation/clsguide.pdf

% None currently

%% ----- Parent Class -----
\LoadClass{Expressive}

%% ----- Required Packages -----
%% Define page layout
\RequirePackage[margin=0.5in]{geometry}
    \pagestyle{empty}

%% ----- Custom Commands -----
% Header Block
\newkeycommand{\resumeheader}[
        firstname, middleinitial, lastname,
        email,
        phone,
        linkedin,
        github,
        website,
        city,
        state,
        qrcode,
        fixobjectivespacing
        ]{
    \hspace{-18pt} % Adjust this value to move the text to the left
    \begin{minipage}[t]{0.75\textwidth}
        \vspace{-50pt} % Adjust this value to move the text up
        \begin{flushleft}
            \nametitle{\commandkey{firstname}}{\ifcommandkey{middleinitial}{\commandkey{middleinitial}. }{}\commandkey{lastname}}
            {%
                \ifcommandkey{email}{\email{\commandkey{email}}}{}%
                \ifcommandkey{linkedin}{\contactseparator\linkedin{\commandkey{linkedin}}}{}%
                \ifcommandkey{github}{\contactseparator\github{\commandkey{github}}\\}{}%
                \vspace{2pt}
                \ifcommandkey{phone}{\contactseparator\phone{\commandkey{phone}}}{}%
                \\ % Line break before the location information
                \ifcommandkey{state}{\location{\ifcommandkey{city}{\commandkey{city}, }{}\commandkey{state}}}{}%
                \ifcommandkey{website}{\contactseparator\website{\commandkey{website}}}{}%
            }
        \end{flushleft}
    \end{minipage}%
    \begin{minipage}[t]{0.25\textwidth}
        \ifcommandkey{qrcode}{%
            \begin{flushright}
                \hspace{40pt} % Adjust this value to move the image further to the right
                \includegraphics[width=2cm]{\commandkey{qrcode}} % Adjust size as needed
            \end{flushright}
        }{}
    \end{minipage}
}


\newcommand{\objective}[1]{%
    \begin{flushleft}
        #1
    \end{flushleft}
}

%% ----- Four Required Configurations -----
\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}
\setlength{\textwidth}{7.5in}
\setlength{\textheight}{10in}
\pagenumbering{arabic}