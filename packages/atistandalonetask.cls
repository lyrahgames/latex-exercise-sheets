\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{atistandalonetask}[2018/05/31 abstract task interface standalone task]

\LoadClass[crop=false]{standalone}

% do not require more than these packages
\RequirePackage[utf8]{inputenc}
\RequirePackage{ati}

\atiSetup{show solution}
\let\atiSetup\undefined

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{standalone}}
\ProcessOptions\relax

\endinput