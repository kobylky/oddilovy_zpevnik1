[_English_](README.en-US.md)


# Oddílový zpěvník 2. smečky vlčat Kobylky – 1. díl

Zpěvníky, které jsme vytvořili v našem skautském oddíle vlčat se dělí na dva
základní typy – Oddílové zpěvníky, kde jsou jednodušší písničky a Šavlozubé
zpěvníky, kde se vyskytují pokročilejší písně, které občas mohou cenit zuby.

Tento oddílový zpěvník využívá typografického systému [LaTeX][latex] a balíčku
na tvorbu písní [Songs][songs].

Pro více informací o čínnosti našeho skautského oddílu 2. smečka vlčat Kobylky
Litoměřice nás můžete kontaktovat například na oddílovém e-mailu
[2.smecka.kobylky@gmail.com][packmail] nebo na našem
webu [https://kobylky.radobyl.eu][packweb].


## Soubory ke stažení

Nejnovější uvolněnou verzi zpěvníku a popřípadě zdrojové soubory zabalené v
jednom archivu naleznete v sekci [Releases][releases]. Od verze 2 zpěvník
existuje ve dvou variantách, ve variantě s akordy `oddilovy_zpevnik1.pdf` a
bez akordů `oddilovy_zpevnik1_text.pdf`. Změny mezi jednotlivými verzemi
zpěvníku jsou zaznamenány v souboru [CHANGELOG][changelog].


## Nástroje potřebné ke kompilaci

- Funkční distribuce [LaTeXu][latex].
- Nainstalovaný balík [Songs][songs].
- Program [Xindy][xindy], lépe řečeno spíše jeho modifikaci adaptovanou na 
  LaTeX TeXindy, který umožňuje indexování písní a tvorbu obsahu písní
  s možností rovnání písní podle české abecedy. Program Xindy je již často
  součástí LaTeXových distribucí.
- Programovací jazyk [Perl][perl], který je potřeba pro to, aby fungoval Xindy.


## Kompilace

Ve windows můžete spustit soubor `build.bat`, který provede kompilaci
automaticky.

Pozor, někdy mohou být problémem pro kompilaci názvy adresářů obsahující
mezery nebo názvy obsahující diakritiku. Tento problé se dá vyřešit tím, že
zpěvník před kompilací zkopírujete do adresáře, který není podadresářem žádného
adresáře, který má v názvu mezery nebo diakritkiku.

Pro provedení kompilace ručně proveďte tyto příkazy z kořenového adresáře
zpěvníku (pdflatex a texindy jsou volány opakovaně, protože první volání
pdflatex uloží index, texindy následně z indexu vytvoří obsah, druhé volání
pdflatex vloží obsah do dokumentu a vygeneruje nový index, protože vložením
obsahu se změní čísla stránek, druhé volání texindy vytvoří obsah s novými
čísly stránek a poslední volání pdflatex tento obsah vloží do dokumentu):
```
pdflatex -aux-directory=build oddilovy_zpevnik1.tex
texindy -L czech -C utf8 -t build/oddilovy_zpevnik1.xlg -M oddilovy_zpevnik1.xdy -o oddilovy_zpevnik1.ind build/oddilovy_zpevnik1.idx
pdflatex -aux-directory=build oddilovy_zpevnik1.tex
texindy -L czech -C utf8 -t build/oddilovy_zpevnik1.xlg -M oddilovy_zpevnik1.xdy -o oddilovy_zpevnik1.ind build/oddilovy_zpevnik1.idx
pdflatex -aux-directory=build oddilovy_zpevnik1.tex
```
nebo pro kompilaci bez akordů:
```
pdflatex -aux-directory=build oddilovy_zpevnik1_text.tex
texindy -L czech -C utf8 -t build/oddilovy_zpevnik1_text.xlg -M oddilovy_zpevnik1_text.xdy -o oddilovy_zpevnik1_text.ind build/oddilovy_zpevnik1_text.idx
pdflatex -aux-directory=build oddilovy_zpevnik1_text.tex
texindy -L czech -C utf8 -t build/oddilovy_zpevnik1_text.xlg -M oddilovy_zpevnik1_text.xdy -o oddilovy_zpevnik1_text.ind build/oddilovy_zpevnik1_text.idx
pdflatex -aux-directory=build oddilovy_zpevnik1_text.tex
```

Pro vykonání těchto příkazů je třeba, aby všechny potřebné nástroje byly v
systémové proměnné `PATH`. V opačném případě musíte u všech použitých nástrojů
uvádět jejich plné cesty.

Ve Windows je tyto příkazy možné pustit z příkazového řádku, který spustíte
například pomocí klávesové zkratky `Win` + `R` (nebo navigací přes nabídku
Start na položku `Spustit`), kdy do dialogového okna vepíšete `cmd` a stisknete
`enter`. Poté se pomocí příkazu `cd` přesunete do adresáře, který obsahuje
zpěvník (např. `cd c:\users\muj_ucet\Documents\oddilovy_zpevnik1`) a provedete
výše zmíněné příkazy (pokud chcete změnit i diskovou jednotku, musíte použít
přepínač `/d`, např `cd /d d:\oddilovy_zpevnik1`)


## Tvorba vlastního zpěvníku

Dle tohoto zpěvníku lze vytvořit i vlastní zpěvník.

Nezapomeňte však zmínit, že jste se inspirovali tímto zpěvníkem (např.
odvozeno od Oddílového zpěvníku, 1. díl, 2. smečka vlčat Kobylky, Litoměřice).

Zpěvník používá kódování UTF8, takže je třeba soubory editovat editorem, který
umožňuje používat UTF8. Použité kódování lze změnit v souboru `header.tex`.
Zpěvník používá typografického systému LaTeX2e, ve kterém např.:
- `\` se používá pro uvození makra, která umožňují ovlivňovat dokument. Některá
  makra vyžadují parametry. Pokud jsou tyto parametry dobrovolné, tak jsou
  uvedeny v hranatých závorkách `[]`, povinné parametry se předávají ve
  složených závorkách `{}`. Pozor, makra je třeba od normálního textu oddělit.
  To je možné buď pomocí složených závorek nebo mezerou, ale mezeru makro
  smaže, takže pokud chceme mezeru za makrem mít, tak ho musíme ukončit pomocí
  složených závorek nebo ji vynutit pomocí znaku zpětného lomítka `\`, např.:
  `\mojemakro\ Text`.
- `%` uvozuje komentáře, vše za znakem procenta až do konce řádku LaTeX nebere
  v potaz (ani konec řádku, proto se často v definici maker používá na konci
  každého řádku, aby se předešlo nevyžádaným koncům řádků).
- Po sobě jdoucí bílé znaky jsou brány pouze jako jeden bílý znak, to znamená,
  že několik mezer za sebou je bráno jako jedna mezera.
- Normálně je v LaTeXu konec řádku brán taky pouze jako kdybyste použili
  mezerník, odstavec je ukončen pouze pokud následuje jeden a více prázdných
  řádků (odstavce jsou odděleny alespoň jedním prázdným řádkem). V prostředí
  `songs` odstavce nejsou brány v potaz a řádek je ukončen jedním a více
  novými řádky.
- Nezalomitelnou mezeru reprezentuje znak `~`, který lze například použít před
  `…`, aby se před výpostkou nemohl zalomit řádek.
- LaTeX neumožňuje v textu použít některé znaky, jako např. `#`, `$`, `%`, `^`,
  `&` `_` `{` `}` `~` `\`, `` ` ``, musíte místo toho použít `\#`, `\$`, `\%`,
  `\^{}`, `\&`,  `\_`, `\{`, `\}`, `\~{}`, `\textbackslash{}`, `'`. Znaky `#` a
  `&` ale mohou být použity v akordech.


### Kmenový soubor zpěvníku

Všechny potřebné soubory s nastaveními, formátováním a písněmi jsou vloženy do
hlavního souboru `oddilovy_zpevnik1.tex` nebo `oddilovy_zpevnik1_text.tex`
pro zpěvník bez akordů. V těchto souborech můžete například upravit:
- `\songspar` makro, které může obsahovat hodnoty:
  - `chorded` – pro zpěvník s akordy
  - `lyric` – pro zpěvník bez akordů
  - `slides` – obsahuje vždy nanejvýše 1 píseň na stránku, hodí se například
    pro promítání na projektoru, pro tuto možnost by byly ale vhodné i zásahy
    do geometrie stránky, které jsou možné hned na vrchu souboru `header.tex`
    v nastevní balíčku `geometry` (pozor, titulní strana a poslední strana
    geometrii stránky také modifikují, tak je třeba reflektovat novou geometrii
    i v nich).
- `\version` makro – verze zpěvníku vysázená na titulní stráce
- `\songbooktitle` makro – název zpěvníku vysázený na titulní stráce
- `\volumetext` makro – díl zpěvníku vysázený na titulní stráce
- `\onlylyrictext` makro – text, který se zobrazí v módu, kdy se netisknou
  akordy na titulní stráce
- `\songbookpdftitle` makro – název pdf souboru (zobrazí se místo jména
  souboru).
- `\songbookauthor` makro – autor pdf souboru (zobrazí se v informacích o pdf
  souboru)
- pořadí písní. Jednotlivé písně jsou vkládány ze samostatných souborů pomocí
  makra `\input`. Písně můžete samozřejmě vepisovat i přímo do hlavního
  souboru, ale jejich umístění do samostatných soborů zjednodušuje jejich
  správu. Písně jsou do zpěvníku sázeny ve stejném pořadí, v jakém jsou vloženy
  do hlavního souboru. Začátek písní, které přesáhnou jednu stránku, je vždy
  automaticky umístěn na sudou stránku, aby nebylo nutné při jejím hraní 
  obracet list. Někdy tak můžou vzniknout prázdné stránky, které můžeme
  odstranit přeuspořádáním písní.
 

### Soubor s nastaveními a makry

Nastavení, potřebné balíčky a definice maker jsou umístěny v souboru
`header.tex`. Zde je možné například upravit geometrii stránky úpravou
parametrů balíčku `geometry`, šířku sloupce, ve kterém jsou uváděna čísla slok
(`\versenumwidth`), místo, které je vynechané mezi jednotlivými písněmi
(`\versesep`), vzdálenost mezi akordy a textem `\clineparams` nebo mezery
za záhlavím písně `\afterpreludeskip`.


### Titulní stránka

Výraznější úpravy titulní stránky jsou možné v souboru `titlepage.tex`. Některé
úpravy, jako třeba změnu textů na titulní stránce, je možné provést úpravou
maker v hlavním souboru. Obrázek lze změnít nahrazením souboru `logo.png`
vlastním obrázkem. Pokud chcete provést složitější úpravy, můžete zeditovat
soubor přímo. Můžete například změnit použitý font pro nadpisy nebo jejich
velikost. Rok se na titulní stránce vypisuje automaticky pomocí maker
`\the\year`, které můžete nahradit třeba vlastním údajem.


### Závěrečná stránka

Závěrečnou stranu lze upravit v souboru `copyrightpage.tex`. Zde může upravit
kontakt, popřípadě licenci nebo vkládaný obrázek, který je vložen pomocí makra
`\includegraphics`. Pro to, aby se text automaticky nezalomil mezi slovy, mezi
kterými se to nehodí, je použit nezalomitelný box `\mbox`. Pro webové adresy
a e-malily je použit strojový řez fontu pomocí makra `\tt`. 


### Tvorba písní

Více informací, jak používat balíček `songs` se dočtete v jeho dokumentaci
[(zde)][songs-doc]. Zde jsou uvedena pouze některá specifika tohoto zpěvníku a
několik dalších základních věcí:
- Každá píseň musí být vložena v `songs` prostředí (to je vytvořeno v kořenovém
  souboru).
- Píseň začíná makrem `\beginsong`, které si bere dva parametry, jeden
  povinný s názvem písně a jeden dobrovolný, do kterého můžeme do parametru
  `by` uvést autora, např `\beginsong{Moje píseň}[by={Já}]`.
- Píseň musí být ukončena makrem `\endsong`.
- Všechny texty v písni musí být uvedeny v jednom z kontejnerů pro text:
  - `verse`, který je určen pro číslované sloky, začíná makrem `\beginverse` a
    musí být ukončen makrem `\endverse`. Číslování je automatické od 1 a každé
    další použití `verse` použije o 1 vyšší číslo. Pokud chcete číslo sloky
    změnit, můžete použít před `\beginverse` makro
    `\setcounter{versenum}{číslo}`, např.: `\setcounter{versenum}{158}` pro
    nastavení čísla sloky na 158.
  - `verse*`, který je určen pro části bez identifikátoru, nejedná se vlastně o
    nové prostředí, uvozuje se sice `\beginverse*`, ale končí se makrem
    `\endverse` bez hvězdičky. Lze ho použít například pro různé části sloky,
    které pak budou odděleny mezerou.
  - `refrain`, který je určen pro refrén, vytiskne jako identifikátor `R:`
    místo čísla sloky, začíná makrem `\beginrefrain` a končí makrem
    `\endrefrain`.
  - `specialverse`, který je určen pro ostatní případy, kdy je třeba pro daný
    text uvést jiný identifikátor. Uvozuje se makrem `\beginspecialverse`,
    které má jeden povinný parametr, do kterého se uvádí požadovaný
    identifikátor, např.: `\begispecialverse{Moje nejoblíbenější sloka:}`.
    Ukončuje se makrem `\endspecialverse`.
  - `emptyrefrain` a `emptyspecialverse`, které jsou použity pro opakování
    `refrain` nebo `specialverse` tak, že se vytiskne pouze identifikátor na
    začátku řádku a to těsně za předchozí sloku bez vertikální mezery, např.:
    ```tex
    \beginverse
    \chordsoff
    Lalala.
    \endverse
    \emptyrefrain
    \emptyspecialrefrain{Bridge:}
    ```
- V každém z výše zmíněných bloků na začátku by mělo být uvedeno, zdali se v
  něm mají používat akordy pomocí makra `\chordson` nebo nemají, pomocí makra
  `\chordsoff`. Použití akordů lze pak přepínat i uvnitř kontejneru pomocí
  stejných maker. Pokud žádné z těchto dvou maker nepoužijeme, tak se použije
  automaticky `\chordson` v módu `chorded` nebo `slides` a `\chordsoff` v módu
  `\lyric`.
- Mezery mezi jednotlivými kontejnery mohou být nastaveny i v každé písničce
  individuálně, ne pouze v souboru `header.tex` pomocí `\versesep`. Pokud se 
  `\versesep` nastaví uvnitř písně, tak jeho platnost skončí na konci písně.
  Velikost `\versesep` na konci písně také ovlivní vzdálenost mezi záhlavím
  písně a začátkem těla písně. Proto je možné `\versesep` uložit do
  `\tempversesep` třeba na začátku písně a před koncem písně ho navrátit, aby
  záhlaví písně bylo odsazeno stejně jako u předchozích písní.
  např.:
  ```tex
  \tempversesep=\versesep
  
  \beginsong{Moje píseň}[by={Já}]
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
  
  \beginspecialverse{Moje nejoblíbenější sloka:}
  \chordsoff
  Lalala.
  \endspecialverse
  
  \versesep=\tempversesep
  \endsong
  ```
- Akordy se do písní vkládají pomocí `\[Akord]`, pokud je za akordem mezera,
  tak aby tam zůstala i v případě, že je použit mód `lyric`, to znamená, že
  nejsou použity akordy, je třeba tuto mezeru uvodit `\`, např.:
  `La,\[Ami]\ la.`. Pro béčko se v akordech používá `&`, pro křížek `#`, např.:
  `\[F#mi]\[G&mi]`.
- Pokud je použito makro `\MultiwordChords`, které je v tomto zpěvníku použito
  v kořenovém souboru, tak se akordy posouvají nad text, dokud se nenarazí na
  další akord. V případě, že se akordy nad text nevejdou, automaticky se
  vytvoří v textu pomlčka a text se roztáhne.
- Pokud chceme více akordů použít nad jednou slabikou, aby se neposunuly nad
  další slabiky, je třeba je spolu s touto slabikou uzavřít do složených
  závorek, např.: `{\[Ami][C]La}la.`.
- Akordy jsou těsně přilehlé na text, takže se stává, že pokud jsou použita
  třeba velká písmena s háčkem nebo čárkou, tak mohou některé akordy být výše
  než jiné. Pokud se nám to v některém případě nelíbí, můžeme imitovat v textu
  nad kterým akord je, vyšší velikost pomocí makra `\vphantom`, které znak
  nevytiskne, ale pouze imituje jeho výšku. Toto makro je třeba spojit s
  následujícím textem pomocí složených závorek, např.:
  ```tex
  \[A]Á \[D]{\vphantom{Á}ááá~…} Lalala.  
  ```
- Pokud chceme část písně použít pouze v akordové verzi, můžeme použít
  `\ifchorded`. Každá if podmínka musí být ukončena `\fi` a můžeme volitelně
  použít `\else` pro případ, když if podmínka není pravda, např.:
  `\ifchorded{}Akordový text\else{}Neakordový text\fi`. Pozor, `\ifchorded`
  nesmí být těsně přilehlé na předchozí text, pokud tento text používá akordy,
  musí mezi ním a textem být alespoň jedna mezera. To často platí i pro další
  makra a jiné řídící struktury.
- Pokud chceme, aby akordy byly na stejném řádku jako text, jako třeba v
  mezihrách, můžeme použít makro `\nolyrics`, které funguje na celý blok, proto
  je dobré ho uzavřít spolu s požadovanou částí písně do složených závorek, aby
  se jeho působnost omezila jenom na oblast vymezenou těmito závorkami. Toto
  makro nesníží výšku řádku v akordované verzi, takže pokud ji chceme snížit,
  musíme to pro každý případ dělat ručně pomocí makra `\vspace`, např.:
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
- Pro repetice můžeme použít makro `\lrep` a `\rrep` pro začátek a konec
  repetice repsektive. Nesmíme zapomenout, že pokud chceme za makrem zachovat
  mezeru, musíme použít `\`, např.:
  ```tex
  \lrep\ Opakující se text. \rrep
  ```
- Pro vícenásobné opakování můžeme použít makro `\rep`, které požaduje jeden
  povinný parametr s počtem opakování, např.:
  ```tex
  \lrep\ Opakuj do zbláznění milionkrát. \rrep\ \rep{1000000}
  ```
  To můžeme použít i například pro samotný refrén:
  ```tex
  \beginrefrain
  \chordsoff
  \rep{3}
  \endrefrain
  ```


## Instalace nástrojů potřebných ke kompilaci ve Windows


### Instalace LaTeXu

Ve Windows můžete například nainstalovat distribuci LaTeXu [MiKTeX][miktex].
Návod na instalaci naleznete například [zde][miktex-install]. Je dobré použít
alespoň verzi 5653, která již obsahuje Xindy, takže dále instalace Xindy nebude
popisována. Na odkazované stránce, která popisuje instalaci MiKTeX naleznete
i popis pro instalaci SumatraPDF, což je pdf prohlížeč, který se hodí pro práci
s dokumenty generovanými pdfLaTeXem ve Windows, protože neblokuje pdf soubor
při jeho otevření a automaticky obnoví obsah, když se obnoví otevřený soubor,
kdežto Adobe Reader soubor zablokuje a dokud ho nezavřete, tak Vám kompilace
nebude fungovat. Po instalaci MiKTeXu může být nutné restartovat počítač.


### Instalace balíčku Songs

- Stáhněte si instalační balíček pro Windows z repozitáře [(zde)][songs-get].
- Instalační balíček spusťte, odsouhlaste licenci.
- Deaktivujte volby `Software Integration` a `Create File Associations`.
- MiKTeX Root Folder zvolte jakýkoli, není to pro instalaci důležité a když si
  instalátor stěžuje, že ho nemůže nalézt, tak zvolte možnost `Ignorovat`.
- Zvolte adresář, kam chcete `Songs` nainstalovat, také není příliš podstatný,
  později ho můžete zase odinstalovat, ale je třeba si zapamatovat, kam jste ho
  nainstalovali pro pozdější použití při instalici. V základním nastavení se
  nainstaluje do složky `Songbook` na ploše.
- Pokud ho ještě nemáte vytvořený, tak is vytvořte adresář `localtexmf`,
  například `c:\Users\my_user\localtexmf`.
- V adresáři `localtexmf` vytvořte podadresář `tex\latex\songs` a nakopírujte
  do něj soubor `songs.sty`, který je umístěn v adresáři, kam jste
  nainstalovali balíček `Songs` v podadresáři `src\package\songs\`.
- Nyní již můžete balíček `Songs` v klidu odinstalovat, jediné, co jsme z něj
  potřebovali byl soubor `songs.sty`, který už máme bezpečně nakopírovaný v
  `localtexmf`.
- Otevřete `MiKTeX Settings (Admin)` (například přes nabídku Start) a na
  záložce `Roots` zvolte dole `Add...` a nalezněte výše zmíněný `localtexmf`
  adresář, potvrďte výběr `OK` a proveďte změny stisknutím `OK` (pokud by se
  náhodou změny neprovedly automaticky, otevřete `MiKTeX Settings (Admin)` a na
  záložce `General` stiskněte `Refresh FNDB`).


### Instalace Perl

- Stáhněte instalační balíček `ActivePerl` odpovídající vašemu operačnímu
  systému [(zde)][perl-get]. 
- Nainstalujte typickou instalaci spuštěním instalačního balíčku a
  odsouhlasením všech základních nastavení (určitě zachovejte volbu `Add Perl
  to the PATH environment variable`).


### Po instalaci

- Restartujte počítač.   


## Zpětná vazba

V případě, že narazíte na nějaký problém, neváhejte nás kontaktovat na našem
oddílovém e-mailu [2.smecka.kobylky@gmail.com][packmail].

Pokud naleznete ve zpěvníku nějaké chyby nebo budete mít návrhy na vylepšení, 
neváhejte nám je sdělit do [Issues][issues] (stisknutím tlačítka `New issue` a 
vyplněním názvu a popisu problému nebo vylepšení). Pro vkládání příspěvků 
musíte být registrovaní uživatelé na GitHubu. Registrace je zdarma.


[packmail]: mailto:2.smecka.kobylky@gmail.com
[packweb]: https://kobylky.radobyl.eu
[releases]: https://github.com/kobylky/oddilovy_zpevnik1/releases
[changelog]: CHANGELOG.md
[latex]: https://www.latex-project.org
[songs]: http://songs.sourceforge.net
[songs-doc]: http://songs.sourceforge.net/songsdoc/songs.html
[songs-get]: http://prdownloads.sourceforge.net/songs/songs-2.18-setup.exe?download
[xindy]: https://www.ctan.org/pkg/xindy
[perl]: https://www.perl.org
[perl-get]: https://www.activestate.com/activeperl/downloads
[miktex]: https://miktex.org
[miktex-install]: http://latex.feec.vutbr.cz/instalace-miktex-a-spol-pc-windows/instalace-miktex
[issues]: https://github.com/kobylky/oddilovy_zpevnik1/issues