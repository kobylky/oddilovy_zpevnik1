@REM Compiles the songbook.

@REM oddilovy_zpevnik1
pdflatex -aux-directory=build oddilovy_zpevnik1.tex
texindy -L czech -C utf8 -t build/oddilovy_zpevnik1.xlg -M oddilovy_zpevnik1.xdy -o oddilovy_zpevnik1.ind build/oddilovy_zpevnik1.idx
pdflatex -aux-directory=build oddilovy_zpevnik1.tex
texindy -L czech -C utf8 -t build/oddilovy_zpevnik1.xlg -M oddilovy_zpevnik1.xdy -o oddilovy_zpevnik1.ind build/oddilovy_zpevnik1.idx
pdflatex -aux-directory=build oddilovy_zpevnik1.tex

@REM oddilovy_zpevnik1_text
pdflatex -aux-directory=build oddilovy_zpevnik1_text.tex
texindy -L czech -C utf8 -t build/oddilovy_zpevnik1_text.xlg -M oddilovy_zpevnik1_text.xdy -o oddilovy_zpevnik1_text.ind build/oddilovy_zpevnik1_text.idx
pdflatex -aux-directory=build oddilovy_zpevnik1_text.tex
texindy -L czech -C utf8 -t build/oddilovy_zpevnik1_text.xlg -M oddilovy_zpevnik1_text.xdy -o oddilovy_zpevnik1_text.ind build/oddilovy_zpevnik1_text.idx
pdflatex -aux-directory=build oddilovy_zpevnik1_text.tex
