[_Česky_](README.md)


# Scout songbook of 2<sup>nd</sup> Cub Pack Grasshopers – 1<sup>st</sup> ed.

Songbooks which were created in our cub scout pack 2. smečka vlčat Kobylky
Litoměřice (2<sup>nd</sup> Cub Pack Grasshopers, Litměřice town, Czech
republic) is divided to the two major branches – Oddílové zpěvníky (Pack
songbooks), which contain simpler songs and Šavlozubé zpěvníky (Saber-toothed
songbooks), where you can find more advanced songs, which can sometimes bare
its teeths. This document belongs to the Oddílový zpěvník, 1. díl
(Pack Songbook, 1<sup>st</sup> ed.).

This pack songbook makes use of [LaTeX][latex] typographic system and
[Songs][songs] package for a songbooks creation.

You can contact our 2<sup>nd</sup> Cub Pack Grasshopers Litoměřice, Czech
republic for example at pack e-mail
[2.smecka.kobylky@gmail.com][packmail] or our webpages
[http://kobylky.radobyl.eu][packweb].


## Downloads
The newest released version of the songbook or the source files packed in one
archive can be found in the section [Releases][releases]. From version 2 there
are two variants of the songbook, the one with chords `oddilovy_zpevnik1.pdf`
and the one without chords `oddilovy_zpevnik1_text.pdf`.


## Compilation requirements
- Working [LaTeX][latex] distribution. 
- [Songs][songs] package installed.
- [Xindy][xindy] program, or better its modification adapted for the LaTeX
  TeXindy which enables indexing of songs and table of content generation with
  the possibility of ordering of songs according to Czech alphabet. The
  Xindy program is usually contained in LaTeX distributions.
- [Perl][perl] programming language which is necessary for Xindy.           


## Compilation
You can run `build.bat` in Windows which executes the compilation
automatically.

Sometimes, there could be a problem with folder and file names containing
spaces or special characters. This issue is solvable by copying the songbook
to the directory which has not and the parents of which has not any special
characters or spaces in their names.

For the manual compilation, execute these commands from the root directory
of the songbook (pdflatex and texindy are called repeatedly because the first
pdflatex calling saves indexes, texindy subsquently creates a table of
contents, next call of pdflatex inserts the table of contents into the document
and generates new indexes because the pagenumbers change due to the table of
contents insertion, second texindy execution creates a new table of contents
with the new page numbers and the last pdflatex execution inserts this table of
contents into the document):
```
pdflatex -aux-directory=build oddilovy_zpevnik1.tex
texindy -L czech -C utf8 -t build/oddilovy_zpevnik1.xlg -M oddilovy_zpevnik1.xdy -o oddilovy_zpevnik1.ind build/oddilovy_zpevnik1.idx
pdflatex -aux-directory=build oddilovy_zpevnik1.tex
texindy -L czech -C utf8 -t build/oddilovy_zpevnik1.xlg -M oddilovy_zpevnik1.xdy -o oddilovy_zpevnik1.ind build/oddilovy_zpevnik1.idx
pdflatex -aux-directory=build oddilovy_zpevnik1.tex
```
or for comiplation without chords:
```
pdflatex -aux-directory=build oddilovy_zpevnik1_text.tex
texindy -L czech -C utf8 -t build/oddilovy_zpevnik1_text.xlg -M oddilovy_zpevnik1_text.xdy -o oddilovy_zpevnik1_text.ind build/oddilovy_zpevnik1_text.idx
pdflatex -aux-directory=build oddilovy_zpevnik1_text.tex
texindy -L czech -C utf8 -t build/oddilovy_zpevnik1_text.xlg -M oddilovy_zpevnik1_text.xdy -o oddilovy_zpevnik1_text.ind build/oddilovy_zpevnik1_text.idx
pdflatex -aux-directory=build oddilovy_zpevnik1_text.tex
```

These commands can be executed only if you have the necessary tools in the
system `PATH` variable. Otherwise you have to provide full paths to the used
tools.


## New songbook creation

It is possible to create new songbook based on this songbook.

Don't forget to mention that your songbook is inspired by this songbook
(e. g. derived from the Šavlozubý zpěvník, 1. díl, by 2<sup>nd</sup> Cub Pack
Grasshopers, Litoměřice town, Czech republic).

The songbook uses UTF8 encoding, therefore it is necessary to use editor which
can handle UTF8. The encoding used can be changed in the `header.tex` file. The
songbook uses typographic system LaTeX2e, here are some highlights about LaTeX:
- `\` is used at the beginning of macro. Macro is structure which influences
  the output. Some macros require parameters. Voluntary parameters are passed
  in square brackets `[]`, mandatory parameters in curly brackets `{}`. Macros
  have to be divided from the normal text by curly brackets or by spaces. If
  you want to have space after the macro, you have to divide it from macro by
  curly brackets or force the space by using backslash `\`, e. g.
  `\mymacro\ Text`.
- `%` precedes comments, LaTeX does not take care of all things after the
  per cent character to the end of line (the end of the line is also ingored
  by LaTex, therefore `%` is often used at the end of line in macros).
- More consecutive white characters are squished to only one. It means that
  more consecutive spaces are treated as only one.
- The single newline is treated also as single space character in normal LaTeX,
  paragraphs are ended by two and more newlines (paragpraphs are divided by at
  least 1 empty line). Contrary, there are no paragraphs in the `songs`
  environment, new line is created even by only one or more newlines.
- Non-breaking space is represented by `~` character which can be for example
  used before `…`.
- LaTeX doesn't allow some characters in text, for example `#`, `$`, `%`, `^`,
  `&` `_` `{` `}` `~` `\`, `` ` ``, you have to use `\#`, `\$`, `\%`, `\^{}`,
  `\&`,  `\_`, `\{`, `\}`, `\~{}`, `\textbackslash{}`, `'` instead. The `#`
  and `&` characters can be used in chords.
  

## Root file of the songbook

All necessary files with settings, formatting and songs are included to the
main file `oddilovy_zpevnik1.tex` or `oddilovy_zpevnik1_text.tex` for the
songbook withou chords. You can, for example, edit these things inside the
file:
- `\songspar` macro, which can be used with these values:
  - `chorded` – for the songbook with chords
  - `lyric` – for the songbook without chords
  - `slides` – uses only 1 song per page, it is suitable for example for the
    data projectors. Some modifications would be required for this possibility,
    for example to modify page geometry which is possible at the beginning
    of the `header.tex` file in the options of `geometry` package (be careful
    because title page and the last page modify the page geometry too).
- `\version` macro – version as typeset at the title page
- `\songbooktitle` macro – songbook name as typeset at the title page
- `\volumetext` macro – volume of the songbook as typeset at the title page
- `\onlylyrictext` macro – the text which is displayed at the title page in
  the mode when chords are not used
- `\songbookpdftitle` macro – title of pdf file (it is displayed instead of
  file name)
- `\songbookauthor` macro – author of pdf file (it is displayed in the pdf
  file information)
- the song order. All songs are included from separate files using `\input`
  macro. The songs could be written dirctly to the main file too but their
  management is much easier if they are placed in separate files. The songs are
  inserted in the songbook in the same order as they are included to the main
  file. The beginnings of songs which spans more than one page are
  automatically placed at the even pages so it is not necessary to turn page
  while playing them. It sometimes creates blank pages which can be removed
  by reordering the songs.
  
  
### File with settings and macros

Settings, necessary packages and definitions of macros are placed in the
`header.tex` file. There, you can modify for example page geomtry by editig
`geometry` mackage parameters, width of a column which contains verse numbers
(`\versenumwidth`), space which is inserted between songs (`\versesep`),
distance between chords and text `clineparams` or space after song headers
`\afterpreludeskip`.


### Title page

Larger modifications of the title page are possible in `titlepage.tex` file. 
Some modifications, for example changes of texts at the title page, are 
possible by modification of macros in the main file. The picture from the 
title page can be changed if you replace the `logo.png` file by your own 
image. More complicated changes are possible by editing the file directly. For 
example, it is possible to change the heading fonts or sizes. The year on the 
title page is determined automatically using the `\the\year` macros which can 
be replaced by normal text.


### Last page

The last page can be modified in the `copyrightpage.tex` file. Here, you can
modify contact, license or displayed image which is inserted by macro
`\includegraphics`. If you don't want to break line between some words, you can
insert them into a non-breakable `\mbox`. Web pages and e-mails are typeset in
monospace font using macro `\tt`.


### Song creation

For more information about `songs` package consult its documentation
[(here)][songs-doc]. You can find only some things about this songbook below,
some of them modifies the native songbook behavior:
- Each song have to be inside `songs` environment (it is created in the root
  file).
- A song begins with macro `beginsong` which takes two parameters, one
  mandatory with the song name and one voluntary, which can take parameter
  `by` for author, for example `\beginsong{My song}[by={Me}]`.
- A song ends by `\endsong` macro.
- All texts in a song have to be placed inside some container for text:
  - `verse` which can be used for numbered verses, begins by macro
    `\beginverse` and ends by macro `\endverse`. Numbering is automatic from
    1 and each `verse` usage increases the number by 1. If you want to modify
    the verse number you can use `\setcounter{versenum}{number}` macro before
    `\beginverse` macro, for example: `\setcounter{versenum}{158}` for the
    verse number 158.
  - `verse*` which can be used for parts without identifier. It actually isn't
    new environment because although it begins with `\beginverse*` macro it has
    to be ended with `\endverse` macro without star. It can be used for example
    if a verse should be divided to more parts which would be separated by
    vertical space.
  - `refrain` which can be used for refrains. It uses `R:` as identifier
    instead of a number as for verses. It begins with `\beginrefrain` macro and
    ends with `\endrefrain` macro.
  - `specialverse` which can be used in other cases when a custom identifier
    is needed. It begins with `\beginspecialverse` macro which takes one
    mandatory parameter with the required identifier, for example
    `\beginspecialverse{My most favorit verse:}`. It ends with
    `\endspecialverse` macro.
  - `emptyrefrain` and `emptyspecialverse` which are used when you want to
    repete `refrain` or `specialverse`. It prints only an identifier at the
    line beginning tightly adjacent to the preceding verse without any vertical
    space, for example:
     ```tex
     \beginverse
     \chordsoff
     Lalala.
     \endverse
     \emptyrefrain
     \emptyspecialrefrain{Bridge:}
     ```
- At the beginning of each from the above containers you should declare if
  chords are used or not using `\chordson` macro or `\chordsoff` macro
  respectively. The use of chords can be also switched further inside the
  container using the same macros. If neither of these macros are used the
  `lyric` mode uses `\chordsoff` by default and the `chorded` and `slides`
  modes use `\chordson` by default.
- Spacing between containers can be set also in each song individually using
  `\versesep` (globally it is set in the `header.tex`). If you set `\versesep`
  inside a song, its duration ends at the and of the song. The value of
  `\versesep` at the end of the song affects the distance between the header of
  the song and the body of the song. Therefore, it is possible to save the
  `\versesep` value to `\tempversesep` for example at the beginning of the song
  and restore its value before the end of the song in order to have the same
  distance between the header and the body of the song as in other songs, for
  example:
  ```tex
  \tempversesep=\versesep
  
  \beginsong{My song}[by={Me}]
  \versesep=2pt
  
  \beginverse
  \chordson
  \[Amaj]Lalala.
  \chordsoff
  Lalala.
  \endverse
  
  \beginverse
  \chordsoff
  Lalala.
  \endverse
  \versesep=50pt
  
  \beginspecialverse{My most favorite verse:}
  \chordsoff
  Lalala.
  \endspecialverse
  
  \versesep=\tempversesep
  \endsong
  ```
- Chords are inserted by the `\[Chord]`, if there should be space after the
  chord also in the `lyric` mode, it is necessary to prefix the space with `\`,
  for example:  `La,\[Ami]\ la.`. Acidentals in the chords can be denoted by
  `&` for flat and `#` for sharp, for example: `\[F#mi]\[G&mi]`.
- If the `\MultiwordChords` is used (which is actually used in the root file
  of the songbook), chords automatically moves above consecutive text until
  it does not reach the next chord. In the case when the chords are wider then
  the text the dash is automatically placed in the text.
- If you want to have more chords above one syllable, it is necessary to
  enclose the chord with the syllable in curly brackets, for example
  `{\[Ami][C]La}la.`.
- Chords are tightly adjacent to a text which sometimes causes that chord above
  upper case character with diacritic is higher than the chord above lower case
  character. If you don't like this behavior you can imitate higher characters
  by using macro `\vphanotm` which doesn't print the character and only
  imitates its height. This macro has to be connected with the following text
  by curly brackets, for example:
  ```tex
  \[A]Á \[D]{\vphantom{Á}ááá~…} Lalala.  
  ```
- If you want to use part of the song only in the chorded mode, you can use
  `\ifchorded` macro. Each if condition has to end by `\fi` and you can
  optionally use `\else` for the cases when the if condition isn't true, for
  example `\ifchorded{}Chorded text\else{}Non-chorded text\fi`. Be careful,
  `\ifchorded` must not by tightly adjacent to the preceeding text if this
  text uses chords there has to be space before the macro. This also holds
  for some other macros and controle sequences.
- If we want chords to be on the same line as a text as for example in
  interludes, you can use macro `\nolyrics` which influences the whole block.
  Therefore, it is better to enclose the macro with the part which should be
  influenced by it in the curly brackets. This macro doesn't reduce the height
  of a line in chorded mode, therefore it is necessary to reduce it manually
  with macro `\vspace`, for example:
  ```tex
  \ifchorded\vspace{-6mm}\fi
  \beginrefrain
  \chordson
  {\nolyrics\[H]\[H]\[C]\[H]}
  \[C]Lala\[D]la\[C]la.
  \chordsoff
  Lalalala.
  \endrefrain
  ```
- For repetitions, you can use macros `\lrep` and `\rrep` for the beginning and
  end of the repetition respectively. You mustn't forget that if you want to
  have space after macro, you have to force it by `\`, for example:
  ```tex
  \lrep\ Repeating text. \rrep
  ```
- For the multiple repetition you can use macro `\rep` which requires one
  mandatory parameter with a number of repetitions, for example:
  ```tex
  \lrep\ Repeat this million times to insanity. \rrep\ \rep{1000000}
  ```
  You can use it also for a refrain:
  ```tex
  \beginrefrain
  \chordsoff
  \rep{3}
  \endrefrain
  ```     
  

## Windows installation of compilation tools


### LaTeX installation

You can use [MiKTeX][miktex] distribution for Windows, which also contains the 
Xindy tool from the 5653 version. If you have enough space, the best option is 
to install full version because you needn't care about package installation. 
It is also convenient to install SumatraPDF as an alternative pdf viewer 
because it doesn't block opened files and automatically refreshes the view if 
the opened pdf file changes, whereas Adobe Reader blocks the file and the 
compilation can't finish until you close it. System restart could be needed 
after the MiKTeX installation finishes.


### Songs package installation

- Download the package for Windows from the repository [(here)][songs-get].
- Run the installator, agree with license.
- Deactivate `Software Integration` and `Create File Associations`.  
- Choose any MiKTeX Root Folder, it is not important for the installation and
  choose to `Ignore` the compilator complaint about its absence.
- Choose the directory for `Songs` package installation. It also isn't much
  important, it is safe to uninstall the package later but you have to remember
  where you have installed it for the subsequent use in the installation.
  It is installed to the `Songbook` directory on the Desktop by default.
- Create `localtexmf` folder if you don't have any yet, for example
  `c:\Users\my_user\localtexmf`.
- Create subdirectory `tex\latex\songs` in the `localtexmf` directory and copy
  the `songs.sty` inside it from the directory where you installed `Songs`
  package from the `src\package\songs\` subdirectory.
- You can uninstall the `Songs` package now. The `songs.sty` file was the only
  thing we needed and it is safely copied in the `localtexmf` directory.
- Open `MiKTeX Settings (Admin)` (for example from the Start menu) and choose
  `Add...` button on the `Roots` tab. Find the above mentioned `localtexmf`
  directory and confirm the selection by `OK`, then confirm the changes
  pressing `OK` (if accidently the changes were not applied, open the `MiKTeX
  Settings (Admin)` and push `Refresh FNDB` on the `General` tab). 


### Perl installation

- Download `ActivePerl` package for your operatig system [(here)][perl-get].
- Execute the package and install a typical installation by agreeing with all
  default settings (be sure to preserve `Add Perl to the PATH environment
  variable` option enabled)


### After installation

- Restart your computer.


## Feedback

Don't hesitate to contact us at our pack email if you encounter any problem
[2.smecka.kobylky@gmail.com][packmail].

Don't hesitate to report mistakes which you found or improvement suggestions 
to [Issues][issues]. You have to be registered on GitHub for the issue 
insertion. The registration is free of charge.


[packmail]: mailto:2.smecka.kobylky@gmail.com
[packweb]: http://kobylky.radobyl.eu
[releases]: https://github.com/kobylky/oddilovy_zpevnik1/releases
[latex]: https://www.latex-project.org
[songs]: http://songs.sourceforge.net
[songs-doc]: http://songs.sourceforge.net/songsdoc/songs.html
[songs-get]: http://prdownloads.sourceforge.net/songs/songs-2.18-setup.exe?download
[xindy]: https://www.ctan.org/pkg/xindy
[perl]: https://www.perl.org
[perl-get]: https://www.activestate.com/activeperl/downloads
[miktex]: https://miktex.org
[issues]: https://github.com/kobylky/oddilovy_zpevnik1/issues