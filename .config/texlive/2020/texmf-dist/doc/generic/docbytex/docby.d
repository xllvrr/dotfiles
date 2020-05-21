
%% DocBy.\TeX{} -- nástroj na dokumentování zdrojových kódù

\def\projectversion{\dbtversion}
\def\headtitle{DocBy.\TeX}

\showboxbreadth=1500 \showboxdepth=2

\chyph
\input docby.tex

\title DocBy.\TeX{} -- nástroj na dokumentování zdrojových kódù

\author Petr Ol¹ák

\centerline{\ulink[http://www.olsak.net/docbytex.html]%
                         {www.olsak.net/docbytex.html}}

\def\db{\dg\nb}
\def\du#1{\api{\nb#1}}
\let\quotehook=\langleactive
\def\insdef#1 {\ifirst{docby.tex}{def\nb#1 }{^^B\cbrace}{++}}
\def\inssdef#1 {\ifirst{docby.tex}{def\nb#1}{\empty}{+-}}
\bgroup
   \catcode`\[=1 \catcode`]=2 \catcode`\{=12 \catcode`\}=12
   \gdef\obrace[{] \gdef\cbrace[}]
\egroup
\def\indexhook{Kontrolní sekvence oznaèené ¹ipkou ($\succ$) jsou
   u¾ivatelskými pøíkazy. Ostatní kontrolní sekvence jsou 
   v~DocBy.\TeX{}u interní. Tuènì je oznaèena strana, kde je slovo
   dokumentováno, pak následuje seznam stran s výskyty slova.
   U¾ivatelské pøíkazy mají v seznamu stránek podtr¾ené èíslo, 
   co¾ je stránka, kde je pøíkaz vylo¾en na u¾ivatelské úrovni. 
   \medskip}
\def\nn#1 {\noactive{\nb#1}} \nn insert \nn undefined

\def\cnvbookmark#1{\lowercase{\lowercase{#1}}}
\def\bookmarkshook{\lo ìe \lo ¹s \lo èc \lo ør \lo ¾z \lo ýy
   \lo áa \lo íi \lo ée \lo úu \lo ùu \lo óo \lo òn }
\def\lo #1#2{\lccode`#1=`#2}

\dotoc \bookmarks

\sec Úvod
%%%%%%%%%

DocBy.\TeX{} umo¾òuje jednodu¹e dokumentovat pomocí \TeX{}u 
zdrojové kódy programu napsaném v~jazyce~C pøípadnì v jakémkoli
jiném jazyce.

Na rozdíl od Knuthova literárního programování tento nástroj nepou¾ívá
¾ádné preprocesory nebo filtry pro oddìlení informace pro èlovìka a
pro poèítaè. Vycházím z toho, ¾e programátor je zvyklý psát tyto
informace oddìlenì a chce mít vìci pod vlastní kontrolou. Rovnì¾ mnozí
programátoøi uvítají, ¾e mohou psát dokumentaci dodateènì, a pøitom
skoro nezasahovat do u¾ napsaného (a mo¾ná odladìného) zdrojového
kódu.  Doba, kdy Knuth navrhoval literární programování, pokroèila a
tvùrce dokumentace dnes mù¾e mít zároveò ve více oknech otevøeno více
textù.  Nìkteré jsou urèeny pro èlovìka a jiné pro poèítaè. Nevnímám
tedy tak hlasitou potøebu tyto informace sluèovat do jednoho
souboru, jako tomu bylo kdysi.

V první èásti (sekce~\cite[uziv]) dokumentu seznamujeme ètenáøe
s pou¾itím \docbytex{}u na u¾ivatelské úrovni. V dal¹í sekci jsou
dokumentovaná výchozí makra \docbytex{}u, u nich¾ se pøedpokládá, ¾e
je bude chtít nároèný u¾ivatel mìnit, aby pøizpùsobil chování \docbytex{}u
obrazu svému. Dále následuje sekce~\cite[design] s dokumentací
maker, která rovnì¾ budou mìnìna, pokud u¾ivatel bude chtít jiný
vzhled dokumentu. V~poslední sekci~\cite[implementace] 
je dokumentován kompletní \docbytex{} na implementaèní úrovni. 
Tak¾e se tam mù¾ete doèíst, jak makra fungují. 

Tento dokument je zpracován \docbytex{}em, tak¾e slou¾í mimo jiné jako
ukázka, co je mo¾né tímto nástrojem vytvoøit.

\sec [uziv] Pro u¾ivatele
%%%%%%%%%%%%%%%%%%%%%%%%%

\subsec [cleneni] Èlenìní souborù
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\docbytex{} je implicitnì navr¾en pro dokumentování zdrojových kódù 
v~jazyce~C. Proto i následující ukázka dokumentuje hypotetický program
napsaný v tomto jazyce. Chcete-li dokumentovat jiný jazyk, mù¾ete
implicitní chování \docbytex{}u pozmìnit. Tomu je vìnována 
sekce~\cite[zmeny].

Pøedpokládá se, ¾e zdrojové kódy programu jsou èlenìny na moduly. Ka¾dý modul
je my¹lenkovì samostatná zále¾itost. Alespoò pro programátora. Ka¾dý modul
má své jméno (napøíklad "cosi") a je napsán v souborech "cosi.h" a "cosi.c",
pøípadnì v dal¹ích. Tyto soubory se kompilují, aby vznikl "cosi.o" a 
v~závìru kompilace se linkují v¹echny kompilované moduly do výsledného
programu.

Chceme-li takové zdrojové kódy dokumentovat, pøipí¹eme ke ka¾dému
modulu soubor s pøíponou ".d", napøíklad "cosi.d", který obsahuje
dokumentaci k danému modulu.  Dále zalo¾íme tøeba soubor
"program.tex", ze kterého postupnì naèítáme dokumentace jednotlivých
modulù pomocí pøíkazu "\module"\du{module}. V \uv{hlavním souboru} "program.tex"
mù¾eme té¾ pou¾ít pøíkazy "\title" pro vyznaèení názvu programu,
"\author" se jménem autora programu a tøeba "\dotoc" pro vytvoøení
obsahu a "\doindex" pro vygenerování rejstøíku. Samozøejmì zde mù¾eme
napsat tøeba úvodní poznámky ke zdrojovým kódùm programu a pou¾ít plno
dal¹ích vymezovacích pøíkazù (viz dále). Obsah souboru "program.tex"
mù¾e vypadat tøeba takto:

\begtt
\input docby.tex
\title   Program lup -- dokumentace ke zdrojovým textùm

\author  Progr a Mátor

\dotoc  % tady bude obsah

\sec Èlenìní zdrojových textù

Zdrojové texty programu "lup" jsou rozdìleny do tøí modulù. 
V "base.c" jsou definovány pomocné funkce a v "base.h" jsou jejich
prototypy. Podobnì ve "win.c" jsou funkce pro okenní zále¾itosti a
"win.h" obsahuje jejich prototypy. Koneènì "main.c" obsahuje hlavní
funkci programu.
\module base
\module win
\module main
\doindex  % v tomto místì bude sestaven rejstøík
\bye
\endtt

V tomto pøíkladì jsme se rozhodli ètenáøe dokumentace seznamovat s
programem \uv{zdola nahoru}, tedy od elementárních funkcí a¾ k hotovému
programu. Nìkdo mo¾ná preferuje cestu \uv{shora dolù} a mù¾e mít v
dokumentaci napsáno:

\begtt
\module main
\module win
\module base
\doindex
\bye
\endtt

Oba pøístupy jsou mo¾né, proto¾e dokumentace je automaticky provázána
hyperlinky. Ètenáø se kdykoli mù¾e podívat na dokumentaci té funkce,
její¾ pou¾ití zrovna ète, a obrácenì mù¾e projít výskyty ve¹kerého
pou¾ití funkce, kdy¾ ète její dokumentaci.

\subsec [priklad] Pøíklad dokumentace modulu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Soubor s dokumentací jednotlivého modulu budu pro tento 
pøípad znaèit "cosi.d". Ten je naèten pøíkazem "\module"~"cosi ".
V souboru "cosi.d" je mo¾no se literárnì vyøádit a kdykoli vlo¾it èást 
existujícího zdrojového kódu programu se stejným jménem modulu.
To provedeme pøíkazem "\ins"~"c keyword "\du{ins}, který vlo¾í do dokumentace
èást zdrojového kódu ze souboru "cosi.c", která je vymezena pomocí slova 
"keyword". Místo písmene "c" je mo¾no pou¾ít "h" nebo jakoukoli jinou
pøíponu souboru, ze kterého chceme vlo¾it èást do dokumentace. K
vymezení èástí, které se mají vlo¾it, je nutno mít ve zdrojovém
souboru text "//: keyword". V¹e vysvìtlí následující pøíklad.

Pøedpokládejme, ¾e v souboru "cosi.d" máme napsánu tuto dokumentaci:

\begtt
Struktura \dg dvojice se pou¾ívá jako návratová hodnota funkce
"uzasna_funkce" a sdru¾uje dvì hodnoty typu "float".
\ins c dvojice

Funkce \dg [struct dvojice] uzasna_funkce() si vezme jeden parametr "p" 
a vrátí ve struktuøe "dvojice" dvojnásobek a trojnásobek tohoto parametru.
\ins c uzasna_funkce
\endtt

V tomto pøípadì je nutné, aby v souboru "cosi.c" existoval vymezující
text "//: "{\tt dvojice} a text "//: "{\tt uzasna\_funkce}. 
Tyto texty vymezují úseky,
které se mají do dokumentace vlo¾it. Soubor "cosi.c" mù¾e vypadat
tøeba takto:

\begtt
#include <stdio.h>

//: dvojice

struct dvojice {
  float x, y;
};

//: uzasna_funkce

struct dvojice uzasna_funkce (float p)
{
  struct dvojice navrat;
  navrat.x = 2*p; // tady nasobim p dvema
  navrat.y = 3*p; // tady nasobim p tremi
  return navrat;
} 
\endtt

Výsledek po zpracování èásti dokumentace z "cosi.d" pak vypadá takto:

\bigskip

Struktura \dg [struct] dvojice se pou¾ívá jako návratová hodnota funkce
"uzasna_funkce" a sdru¾uje dvì hodnoty typu "float".
\def\modulename{cosi}
\ins c dvojice

Funkce \dg [struct dvojice] uzasna_funkce() si vezme jeden parametr "p" a vrátí
ve struktuøe "dvojice" dvojnásobek a trojnásobek tohoto parametru.
\ins c uzasna_funkce

V ukázkovém zdrojovém kódu je první vlo¾ený úsek vymezen na
zaèátku textem "//: "{\tt dvojice} a na konci textem "//:". Druhý úsek je
vymezen textem "//: "{\tt uzasna\_funkce} a konèí na konci souboru.

Na poøadí úsekù, které zahrnujeme ze zdrojového textu do dokumentace,
nezále¾í. Klidnì jsme mohli dokumentaci zaèít od povídání o ú¾asné
funkci (vèetnì vlo¾ení jejího kódu) a potom je¹tì dopsat, co to je ta 
struktura "dvojice" a následnì vlo¾it deklaraci této struktury.

Kdybychom pøed øádek "#include "{\tt<stdio.h>} vlo¾ili tøeba text
"//: start", bylo by mo¾né pøíkazem "\ins"~"c start " vlo¾it 
do dokumentace zaèátek souboru "cosi.c", který v ukázce vlo¾en není.

V¹imnìme si, ¾e \TeX{} zapsal èísla øádkù pøesnì podle toho, jak
jsou ve zdrojovém kódu. Tj. poèítal i pøeskakovaný øádek 
"#include "{\tt<stdio.h>} i pøeskakované prázdné a vymezující øádky.

Vymezení "//: keyword" se mù¾e v øádku nacházet kdekoli, není nutné,
aby se vyskytovalo na zaèátku øádku. Øádek s~tímto vymezením není do
dokumentace zahrnut a pokud následuje za øádkem s~vymezením prázdný
øádek, ani ten není do dokumentace zahrnut. 

Stejnì tak koncové vymezení "//:" se mù¾e v øádku nacházet kdekoli a
celý øádek s tímto vymezením není do dokumentace zahrnut. 
Pokud pøed tímto koncovým øádkem je prázdný øádek, ani ten 
není do dokumentace zahrnut.

Koneènì za pov¹imnutí stojí pou¾ití pøíkazu "\dg" v dokumentaci. Za
ním následuje slovo (separované mezerou), které dokumentujeme. Toto
slovo se v dokumentaci výraznì oznaèí (v PDF verzi èervenou barvou
navíc v barevném rámeèku) a jakýkoli jiný výskyt takového slova ve
zdrojovém textu nebo mezi uvozovkami {\tt\char`\"...\char`\"} bude
automaticky oznaèen modrou barvou a bude klikací. Kliknutí na modrý
výskyt slova kdekoli v dokumentaci vrátí ètenáøe na èervený výskyt,
kde je slovo dokumentováno.

Dokumentované slovo mù¾e mít pøed sebou v hranatých závorkách text,
který napø. oznaèuje typ funkce a za sebou mù¾e mít kulaté závorky
"()".  Tím mù¾eme dát najevo, ¾e dokumentujeme funkci. V místì
dokumentace se neobjeví ani tento nepovinný text ani závorky, ale v
poznámce pod èarou a v~rejstøíku se tyto informace vytisknou.

\uv{Palcové uvozovky} {\tt\char`\"...\char`\"} vymezují kusy kódu
uvnitø odstavce. Text takto uvozený je psán strojopisem a pokud se 
v nìm vyskutují deklarovaná slova, tato slova automaticky modrají
a stávají se klikatelnými odkazy.
Text mezi tìmito uvozovkami je navíc pøepisován ve \uv{verbatim}
módu \TeX{}u, tj. ¾ádné znaky nemají speciální vlastnosti (s výjimkou
koncové palcové uvozovky). 

Na stránce, kde je slovo dokumentováno (pomocí "\dg"), je v poznánkách
pod èarou slovo znovu zmínìno a vedle této zmínky je seznam v¹ech
stránek, na kterých se kdekoli v textu vyskytuje pou¾ití tohoto slova.
Dále jsou v¹echna dokumentovaná slova zahrnuta do závìreèného
abecedního rejstøíku, který odkazuje jednak na stránku, kde je
slovo dokumentováno, i na stránky se v¹emi výskyty slova.


\subsec Jaký \TeX{} pro \docbytex{}?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Aby fungovaly v¹echny vý¹e uvedené vlastnosti, je potøeba pou¾ít
pdf\TeX{} roz¹íøený o enc\TeX{}. Dále je dle "\language" detekován 
jazyk, který se pou¾ije v automaticky generovaných slovech.
\docbytex{} se ohlásí na terminálu napøíklad tìmito slovy:

\def\begtthook{\catcode`\!=0}
\begtt
This is DocBy.TeX, version !dbtversion, modes: enc+PDF+ENG
\endtt

\def\begtthook{}

\docbytex{} rozli¹uje tøi módy, ka¾dý mù¾e nabývat dvou stavù:
mód "enc/NOenc", dále mód "PDF/DVI" a koneènì mód jazyka "ENG/CS".

Mód "enc"\api{enc} se zapne, je-li detekována pøítomnost enc\TeX{}u.
Pokud enc\TeX{} není dostupný, vypí¹e o~tom \docbytex{} varování a
pøejde do "NOenc"\api{NOenc} módu. V tomto módu nefunguje automatická detekce
slov, která jsou dokumentována, tak¾e tato slova nemodrají a nestávají
se klikacími odkazy. V rejstøíku pak také není seznam stránek se v¹emi
výskyty slova, ale jen místo, kde je slovo dokumentováno.
V~tomto pøípadì tedy je deaktivována nejdùle¾itìj¹í vlastnost
\docbytex{}u, tak¾e je ¾ádoucí vynalo¾it jisté úsilí a enc\TeX{}
zprovoznit. V souèasných distribucích \TeX{}u bývá enc\TeX{}
v pdf\TeX{}u zahrnut a je aktivován napøíklad ve formátu "pdfcsplain".

Mód "PDF"\api{PDF} je detekován, pokud je pou¾it pdf\TeX{}, jinak \docbytex{}
pøejde do módu "DVI"\api{DVI} a napí¹e o tom varování na terminál. V módu "DVI"
nefungují barvy ani klikací odkazy. Ov¹em seznam stránek s~pou¾itím
dokumentovaného slova se generuje, je-li pøítomen enc\TeX.

\docbytex{} detekuje mód jazyka "ENG" (angliètina), je-li 
"\language=0". To je implicitní chování.
Pokud napøíklad v "csplainu" nastavíte "\chyph" pøed
"\input docby.tex", \docbytex{}
to vyhodnotí jako dokument v èe¹tinì ("CS"). 
Jiné jazyky nejsou zatím podporovány.
V módu "ENG" jsou automaticky generované názvy 
\uv{Contents}, \uv{Index} anglické, 
v módu "CS" jsou tyto názvy \uv{Obsah}, \uv{Rejstøík} èeské.
V~sekci~\cite[nazvy] je øeèeno, jak jsou tato slova generována 
a co tedy udìlat, kdy¾ chcete mít dokument v jiném jazyce.

\subsec Vyhledávání slov enc\TeX{}em
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Slova, která se stávají klikatelnými odkazy vyhledává enc\TeX{}. Ten
má zabudován tzv. \uv{hladový algoritmus}. To znamená, ¾e jsou-li
dokumentována napø. slova "abc" a "abcde", pak text "abcdefgh" zmodrá
a¾ po písmeno "e" a odkazuje na "abcde", zatímco "abcdx" zmodrá a¾ po
písmeno "c" a odkazuje na "abc". To bývá obvykle ¾ádoucí. 
%
V enc\TeX{}u není mo¾no programovat vyhledávání podle regulárních
výrazù, tak¾e není mo¾né jednodu¹e øíci, aby enc\TeX{} hledal jen
slova, která jsou ohranièena mezerou, teèkou, závorkou, støedníkem,
atd. Místo toho enc\TeX{} tupì vyhledá slovo tøeba uvnitø jiného slova.

Mù¾e se tedy stát, ¾e máme dokumentováno krat¹í slovo, které se
objevuje jako èást jiných nedokumentovaných slov. Napøíklad je
dokumentována struktura "turn", ale ve výpisech programu nechceme, aby
v ka¾dém výskytu klíèového slova "return" zmodrala jeho èást. V
takovém pøípadì je potøeba explicitnì definovat "return" jako 
\uv{normální} nedokumentované slovo. K tomu slou¾í pøíkaz
"\noactive{<slovo>}"\du{noactive}, tedy napøíklad 
"\noactive{return}". Tento pøíkaz globálnì
deklaruje "<slovo>" jako vyhledávané slovo (pro enc\TeX), ale 
specifikuje jej jako neaktivní.

Mù¾e se také stát, ¾e máme dokumentováno slovo, které se objevuje ve
zdrojových textech i v jiném (nedokumentovaném) významu. Pøitom dokumentované
slovo poznáme podle toho, jak vypadá text pøed slovem a za slovem.
Pak lze pou¾ít deklaraci "\onlyactive{<pøed>}{<slovo>}{<za>}"\du{onlyactive}, 
která sama o sobì nedìlá nic. Pokud ale vyznaèíme "<slovo>" pomocí
"\dg" (nebo podobného makra na dokumentování slov, viz
sekce~\cite[ddsl]), pak bude "<slovo>" automaticky modrat jen tehdy,
pøedchází-li mu text "<pøed>" a následuje text "<za>". Texty "<pøed>"
nebo "<za>" mohou být prázdné (ne oba souèasnì) a k jednomu "<slovu>"
mù¾eme napsat více rùzných deklarací "\onlyactive".
 
\docbytex{} aktivuje enc\TeX{} (pomocí "\mubytein=1") jen uvnitø
skupiny, kdy¾ zpracovává text mezi palcovými uvozovkami
({\tt\char`\"...\char`\"}) nebo pøi naèítání zdrojového textu
programu. Pøedpokládá se, ¾e nepou¾íváte enc\TeX{} k~dekódování UTF-8
kódu. Pokud pou¾íváte, zkuste si zapnout "\mubytein=1" pro celý dokument,
ale na {\it vlastní riziko}. V takovém pøípadì vám budou modrat slova
nebo jejich èásti i v~bì¾ném textu a pokud je dokumentované slovo
podmno¾inou nìjaké \TeX{}ové sekvence, kterou pou¾íváte, pak se
doèkáte nepøíjemných chyb.

\subsec Generování rejstøíku, obsahu, poznámek pod èarou a zálo¾ek
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Generování rejstøíku i obsahu probíhá v \docbytex{}u zcela
automaticky. Pro vytvoøení rejstøíku není nutné pou¾ívat externí
program (\docbytex{} si slova abecednì zatøídí sám).
Staèí tedy vlo¾it na po¾adovaná místa pøíkazy "\dotoc"\du{dotoc} a
"\doindex"\du{doindex}. Upozoròuji, ¾e rejstøík ani obsah nejsou správnì
vygenerovány po prvním prùchodu \TeX{}u. Je potøeba \TeX{}ovat
dvakrát. Po druhém prùchodu dojde zøejmì k pøestránkování textu
(proto¾e je napøíklad vlo¾en obsah). Je tedy nutné \TeX{}ovat je¹tì
jednou. Tøi prùchody \TeX{}em jsou (snad) dostaèující.
Slovo \uv{snad} vychází z problému s poznámkami pod èarou podrobnì
popsaném v sekci~\cite[specfootnote].
Poznámky pod èarou se toti¾ prùbì¾nì v prùchodech mìní a ovlivòují
zpìtnì vertikální sazbu. \docbytex{} proto provádí na konci zpracování
v pøíkaze "\bye"\du{bye} kontrolu, zda nedo¹lo ke zmìnám v referencích.
Je proto u¾iteèné pou¾ívat "\bye" místo "\end".
V závìru zpracování pak \docbytex{} vypí¹e zprávu 
"OK, all references are consistent" nebo vypí¹e
varování, ¾e nìkteré reference jsou nekonzistentní a 
¾e je tedy potøeba \TeX{}ovat znovu.

Dal¹í test konzistence mù¾eme provést napøíklad následujícím skriptem:

\begtt
#!/bin/bash
cp dokument.ref dokument.r0
pdfcsplain dokument.d
diff dokument.r0 dokument.ref
\endtt

\docbytex{} se sna¾í (z dùvodu záruky konvergence dokumentu) fixovat 
zpracování poznámek pod èarou po druhém prùchodu. Pokud poté mìníte
rozsáhle dokument, tak¾e seznamy stránek vedle poznámek pod èarou jsou
výraznì jiné délky, \docbytex{} to nepozná a mù¾e docházet 
k pøeplnìní nebo nenaplnìní stránek. V takovém pøípadì je rozumné
vymazat soubor {\tt.ref} a znovu spustit tøi prùchody.

Pro vytvoøení zálo¾ek se strukturovaným obsahem v PDF výstupu slou¾í
pøíkaz "\bookmarks"\du{bookmarks}. Je zcela jedno, v které èásti
dokumentu je tento pøíkaz napsaný, nebo» sestaví stukturovaný seznam
zálo¾ek prolinkovaný s dokumentem na základì údajù ze souboru~{\tt.ref}.
Mù¾e se stát, ¾e nìkteré texty v zálo¾kách nejsou optimálnì èitelné. O
mo¾nostech, jak toto øe¹it, pojednává sekce~\cite[hooky].

\subsec [vkladani] Vkládání zdrojových textù podrobnìji
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Kromì jednoduchého pøíkazu "\ins" na vkládání zdrojových textù jsou 
k dispozici pøíkazy "\ifirst"\du{ifirst} a "\inext"\du{inext}, 
které nabízejí u¾ivateli
daleko více mo¾ností.

Pøíkaz "\ifirst{<soubor>}{<odkud>}{<kam>}{<jak>}" vlo¾í do 
dokumentu èást souboru "<soubor>" (plný název souboru vèetnì pøípony)
od prvního øádku, na kterém se vyskytuje text "<odkud>" po
øádek, na kterém se vyskytuje text "<kam>", nebo (pokud text "<kam>"
nelze nalézt) po konec souboru. Neexistuje-li ani øádek s textem
"<odkud>", \docbytex{} vypí¹e pouze varování na terminál.

Pøíkaz "\ifirst" si své parametry nejprve 
expanduje a pak teprve pou¾ije. 
Aktivní vlnka v parametru expanduje na mezeru.

Parametr "<jak>" udává, zda se bude tisknout výchozí øádek (s~textem
"<odkud>") a koncový øádek (s~textem "<kam>"). Tento parametr obsahuje
právì dva znaky (plus nebo mínus) s následujícím významem:

\begtt
jak:  --   netiskne se výchozí ani koncový øádek
jak:  +-   tiskne se výchozí øádek a netiskne se koncový øádek
jak:  -+   netiskne se výchozí øádek, tiskne se koncový øádek
jak:  ++   tisknou se oba øádky
\endtt

Je-li parametr "<odkud>" prázdný (zapí¹eme pomocí "{}"), tiskne se od
zaèátku souboru. Je-li parametr "<kam>" prázdný, tiskne se jediný øádek.
Je-li parametr "<kam>=\end",\du{end} tiskne se a¾ do konce souboru.
Koncový øádek v tomto pøípadì neexistuje. 

Má-li parametr "<odkud>" (nebo "<kam>") hodnotu "\empty"\du{empty} 
(zapí¹eme pomocí "{\empty}"), tiskne se od (nebo do) prvního prázdného øádku.
Parametr "<jak>" ovlivní jeho tisk.

Parametry "<odkud>" nebo "<kam>" mohou mít na svém zaèátku znak "^^B"
(tím dáváme najevo, ¾e text musí na øádku zaèínat) nebo na svém konci
znak "^^E" (tím dáváme najevo, ¾e text musí na øádku konèit). Tak¾e
tøeba "^^Btext^^E" znamená, ¾e se vyhledává øádek, ve kterém je pouze
"text" a nic jiného.

V parametrech "<odkud>" a "<kam>" se nesmìjí vyskytovat speciální
\TeX{}ové znaky (speciální kategorie). Pro pou¾ití znakù
"\", "{", "}", "%" a {\tt\char`\"} v tìchto parametrech jsou 
v~\docbytex{}u pøipraveny zástupné kontrolní
sekvence "\nb"\du{nb}, "\obrace"\du{obrace}, "\cbrace"\du{cbrace},
"\percent"\du{percent} a "\inchquote"\du{inchquote}. 
Sekvence pro dal¹í speciální 
znaky "#", "$", atd. si musíte vytvoøit napø. pomocí:

\begtt
{\catcode`\#=12 \gdef\vezeni{#}}
\endtt

Jsou-li parametry "<odkud>" a "<kam>" stejné, nebo oba texty jsou na
stejném øádku, pak se pøi "<jak>=++" nebo "<jak>=+-" vytiskne 
tento jeden øádek. Pøi "<jak>=-+" nebo "<jak>=--" se tiskne a¾ 
do konce souboru nebo do dal¹ího výskytu textu "<kam>". 

Pøíkaz "\ifirst" si zapamatuje název èteného souboru a pozici
posledního pøeèteného øádku v~daném souboru. Pak je mo¾né pou¾ít
pøíkaz "\inext{<odkud>}{<kam>}{<jak>}", který zaèíná hledat výchozí øádek 
s textem "<odkud>" od místa v souboru, kde naposledy skonèilo ètení
pøíkazem "\ifirst" nebo "\inext". Parametry "<odkud>", "<kam>" a "<jak>"
mají stejný význam, jako u pøíkazu "\ifirst".

V registru "\lineno"\du{lineno} je po ukonèení pøíkazu "\ifirst" nebo "\inext"
èíslo øádku, které bylo naposledy pøeèteno (tøeba¾e tento øádek nebyl
vyti¹tìn). Pokud bylo dosa¾eno konce souboru, obsahuje "\lineno"
poèet øádkù souboru. Pomocí "\ifeof\infile" je mo¾né se zeptat, zda
bylo dosa¾eno konce souboru.

Pøíklady

\begtt
\ifirst {soubor.txt}{textik}{textik}{++}    % vytiskne první výskyt øádku
                                            % obsahující slovo textik
\inext {textik}{textik}{++}                 % vytiskne následující výskyt
                                            % øádku obsahující slovo textík
\ifirst {soubor.c}{//: odkud}{//:}{--}      % analogie pøíkazu \ins
\ifirst {soubor.c}{funkce(}{)}{++}          % tisk prototypu funkce
\ifirst {soubor.c}{funkce(}{^^B\cbrace}{++} % tisk celého kódu funkce
\ifirst {soubor.txt}{}{\end}{++}            % tisk celého souboru
\ifirst {soubor.txt}{}{\empty}{+-}          % tisk po prázdný øádek
\endtt

Je-li první øádek, který se má tisknout, prázdný, netiskne se. Je-li
poslední øádek, který se má tisknout, prázdný, také se netiskne. Toto
je implicitní chování. Pokud napí¹ete "\skippingfalse",\du{skippingfalse} 
uvedená inteligence je zru¹ena a pøepisují se i prázdné øádky vpøedu a vzadu.
Pøíkazem "\skippingtrue"\du{skippingtrue} se vrátíte k pùvodnímu nastavení.

Parametrùm "<odkud>" a "<kam>" mù¾e pøedcházet text 
"\count=<èíslo> ".\du{count} Hodnota "<èíslo>" oznaèuje,
kolikátý výskyt textu "<odkud>" nebo "<kam>" se má pou¾ít.
Napøíklad "{\count=3 <odkud>}" znamená, ¾e se má
pøi vyhledávání "<odkud>" pøeskoèit dva jeho výskyty a zaèít
pøepisovat soubor a¾ od výskytu tøetího. Podobnì "{\count=5 <kam>}"
znaèí, ¾e se pøi pøepisování souboru ignorují ètyøi výskyty "<kam>" a
pøepisování se zastaví a¾ u výskytu pátého.

Implicitnì, není-li "\count=<èíslo> " uvedeno, pøedpokládá se
"\count=1 ". 

Pokud je text "<odkud>" prázdný, pak
"\count" oznaèuje èíslo øádku, na kterém se má zahájit výpis. Je-li
prázdný parametr "<kam>", pak "\count" oznaèuje poèet pøepisovaných
øádkù. Toto platí pro "<jak>=++" a pro "\skippingfalse". 
Pøi jiných hodnotách "<jak>" se
uvedená èísla logicky posunou o jednièku. Pøi prázdném "<odkud>" nebo
"<kam>" není mezera za "\count=<èíslo>" povinná. Pøíklady:

\begtt
\skippingfalse
\ifirst {soubor.txt}{\count=20}{\count=10}{++} % tisk øádkù 20 a¾ 29
\ifirst {soubor.txt}{}{\count=2 \empty}{+-} % tisk po druhý prázdný øádek
\ifirst {soubor.txt}{\count=50}{\end}{++}  % tisk od 50. øádku do konce
\ifirst {soubor.tex}{\count=5 \nb section}{\count=2 \nb section}{+-}
                                    % tisk páté sekce z TeXového souboru 
\endtt


\subsec [lineodkazy] Odkazy na èísla øádkù
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Pomocí "\cite[<lejblík>]" je mo¾né odkazovat na èíslo øádku ve výpisu
zdrojového kódu. Tento pøíkaz se promìní na skuteèné èíslo øádku.
Pøed pou¾itím pøíkazu "\ifirst" nebo "\inext" je nutné "<lejblík>"
deklarovat pøíkazem "\ilabel [<lejblík>]{<text>}".\du{ilabel} 
Tìchto pøíkazù mù¾e být pøed pou¾itím "\ifirst" resp. "\inext" více.
Na poøadí pøíkazù "\ilabel" pøed jedním "\ifirst" nebo "\inext" nezále¾í.

Existují-li deklarované "<lejblík>"y a "<text>"y, pak pøíkaz 
"\ifirst" nebo "\inext" si v¹ímá výskytu "<text>"u ve vkládaných
øádcích. Pokud takový "<text>" najde, pøiøadí èíslo øádku
odpovídajícímu "<lejblík>"u, tak¾e pøíkaz "\cite" bude fungovat, jak má.

Parametr "<lejblík>" musí být jednoznaèný v celém dokumentu. Pøíkaz
"\cite" funguje dopøednì i zpìtnì.

Pøíkazy "\ilabel" mají lokální pùsobnost a spolupracují jen 
s nejbli¾¹ím následujícím "\ifirst" a "\inext".
Tak¾e pøed pou¾itím dal¹ího "\ifirst" resp. "\inext" 
je potøeba deklarovat dal¹í vyhledávané texty 
pomocí "\ilabel" znovu. 

\docbytex{} nevypí¹e ¾ádné varování, pokud nìjaký "<text>"
deklarovaný v "\ilabel" nenajde. Ov¹em pøi pou¾ití "\cite" se objeví
varování, ¾e není známý "<lejblík>" a toto varování nezmizí ani pøi
opakovaném \TeX{}ování. 

Pokud se "<text>" vyskytuje ve více øádcích ukázky, je odkazován
øádek s prvním výskytem.

V následující ukázce je èten ji¾ známý soubor "cosi.c" 
(viz kapitolu~\cite[priklad]).

\begtt
Na øádku~\cite[ufunkce] je deklarovaná ú¾asná funkce.

\ilabel [ufunkce] {funkce (float}
\ilabel [navratx] {navrat.x}
\ifirst {cosi.c}{}{}{++}

Zvlá¹tì upozoròuji na geniální my¹lenku na øádku~\cite[navratx], 
kde je vstupní parametr vynásoben dvìma. 
\endtt

\subsec Verbatim ukázky pomocí {\tt\nb begtt}/{\tt\nb endtt} a
        palcových uvozovek
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Verbatim ukázky mù¾ete do dokumentace vkládat pomocí "\begtt"\du{begtt} a
"\endtt"\du{endtt}. Ty jsou (na rozdíl od vkládaných souborù) napsány pøímo ve
zdrojovém textu \TeX{}u.
V¹echny øádky za "\begtt" jsou vlo¾eny beze zmìn a¾ po
ukonèovací "\endtt". Øádky nejsou èíslovány a texty v nich nemodrají a
nestávají se klikatelnými odkazy.

Následující sekce~\cite[hooky] a~\cite[begtt] obsahují informace,
jak je mo¾né toto implicitní chování zmìnit.

Verbatim ukázky uvnitø odstavce lze vymezit palcovými uvozovkami
{\tt\char`\"...\char`\"}. V tomto prostøedí probíhá tisk strojopisem a
je aktivní enc\TeX{}, tak¾e dokumentovaná slova se stávají 
automaticky odkazy na místo, kde je "\dg". Doporuèuje se toto
prostøedí pou¾ívat na výpisy ve¹kerých èástí kódù dokumentovaného
programu, které jsou vlo¾eny uvnitø textu v odstavci (analogie
matematického prostøedí "$...$").

\subsec [ddsl] Deklarace dokumentovaného slova
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Na deklaraci slova, které dokumentujeme, lze pou¾ít pøíkaz "\dg",\du{dg}
"\dgn",\du{dgn} "\dgh",\du{dgh} "\dl",\du{dl} "\dln"\du{dln} 
nebo "\dlh"\du{dlh}. Významy jednotlivých
pøíkazù vysvìtlíme pozdìji. Nejprve se vìnujme syntaxi parametrù.
V¹echny pøíkazy mají stejnou syntaxi, tak¾e nebude vadit, kdy¾ bude
vylo¾ena jen v souvislosti s pøíkazem "\dg". Syntaxe je ponìkud
zvlá¹tní. Úèelem toti¾ bylo minimalizovat práci písaøe, tak¾e jsem se
vyhnul kuèeravým závorkám, parametr separuji podle mezery nebo nìèeho
jiného, atd.

Existují tyto mo¾nosti syntaxe parametrù:

\def\begtthook{\langleactive \mubytein=1}
\begtt
\dg <slovo>            % <slovo> separované mezerou
\dg [<text>] <slovo>    % navíc nepovinný "pøední" <text>
\dg [<text>]<slovo>     % <slovo> mù¾e na [<text>] navazovat bez mezery
\dg <slovo>()          % <slovo> s dvojicí "()" separované mezerou
\dg [<text>]<slovo>()   % kombinace pøedchozího
\dg <slovo>,           % <slovo> separované èárkou
\dg [<text>] <slovo>,   % kombinace pøedchozího
\dg <slovo>(),         % <slovo> s dvojicí "()" separované èárkou
\dg [<text>]<slovo>(),  % kombinace pøedchozího
\dg <slovo>.           % slovo separované teèkou
atd...
\endtt
\def\begtthook{}

Obecnì: za pøíkazem "\dg" mù¾e následovat nepovinná "[". Pokud
následuje, pak se pøeète "<text>" a¾ po ukonèovací "]". Parametr
"<text>" mù¾e obsahovat mezery. Za ukonèovací "]" mù¾e a nemusí být
mezera. Pokud tam je, pak ji makro pøesune pøed koncovou závorku "]",
tak¾e "\dg"~"[aha] slovo" je toté¾ jako "\dg"~"[aha ]slovo".
Dále následuje ètení parametru "<slovo>". 
Tento parametr nesmí obsahovat mezeru, èárku, teèku, støedník
a dvojteèku. Ètení parametru je ukonèeno, jakmile se objeví mezera
nebo èárka nebo teèka nebo støedník nebo dvojteèka. Uvedená
interpunkce není souèástí parametru "<slovo>" a po zpracování parametru
se vrátí do vstupní fronty, tak¾e se bì¾nì vytiskne.
Nakonec se zjistí, zda pøeètený parametr a¾ po separátor není ve tvaru
"<slovo>()". Pokud je, pak symbol "()" se nepova¾uje za souèást
parametru "<slovo>", ale mluvíme o "<slovu>" následovaném dvojicí~"()".

Pozor, za separátorem typu èárka, teèka, støedník a dvojteèka se musí
vyskytnout mezera. Ne nutnì ihned, ale døíve, ne¾ se objeví úsek
textu, který má být pøeèten s jinými kategoriemi 
(napø.~{\tt\char`\"...\char`\"}). Není tedy mo¾né psát 
"\dg" {\tt text,\char`\"...\char`\"}.
Pokud za separátorem mezera následuje znak {\tt\char`\`} (obrácený
apostrof), mezera ani tento znak se netiskne. To je mo¾né vyu¾ít
napøíklad pro vlo¾ení nezlomitelné mezery nebo pro jiné úèely: 
"\dg"~"<slovo> `~<pøilepený text>"
nebo "\dg"~"<slovo> `"{\tt\char`\"...\char`\"}.

Pøíkazy "\dgh", "\dgn", "\dln", "\dlh" separující mezeru 
netisknou nikdy, proto¾e tyto pøíkazy vìt¹inou netisknou nic (viz ní¾e).

Parametr "<slovo>" je dokumentované slovo. Pokud se takové "<slovo>"
vyskytne nìkde jinde v dokumentu mezi {\tt\char`\"...\char`\"} nebo ve
vlo¾eném zdrojovém kódu, automaticky zmodrá a stává se klikatelným
odkazem na místo, kde je pou¾ito "\dg". V místì pou¾ití "\dg" je slovo
zvýraznìno èervenou barvou. Je vyti¹tìno samotné bez parametru
"<text>" a bez pøípadných závorek "()". V poznámce pod èarou se vypí¹e
"<slovo>" (èervenì). Tam je i pøípadný "<text>" (pøed slovem) a za ním
je pøípadná dvojice "()". Vedle tohoto výpisu je
seznam stránek s výskyty "<slova>". V rejstøíku se objeví nìco podobného,
jako v poznámce pod èarou. Rejstøík je øazen abecednì podle "<slovo>",
nikoli podle "<text>".

Pøíkaz "\dg" deklaruje "<slovo>" globálnì. Bude na nìj odkazováno v celém
dokumentu. 

Pøíkaz "\dgh" pracuje jako "\dg", ale slovo nebude v místì "\dgh"
vypsáno ("\dg" hidden). Bude tam jen cíl odkazù a "<slovo>" 
se objeví v poznámce a v rejstøíku. 

Pøíkaz "\dgn" zpùsobí, ¾e první následující výskyt
"<slova>" ve vypisovaném zdrojovém kódu 
se stane cílem v¹ech ostatních odkazù, zèervená (tedy
nezmodrá) a v místì tohoto výskytu se objeví pøíslu¹ná poznámka pod
èarou. Pøíkaz "\dgn" èteme jako "\dg" next, nebo "\dg" následující.

Pøíkaz "\dl" deklaruje "<slovo>" lokálnì. Bude na nìj odkazováno svým
krátkým jménem "<slovo>" jen v místì stejného jmenného prostoru,
typicky pøi dokumentaci jednoho modulu. Ka¾dý modul zahájený pøíkazem
"\module" zavádí jmenný prostor tvaru "<slovo>./<název>", kde
"<název>" je jméno modulu. Slovo deklarované pomocí "\dl" ¾ije ve dvou
variantách. V krátké variantì jako "<slovo>" jen v rozsahu jednoho
jmenného prostoru a v dlouhé variantì "<slovo>./<název>" ¾ije globálnì
v celém dokumentu. Pøípadný výskyt dlouhého názvu odká¾e na místo
deklarace napøíè celým dokumentem.

Podrobnìji o jmenných prostorech a mo¾nosti jejich zmìny najdete 
v~sekci~\cite[jmenneprostory]. 

Ka¾dé "<slovo>" musí být v dokumentu deklarováno nejvý¹e jednou, jinak
\docbytex{} ohlásí chybu. V pøípadì "\dl" musí existovat
jednoznaèný dlouhý název.

Pøíkaz "\dlh" je skrytý "\dl". Pøíkaz "\dln" znamená "\dl" next.
Analogicky, jako pøíkazy "\dgh" a "\dgn".

Pokud nìkoho irituje vysoká inteligence tìchto pøíkazù pøi ètení
parametrù, mù¾e pou¾ít interní verzi pøíkazù s povinnými tøemi
parametry obalenými do kuèeravých závorek: "\iidg",\du{iidg} 
"\iidgh",\du{iidgh} "\iidgn",\du{iidgn} 
"\iidl",\du{iidl} "\iidlh",\du{iidlh} "\iidln".\du{iidln} 
Parametry vypadají
takto: "\iidg{<pøed>}{<slovo>}{<za>}". Pravda, tyto pøíkazy umo¾òují
více ne¾ jejich krátké verze: umo¾òují do parametru "<slovo>"
propa¹ovat èárku, mezeru, støedník atd. a do parametru "<za>" napsat
cokoli, nejen kulaté závorky.
 

\subsec [jmenneprostory] Jmenné prostory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Jmenný prostor je pravidlo, podle kterého se krátký název
dokumentovaného "<slova>" transformuje pøi pou¾ití "\dl"
na název dlouhý. Je mo¾né jej nastavit nebo zmìnit pomocí pøíkazu
"\namespace"\du{namespace}, který se pou¾ije takto:
"\namespace" "{<text1>#1<text2>}...\endnamespace".\du{endnamespace} 
Pokud je uvnitø tohoto prostøedí pou¾it pøíkaz 
"\dl<slovo>", je slovu pøidìlen krátký název "<slovo>" a dlouhý název 
"<text1><slovo><text2>". 
Uvnitø takto deklarovaného prostøedí se v¹echny výskyty
krátkého názvu "<slovo>" transformují na dlouhý název a jsou
prolinkovány s odpovídajícím místem "\dl". Jmenný prostor je lokální
uvnitø svého prostøedí, tak¾e vnì prostøedí se "<slovo>"
chová, jakoby nebyl ¾ádný pøíkaz "\dl" pou¾it.
Napøíklad uvnitø prostøedí "\namespace"~"{#1//uff}...\endnamespace" je ke
ka¾dému slovu deklarovanému pomocí "\dl<slovo>" pøidìlen dlouhý název 
"<slovo>//uff" a výskyty "<slovo>" odkazují na místo "\dl<slovo>". 

Vnì v¹ech prostøedí "\namespace...\endnamespace" není jmenný prostor definován, 
tak¾e tam není mo¾né pou¾ít pøíkaz "\dl". 
Ov¹em pøíkaz "\module"~"<název> " nastaví jmenný
prostor na "{#1./<název>}", tak¾e uvnitø dokumentace modulu
je mo¾né pou¾ívat pøíkaz~"\dl".

V rejstøíku a v poznámce pod èarou se tisknou dlouhé názvy. Rejstøík
abecednì øadí podle dlouhých~názvù. V obsahu se tisknou názvy krátké.

Pøíklad práce se jmennými prostory:

\begtt
\namespace {ju::#1}   %% nastavuji namespace ju
Tady deklaruji slovo \dl aha.
Tady slovo "aha" automaticky odkazuje na místo deklarace.
Slovo "ju::aha" také odkazuje na místo deklarace.
\endnamespace
\namespace {hele::#1} %% nastavuji namespace hele
Tady znovu deklaruji slovo \dl aha.
Zde slovo "aha" odkazuje na lokální deklaraci uvnitø "hele"
\endnamespace         %% ru¹ím namespace
Zde slovo "aha" neodkazuje nikam, ale slova "ju::aha"
a "hele::aha"  stále odkazují na místa, kde byla deklarována.
\endtt

Prostøedí "\namespace...\endnamespace" je mo¾né vnoøovat, ov¹em vnoøená 
prostøedí musejí mít jiný jmenný prostor ne¾ prostøedí vnìj¹í. Prostøedí 
jmenných prostorù pracují globálnì nezávisle na "\bgroup", "\egroup".
Pøíkaz "\endnamespace" pou¾itý vnì v¹ech prostøedí 
"\namespace...\endnamespace" neudìlá nic. Prostøedí není nutné pøed 
pøíkazem "\bye" ukonèovat.


\subsec Místo pro dokumentaci aplikaèního rozhraní
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Mù¾e se stát, ¾e pí¹eme dokumentaci jednak pro u¾ivatele, které zajímá
zpùsob pou¾ití dokumentovaných funkcí a co zhruba dìlají (tzv.~API),
ale nezajímá je, jak je funkce naprogramovaná. Druhak chceme mít
dokumentován i zpùsob, jak funkce funguje uvnitø. V takovém pøípadì
musí dokumentované "<slovo>" odkazovat na dvì místa v dokumentu. 

Místo, kde je podrobnì "<slovo>" popsáno, je vymezeno pøíkazem "\dg"
nebo podobným. Místo, kde slovo dokumentujeme pro u¾ivatele (je-li
toto místo odli¹né od prvního místa), lze vyznaèit pøíkazem
"\api{<slovo>}"\du{api}. V místì pou¾ití "\api{<slovo>}" se nestane
nic, jen se tam umístí neviditelný cíl odkazù. V obsahu se pak
"<slovo>" objeví s odkazem na toto místo. V rejstøíku se v seznamu
stránek objeví jedna stránka podtr¾ená: to je stránka, kde byl pou¾it
pøíkaz~"\api{<slovo>}". Ov¹em, aby se v rejstøíku "<slovo>" vùbec
objevilo, musí se nìkde v dokumentu vyskytovat i jeho plná deklarace
pomocí "\dg" nebo podobných pøíkazù. Na stránce, kde je pou¾ito "\dg",
je pod èarou vedle slova seznam stránek a rovnì¾ je tam jedna stránka
podtr¾ená. Kdy¾ ètete implementaèní popis pro "<slovo>", snadno se
tedy dostanete na stránku, kde je API k tomuto "<slovu>".  V~rejstøíku
a obsahu jsou také slova, která byla deklarovaná pomocí "\api", zleva
vyznaèena textem "\apitext"\du{apitext}. Ten je implicitnì nastaven na
¹ipku. Mù¾ete se podívat do rejstøíku a do obsahu tohoto dokumentu. V
tomto místì bylo pou¾ito "\api{\nb api}", zatímco skuteèná definice
pøíkazu "\api" je v sekci~\cite[reference].

Je-li pou¾ito "\api{<slovo>}", pak je mo¾né se na místo odkazovat také
pomocí "\cite[+<slovo>]". Tato konstrukce se promìní v èíslo stránky,
kde je dokumentováno API daného slova. Napøíklad v tomto dokumentu
se "\cite[+\nb api]" promìní na:~\cite[+\nb api]. 

Pokud toto slovo má také svùj API cíl (vytvoøený pomocí
"\api"), pak se èervený text (ti¹tìný v místì "\dg") 
stává aktivním odkazem na API cíl. Tam
typicky ètenáø najde výskyt slova, který je zase klikatelným odkazem
na "\dg" cíl. Tak¾e tyto dva cíle jsou prolinkovány køí¾em.

\subsec [kapsec] Sekce, sekcièky, èást, titul
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Sekce se uvozují pøíkazem "\sec"~"<název sekce>\par"\du{sec}. Ka¾dá
sekce mù¾e mít nìkolik podsekcí (sekcièek), které lze vyznaèit
pøíkazem "\subsec"~"<název podsekce>\par"\du{subsec}. 
Symbol "\par" zde znamená,
¾e název sekce èi podsekce je oddìlen od dal¹ího textu prázdným
øádkem (viz ukázku v~\cite[cleneni]).

Nìkolik sekcí mù¾e tvoøit èást. Èást je uvozena pøíkazem
"\part"~"<název èásti>\par"\du{part}. Èásti jsou automaticky oznaèeny
písmeny A,B,C,\dots a jsou vyznaèeny výraznìji ne¾ sekce v~místì
zaèátku èásti i v~obsahu. Èásti ale nenaru¹ují èíslování
sekcí. Tj. sekce jsou èíslovány od jedné napøíè celým dokumentem bez
ohledu na to, zda jsou nebo nejsou rozdìleny na èásti.

Pøíkaz "\module <soubor> " automaticky zalo¾í sekci s názvem
"Modul <soubor>" a deklaruje svùj jmenný prostor.
Toto chování lze zmìnit, viz~\cite[nazvy], \cite[module].

Pøíkaz "\title<název>\par"\du{title} vytiskne název dokumentu vìt¹ím písmem a v
rámeèku. Je-li definováno makro "\projectversion"\du{projectversion},
bude jeho obsah vyti¹tìn drobnì vpravo nahoøe doplnìný zepøedu textem 
"verze".  Pokud vá¹ projekt nemá verzi, mù¾e se hodit tøeba: 

\begtt
\def\projectversion{\the\day. \the\month. \the\year}
\endtt

Pøíkaz "\author<text>\par"\du{author} napí¹e do 
støedu øádku tuènì "<text>",
co¾ bývá obvykle jméno autora (jména autorù).

Do záhlaví ka¾dé stránky se zaène pøepisovat zleva název aktuální
sekce a zprava název dokumentu. U¾ivatel mù¾e text pro pravé záhlaví
zmìnit zmìnou makra "\headtitle"\du{headtitle}.

Pøíkazy "\sec" a "\subsec" mohou mít v hranaté závorce nepovinný
parametr "<lejblík>". V takovém pøípadì vypadají parametry takto:
"\sec"~"[<lejblík>] <název sekce>\par". Po takovém pou¾ití je mo¾né
se na sekci (podsekci) odkazovat pøíkazem "\cite[<lejblík>]". Tento pøíkaz se
promìní v èíslo odkazované sekce (podsekce) a navíc se stane
aktivním odkazem.

Pomocí pøíkazu "\savetocfalse"\du{savetocfalse} lze pøed pou¾itím 
pøíkazu "\sec" nebo "\subsec" zajistit, ¾e název sekce se 
nedostane do obsahu a nebude mít své èíslo. Místo èísla se 
vytiskne obsah makra "\emptynumber"\du{emptynumber}, které je
implicitnì prázdné. Pøíkaz "\savetocfalse" ovlivní jen
první následující "\sec" nebo "\subsec".

\subsec [krizodkaz] Køí¾ové odkazy
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Cíl, kam smìøuje odkaz, je potøeba vyznaèit pomocí "<lejblíku>".
To je mo¾né udìlat v pøíkaze "\sec", "\subsec" (viz pøedchozí 
sekci~\cite[kapsec]) nebo kdekoli v textu samostatným pøíkazem
"\label[<lejblík>]"\du{label}. Také je mo¾né odkazovat na èíslo øádku
(viz sekci~\cite[lineodkazy]).
V¹echny lejblíky musejí být jednoznaèné (bez ohledu na jejich typ)
napøíè celým dokumentem.

Pøíkaz "\pgref[<lejblík>]"\du{pgref} expanduje na èíslo strany, na které se
vyskytuje cíl odkazu. Pøíkaz "\numref[<lejblík>]"\du{numref} expanduje 
v~závislosti na typu cíle na:

\begitems
\item * èíslo sekce, je-li cílem sekce,
\item * dvojèíslí "<sekce>.<podsekce>", je-li cílem podsekce,
\item * èíslo øádku, je-li cílem øádek zdrojového kódu,
\item * prázdné makro, je-li "<lejblík>" deklarovaný pomocí "\label".
\enditems

Oba pøíkazy "\pgref" a "\numref" expandují na uvedené texty bez dal¹í
inteligence. Tj. výstupní text se nestává klikatelným odkazem. 

K aktivaci odkazu v PDF módu slou¾í 
makro "\ilink"~"[<lejblík>]{<text>}"\du{ilink}. Toto makro vytiskne modøe
"<text>", který se stává klikatelným odkazem na cíl, deklarovaný
pomocí "<lejblíku>". Tak¾e ji¾ známý pøíkaz "\cite[<lejblík>]"\du{cite}
udìlá zhruba to samé, jako "\ilink[<lejblík>]{\numref[<lejblík>]}".
Skuteèný pøíkaz "\cite" navíc ovìøí, zda není "\numref[<lejblík>]"
prázdné makro. Pokud je, obarví namísto výstupu "\numref" 
výstup makra "\pgref".

Pokud "<lejblík>" jako argument pøíkazu "\pgref", "\numref" nemá svùj
cíl, pøíkaz "\pgref" expanduje na hodnotu $-1000$ a "\numref"
expanduje na prázdný výstup. Jsou to expanzní makra, tak¾e v nich není
implementován napøíklad tisk varování. Podívejte se na definici
pøíkazu "\cite" (na stranì~\cite[@\nb cite]), jak se dá tisk varování
implementovat.

Makro "\module"~"<jméno> " zalo¾í sekci s lejblíkem "m:<jméno>", tak¾e
lze na ní pak odkazovat. Napøíklad si mù¾ete vytvoøit makro

\begtt
\def\refmodul[#1]{\ilink[m:#1]{\tt#1}}
\endtt
%
které aktivizuje svùj parametr, pokud tento je názvem nìjakého
modulu. Tøeba "\refmodul[base]" vytiskne slovo "base" strojopisem a
modøe a stává se klikatelným odkazem na zaèátek sekce
\uv{Modul base}, pokud je tato sekce zalo¾ena pøíkazem "\module".

Makra "\dg", "\dgn", "\dgh" internì provedou pøíkaz "\label[@<slovo>]"
a makra "\dl", "\dln", "\dlh" provedou pøíkaz 
"\label[@<dlouhé slovo>]", kde "<dlouhé slovo>" je "<slovo>" 
po transformaci podle aktuálního jmenného prostoru.
Na místa, kde jsou slova dokumentovaná, je tedy mo¾né odkazovat
napøíklad pomocí 
"\link[@<slovo>]{<slovo> dokumentované na stranì~\pgref[@<slovo>]}". 

Makro "\api{<slovo>}" internì provede "\label[+<slovo>]", tak¾e je
mo¾né na toto místo odkazovat tøeba pomocí 
"\ilink[+<slovo>]{API: <slovo>}".

\docbytex{} nenabízí kromì èísel sekcí, podsekcí a èísel øádkù ¾ádné dal¹í
automatické èíslování. Pokud tedy chcete implementovat napø. èíslování
obrázkù, èísla publikací atd., musíte si napsat makra vlastní.
K tomu mù¾ete vyu¾ít makro
"\labeltext[<lejblík>]{<text>}"\du{labeltext}, které ulo¾í v
horizontálním módu do sazby neviditelný cíl odkazu, a pøi dal¹ím
prùchodu \TeX{}em expanduje makro "\numref" na "<text>".
Pou¾ití makra uká¾eme na pøíkladì, ve kterém definujeme makro 
"\bib[<lejblík>]". Toto makro zahájí sazbu dal¹í polo¾ky v seznamu
literatury. Odkazovat na knihu pak lze pomocí "\cite[b:<lejblík>]".

\begtt
\newcount\bibnum
\def\bib [#1]{\par\advance\bibnum by1 \indent
    \llap{[\the\bibnum] }\labeltext[b:#1]{[\the\bibnum]}\ignorespaces}
\endtt

\subsec Vkládání obrázkù
%%%%%%%%%%%%%%%%%%%%%%%%

Pøíkazem "\ifig" "<¹íøka> <jméno obrázku> "\du{ifig} je mo¾né vlo¾it obrázek.
Obrázek musí být pøipraven v souboru "fig/<jméno obrázku>.eps" (v pøípadì
DVI módu) a v souboru "fig/<jméno obrázku>.pdf" (v~pøípadì PDF módu). 
Adresáø, kde \docbytex{} vyhledává obrázky ("fig/"), lze zmìnit 
pøedefinováním sekvence "\figdir"\du{figdir} . Rozmìr "<¹íøka>" 
je bez jednotky a udává pomìr po¾adované ¹íøky obrázku ku 
¹íøce sazby. Obrázek je umístìn zarovnán doleva na odstavcovou zará¾ku.

Máte-li pøipraven obrázek ve formátu "eps", pak jej do "pdf" pøevedete
pøíkazem

{\def\begtthook{\langleactive}
\begtt 
ps2pdf -dEPSCrop <jméno obrázku>.eps
\endtt
\par}

\subsec Výèty
%%%%%%%%%%%%%

Seznam polo¾ek obklopíte "\begitems"\du{begitems} a
"\enditems"\du{enditems}. V tomto prostøedí je text odsazen zleva 
o~odstavcovou zará¾ku. Prostøedí lze vnoøovat. Jednotlivou polo¾ku
zahájíte pomocí "\item"~"<znaèka> <text>",\du{item} 
pøitom "<znaèka>" se
vystrèí vlevo od "<textu>". Je-li "<znaèka>" hvìzdièka, promìní se v
puntík. Dal¹í mo¾nost: "\item"~"\the\itemno) <text>",\du{itemno} 
co¾ vytvoøí èíslované výèty, v ka¾dém prostøedí èíslovány od jedné.

Makro plainu "\item" není pøedefinováno globálnì, ale jen uvnitø
"\begitems...\enditems". Mù¾ete tedy pou¾ít i makro plainu,
pokud se vám koncept polo¾ek nabízený \docbytex{}em nelíbí.


\noactive{/*}\noactive{*/}\noactive{//} 
\setlinecomment{\percent} \noactive{\nb\percent} \noactive{\percent\cbrace}


\sec [zmeny] Pro nároèné
%%%%%%%%%%%%%%%%%%%%%%%%

V této sekci jsou uvedeny a vysvìtleny definice základních 
pøíkazù \docbytex{}u. U¾ivatel si mù¾e tyto definice zmìnit, pokud chce
zmìnit chování \docbytex{}u. Pokud napøíklad pracuje s jiným
programovacím jazykem, mù¾e si zmìnit makro "\docsuffix" nebo
kompletnì pøedefinovat makra "\module" a "\ins".

\subsec [nazvy] Interní názvy
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Pøíkazem "\doindex" vytvoøí \docbytex{} automaticky novou
sekci s názvem \uv{Rejstøík}. Podobnì pøi tvorbì obsahu nebo nata¾ení
modulu vzniká název \uv{Obsah} nebo \uv{Modul}. Pøed názvem verze 
v~titulu pøi pou¾ití "\projectversion" se objeví slùvko \uv{verze}.
Èást (vytvoøená pomocí "\part") má v zálo¾kách uvozující text 
">> CAST".
Tyto texty jsou definovány v makrech
\db titindex, \db tittoc, \db titmodule, \db titversion a \db opartname.

\ifirst {docby.tex}{Intern}{\empty}{--}

Za pov¹imnutí stojí, ¾e jsou jinak tato makra definována pøi pou¾ití
klasického "plain"u a jinak pøi pou¾ití "csplain"u. To ov¹em
neznamená, ¾e u¾ivatel si tyto názvy nemù¾e pøedefinovat je¹tì jinak,
nezávisle na pou¾itém formátu.

\subsec [hooky] Vlo¾ené skupiny pøíkazù (hooks)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Nìkterá slo¾itìj¹í makra ("\begtt", palcové uvozovky, "\ifirst",
"\inext", "\doindex", "\dotoc") dovolují vkládat u¾ivateli na zaèátku
zpracování rùzné pøíkazy (tzv.~hooks). Implicitnì
jsou tyto vlo¾ky prázdné:

\ifirst {docby.tex}{begtthook}{\empty}{+-}

Makro \db begtthook je vlo¾eno po zalo¾ení skupiny a nastavení v¹ech
kategorií tìsnì pøed zaèátkem zpracování prostøedí "\begtt...\endtt".
Makro \db quotehook je vlo¾eno po zalo¾ení skupiny a nastavení v¹ech
kategorií tìsnì pøed zaèátkem zpracování prostøedí {\tt\char`\"...\char`\"}.
Makro \db indexhook je vlo¾eno makrem "\doindex" po zalo¾ení sekce
a pøed pøechodem do sazby ve dvou sloupcích. V tomto dokumentu je v
nìm úvodní povídání k rejstøíku. 
Makro \db tochook je vlo¾eno makrem "\dotoc" po zalo¾ení sekce
pøed sazbou prvního øádku obsahu.
Makro \db bookmarkshook je vlo¾eno uvnitø skupiny na zaèátku
zpracování zálo¾ek. Je mo¾né v nìm nastavit expanze maker
vyskytujících se v nadpisech na rozumnou hodnotu pro zálo¾ky.
Pokud navíc nastavíte "\let\cnvbookmark=\lowercase", budou v¹echny
znaky pro zálo¾ky procházet filtrem "\lowercase". Uvnitø
"\bookmarkshook" je pak mo¾né nastavit "\lccode" vybraným znakùm
(napøíklad pro odstranìní háèkù a èárek).
Makro \db outputhook je vlo¾eno na zaèátek výstupní rutiny. Je vhodné
v nìm nastavit vybrané pøíkazy na hodnotu "\relax", aby se
neexpandovaly do souboru {\tt.ref}.

Pøíklady pou¾ití

\bgroup
\catcode`'13 \def'{\nb} \catcode`?=13 \def?{<} 
\def\begtthook{\langleactive\mubytein=1}
\begtt
\def\quotehook{\obeyspaces}   % ve výpisech "..." budou normální mezery
\def\quotehook{\langleactive} % ?text> se promìní na <text>
\def\begtthook{\mubytein=1}   % mezi 'begtt...'endtt bude aktivní encTeX
\def\begtthook{\setsmallprinting} % ukázky 'begtt...'endtt budou malé
\def\begtthook{\catcode`\!=0} % mezi 'begtt...'endtt fungují !prikazy
\def\indexhook{To èubrníte, jaký tu mám rejstøík.}
\def\outputhook{\let\mylogo=\relax} % \mylogo nebude expandovat
\endtt
\par
\egroup

\subsec [module] Pøíkaz {\tt\nb module} a {\tt\nb ins}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

U¾ivatelská dokumentace k tìmto pøíkazùm je v sekci~\cite[cleneni].
Pøíkaz \db module "<soubor> " naète soubor s názvem 
"<soubor>\docsuffix", kde makro
\db docsuffix obsahuje pøíponu souboru vèetnì teèky.

\ilabel [linkincomment] {extension}
\insdef docsuffix  

Pøíkaz "\module" vlo¾í název èteného souboru (bez pøípony) 
do pomocného makra
\db modulename. Toto makro pak vyu¾ívá pøíkaz 
\db ins "<pripona> <text> ".

\inssdef ins

\subsec Zelenající komentáøe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Pøíkazy "\ifirst" a "\inext" si také v¹ímají (implicitnì) C komentáøù
tvaru "//..<eol>" a "/* .. */". Tyto komentáøe barví ve výpisu
programu zelenì. Zru¹it tuto vlastnost lze pøíkazem "\noactive<string>".
Pomocí \db setlinecomment "{<string>}" lze nastavit nový typ komentáøù, 
které budou barveny zelenì od "<string>" do konce øádku. Pøíkazy mají globální
platnost. Napøíklad

{\def\begtthook{\mubytein=1}
\begtt
\noactive{/*}\noactive{*/}\noactive{//} 
\setlinecomment{\percent} \noactive{\nb\percent}}
\endtt
\par}
\noindent
nastaví komentáøe podle zvyklostí v \TeX{}u a PostScriptu.

Pøíkazem \db setlrcomment "{<levý>}{<pravý>}"
lze nastavit komentáøe typu "/*...*/".

Pro zmìnu vlastností obarvování komentáøù staèí uvedená makra
pou¾ít. Kdo chce vìdìt, jak jsou implementovaná, nech» ète dále.

\inext {mubyte}{\empty}{+-}

Uvedené pøíkazy jsou prázdné v módu bez enc\TeX{}u a pøi
detekci enc\TeX{}u zapí¹í informace do enc\TeX{}ové tabulky
prostøednictvím primitivù "\mubyte...\endmubyte".

Pøíkazy \db linecomment a \db leftcomment se díky enc\TeX{}u
automaticky vlo¾í pøed detekovanou sekvenci znakù. Tyto 
pøíkazy nastaví barvu textu na zelenou:

\inext {linecomment}{\empty}{+-}

Na druhé stranì pøíkaz \db rightcomment potøebuje vypnout zelenou barvu
a¾ po pøeskoèení detekované sekvence. Proto enc\TeX{} v tomto pøípadì
detekovanou sekvenci zru¹í a pøíkaz "\rightcomment" má za úkol ji vrátit
do sazby zpìt a teprve poté pomocí \db returntoBlack se vrátit 
k~èerné barvì.

\inext {returntoBlack}{\empty}{+-}

Je potøeba vysvìtlit, proè pøepínaèe barev jsou tak komplikovanì
zapsány. Pøepínaè toti¾ v PDF zapíná barvu nezávisle na skupinì a
barva textu se dr¾í tak dlouho, dokud není pou¾it jiný pøepínaè barvy.
Ka¾dý tisk øádku kódu je uveden pøepínaèem "\Black", tak¾e pøi
poznámce \uv{do konce øádku} staèí jen pøepnout na "\Green". Ov¹em
uvnitø komentáøe se mù¾e objevit link obalený
pøíkazy "\Blue...\Black" (viz napø. øádek~\cite[linkincomment] v
pøedchozí sekci). Pak ale chceme, aby "\Black" vrátil barvu
"\Green". Proto je provedeno pøedefinování pomocí "\let". Toto
pøedefinování je lokální. Proto¾e øádek je ti¹tìn uvnitø skupiny, je
dal¹í øádek u¾ èerný.

Pøi tisku komentáøe, který má úvodní a koncový znak a mù¾e pøesáhnout
jeden øádek, musíme globálnì pøedefinovat "\Black" na "\Green", aby i
dal¹í øádky (uvozené pøíkazem "\Black") byly zelené. Koncový znak 
komentáøe pak musí uvést barvy do pùvodního stavu. 

\docbytex{} inicializuje poznámky podle pravidel jazyka C:

\inext {setlinecomment}{\empty}{+-}

\sec [design] Pro designéry
%%%%%%%%%%%%%%%%%%%%%%%%%%%

Následuje dokumentace definic maker ovlivòující vzhled dokumentu.
Jejich pøedefinování mù¾e zpùsobit zmìnu vzhledu podle po¾adavku
u¾ivatele. Místo komplikovaných maker s mno¾stvím parametrù pro øízení
vzhledu jsou zde jednoduchá dobøe dokumentovaná makra pro jedno
pou¾ití.  Pøedpokládá se, ¾e pøi potøebì jiného vzhledu dokumentu je
u¾ivatel pøedefinuje.

Makra zabývající se vzhledem dokumentu jsou
pokud mo¾no oddìlena od slo¾itosti ostatních maker, ve kterých probíhá
hlavní zpracování \docbytex{}u. To umo¾òuje designérovi zamìøit se
jen na programování vzhledu a neutopit se v rùzných cyklech a
rekurzích interních maker \docbytex{}u.

Typicky jsou makra pro vzhled ve dvou verzích: pro pdf\TeX{} a bez
pdf\TeX{}u. To je dùvod, proè ve výpisech se èasto vyskytuje test
"\ifx\pdfoutput\undefined".

\subsec Parametry a pomocná makra pro nastavení vzhledu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Velikost \db hsize ani \db vsize nemìníme. Buï si ji nastaví u¾ivatel,
nebo se pøevezme velikost z~plainu (vhodné pro papír letter) èi
csplainu (vhodné pro papír A4). Nastavujeme ale vìt¹í \db parindent,
nebo» chceme do prou¾ku vymezeného "\parindent" dát podbarvené
ètvereèky u názvù sekcí. 

\ifirst {docby.tex}{parindent=}{\empty}{+-}

Pøipravíme si \uv{zú¾enou ¹íøku} \db nwidth vyu¾itou napø. jako ¹íøka záhlaví:

\inext {nwidth}{\empty}{+-}

Pøíkazem plainu "\raggedbottom"
nastavíme pru¾nost stránky dole, a ne mezi jednotlivými øádky.
Nastavením "\exhyphenpenalty=10000" zaká¾eme zlom za pomlèkou
(v~tisku rozsahu stránek, napø. 11--13, takový zlom pùsobí ru¹ivì).

\inext {raggedbottom}{\empty}{+-}

Zavedeme potøebné fonty 
\db bbf, \db bbbf, \db btt,
\db ttsmall, \db rmsmall, \db itsmall a \db partfont.

\inext {bbf=}{\empty}{+-}

Makro \db setsmallprinting pøepne do malého strojopisu, pøipraví
\db ttstrut vhodné velikosti a pomocí "\offinterlineskip" pøipraví tisk
øádkù v re¾imu, kdy se o sebe opírají. Hodnota "\parskip" je nastavena
na "-1pt", aby docházelo k mírnému pøekrývání a nevznikaly v tisku
nebo na obrazovce pruhy. Analogicky pracuje makro \db setnormalprinting.

\inext {setsmallprinting}{\empty}{+-}

V návrhu vzhledu pracuji jen s barvami
\db Blue, \db Red, \db Brown, \db Green, \db Yellow a \db Black.
Pokud budete chtít dal¹í barvy, definujte si je.\par\penalty1234

\inext {pdfoutput}{\empty}{+-}

Barvy jsou definovány pomocí makra \db setcmykcolor, které je v
pøípadì DVI výstupu nastaveno na prázdné makro a v pøípadì PDF výstupu
je pou¾it PDF~"\special". Tak¾e pøíkazy "\Brown" atd. je mo¾né pou¾ít i
ve verzi maker pro DVI, ov¹em v této verzi neudìlají nic.
Barva \db oriBlack je konstantnì èerná barva. Nìkterá makra toti¾
normální "\Black" pøedefinovávají a pak se potøebují vrátit pomocí
"\oriBlack" ke skuteèné èerné barvì.

Makro \db rectangle "{<vý¹ka>}{<hloubka>}{<¹íøka>}{<obsah>}"
vytvoøí rámeèek o stanovených rozmìrech se stanoveným obsahem.
V PDF verzi je rámeèek ve tvaru plného ¾lutého obdélníku na kterém
se nachází "<obsah>" zatímco v~DVI verzi se vytvoøí obrysový rámeèek.
Pozor: parametr "<obsah>" musí obsahovat pøepínaè barvy, jinak nebude v
PDF verzi viditelný. Na druhé stranì makro "\rectangle" se postará 
o návrat do \uv{normální} èerné barvy.

\inext {pdfoutput}{\empty}{+-}

Nakonec pøipravíme makro \db docbytex jako zkratku pro logo \docbytex{}u.

\inext {def\nb docbytex}{\empty}{+-}

\subsec Vzhled sekcí a podsekcí
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Makra \db printsec "{<nadpis>}" a \db printsecbelow,
jsou volána z makra pro vytvoøení sekce "\sec" a mají za úkol
vytisknout nadpis. Ostatní problematika, kterou musí øe¹it makro
"\sec" (reference do obsahu, cílové reference, èísla sekcí, plovoucí
záhlaví atd.) je zde odstínìna a nemusíme se jí v tuto chvíli zabývat.

Musíme ale dodr¾et následující úmluvu: Na zaèátku makra "\printsec"
pøejdeme pro jistotu do vertikálního módu, pak vlo¾íme potøebné
mezery, pak vlo¾íme text nadpisu. V okam¾iku, kdy pøejdeme do
horizontálního módu, vlo¾íme makro "\makelinks", které zajistí
umístìní cílù odkazù. Nakonec pøejdeme do vertikálního módu pøíkazem
"\par" a {\it nevkládáme ¾ádné dal¹í vertikální mezery}. Makro "\sec" vlo¾í pod
vyti¹tìný nadpis do horizontálního seznamu dal¹í prvky a posléze 
zavolá "\printsecbelow". Tam teprve vlo¾íme mezery obvykle blokované
proti zlomu pomocí "\nobreak". Základní øazení vertikálního seznamu 
v \TeX{}u toti¾ vypadá takto: box, (whatsit, mark, atd.), penalty, glue. 
O objekty uvedené v~závorce se postará "\sec", my zde øe¹íme jen box
(v makru "\printsec"), a dále penaltu a glue (v makru "\printsecbelow").

K dispozici máme hodnotu "\secnum" a "\subsecnum" a dále mù¾eme pou¾ít
test "\ifsavetoc", kterým se ptáme, zda daný nadpis bude v
obsahu. Nebude-li, mìli bychom místo "\the\secnum" tisknout
"\emptynumber". V makru "\seclabel" je obsah lejblíku sekce, nebo
je makro prázdné. To mù¾eme vyu¾ít pøi tisku v re¾imu \uv{nahrubo},
napøíklad tisknout tyto lejblíky do okrajù. \docbytex{} tuto
vlastnost implicitnì neimplementuje.

\ifirst {docby.tex}{def\nb printsec }{\empty}{+-}

Makra \db printsubsec a \db printsubsecbelow fungují analogicky jako právì
zmínìná, ale spolupracují s makrem "\subsec".

\inext {def\nb printsubsec }{\empty}{+-}

Makro \db printpart vytiskne nadpis èásti a dopøedu dá veliké 
písmeno. Makro \db printpartbelow tiskne mezeru pod nadpisem èásti.

\inext {def\nb printpart }{\empty}{+-}

Makro \db emptynumber, které se pou¾ije pøi "\savetocfalse", je
implicitnì nastaveno na prázdnou hodnotu.

\inext {emptynumber}{\empty}{+-}

\subsec Titul, autor
%%%%%%%%%%%%%%%%%%%%

Makro \db title "<titul>\par" ète parametr "<titul>"
pomocí makra "\secparam", které se postará o~pøípadné 
ignorování mezery na konci parametru (viz~sekci~\cite[secsec]). 
Makro "\secparam" ulo¾í parametr
"<titul>" do tokenlistu "\sectitle" a spustí interní
\db iititle. Toto makro pracuje ve dvou módech
(DVI a PDF). V~obou módech "\iititle" ulo¾í "<titul>" do makra 
"\headtitle" (pokud je toto makro prázdné, tedy neinicializované
u¾ivatelem) a pomocí pøíkazu "\noheadline" potlaèí na aktuální stránce
tisk záhlaví.

\inext {def\nb title}{\empty}{+-}

Makro "\title" v DVI verzi je prosté "\centerline", zatímco v PDF
verzi tiskne podkladový obdélník ¹íøky "\nwidth".

Pokud není makro \db projectversion definováno, nastavíme mu výchozí
hodnotu jako prázdné makro:

\inext {ifx\nb project}{\empty}{+-}

Makro \db author "<autor>\par" je spoleèné v obou módech. 
Umístí jméno autora tuènì a na støed.

\inssdef author

\subsec Hlavièky a patièky
%%%%%%%%%%%%%%%%%%%%%%%%%%

\docbytex{} nemìní výstupní rutinu plainu. Vyu¾ívá tedy klasické
nástroje na modifikaci vzhledu, tj. text "\footline" a "\headline".

Návrh vzhledu stránky nepoèítá s pravou a levou
stranou, proto¾e dokumentaci vìt¹inou èteme na monitoru a kdy¾ ji
tiskneme, tak kdo ví, na èem...

Text \db footline je nastaven tak, aby byla stránková èíslice uprostøed
podbarvena pøípadnì orámována pomocí "\rectangle".

\inext {footline}{\empty}{+-}

Text \db headline se mìní. Implicitnì obsahuje jen makro \db normalhead,
ale pøi pou¾ití pøíkazu "\noheadline" na chvíli zmìní svùj obsah.

\ilabel[headlinebox] {headlinebox}
\inext {headline}{\empty}{+-}

Makro "\normalhead" ulo¾í stránkový link pomocí "\savepglink"
a "\vbox/\hbox" gymnastikou vytvoøí potøebné záhlaví. Zleva je ti¹tìn
název sekce ("\firstmark") a zprava konstantní text "\headtitle".

Makro \db noheadline nastaví "\headline" pøechodnì na text, podle
kterého se vlo¾í jen stránkový odkaz a provede zmìna obsahu
"\headline" na standardní hodnotu. Operace musíme provádìt globálnì,
proto¾e jsme uvnitø výstupní rutiny.

\inssdef noheadline

Makro \db headtitle obsahuje text shodný v celém dokumentu ti¹tìný
vpravo v záhlaví. Implicitnì je makro prázdné, po pou¾ití pøíkazu
"\title" obsahuje název dokumentu, pokud si u¾ivatel makro nedefinoval sám.

\inext {headtitle}{\empty}{+-}

Pomocné makro \db headlinebox udìlá v DVI módu prázdný ètvereèek a
v PDF módu plný (¾lutý) ètvereèek. Je pou¾ito na øádku~\cite[headlinebox]
pro vytvoøení ètvereèkované èáry v záhlaví,

\inext {ifx\nb pdfoutput}{\empty}{+-}

\subsec Tisk cíle odkazu a odkazù pod èarou
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Cíl odkazu vytvoøený makry "\dg" nebo "\dl" je potøeba vytisknout
výraznì, aby jej ètenáø pokud mo¾no rychle na¹el. Tisk
probíhá v makru \db printdg "{<pøed>}{<slovo>}{<za>}", kde "<pøed>" je
text pøed slovem a "<za>" je prázdný parametr nebo obsahuje "()",
pokud tyto závorky u¾ivatel v pøíkaze "\dg", "\dl" pou¾il.

Souèasný návrh \docbytex{}u tiskne z tìchto tøí parametrù jen jeden,
sice "<slovo>". V DVI módu tiskne "<slovo>" v rámeèku a v PDF módu
tiskne "<slovo>" èervenì a na pozadí je ¾lutý obdélník.

\inext {ifx\nb pdfoutput}{\empty}{+-}

Èervený text se tiskne pomocným makrem \db printdginside, které tiskne
jednodu¹e èervenì, pokud ke slovu neexistuje "\api" cíl a tiskne
èervenì pomocí "\ilink", jestli¾e existuje "\api" cíl.

\inext {def\nb printdginside}{\empty}{+-}

Údaj pod èáru tiskneme makrem 
\db printfnote "{<pøed>}{<d-slovo>}{<za>}{<k-slovo>}", 
kde parametry "<pøed>" a "<za>" mají stejný význam, jako u makra "\printdg".
Parametr "<k-slovo>" (krátká verze slova) tiskneme èervenì, 
ostatní parametry èernì. Parametr "<d-slovo>" (dlouhá verze slova) není
pou¾it.

K naprogramování tohoto makra vyu¾iji makro
"\specfootnote"~"{<text>}", které po¹le text do speciální poznámky pod
èarou. Dále je potøeba vìdìt, ¾e "\pgref[+<slovo>]" vrátí èíslo
strany, kde je "\api" deklarace "<slova>" nebo vrátí $-1000$. 
Toto èíslo vlo¾íme do "\apinum" a je-li nezáporné, tak jej uvedeme
jako první v seznamu stránek a podtr¾ené. 
Seznam stránek vytiskneme pomocí
"\listofpages{<slovo>}". V seznamu bude chybìt stránka "\apinum", proto¾e
makro "\listofpages" ji vynechává. Prázdný seznam stránek (pøi kterém
netiskneme dvojteèku ani èárku) poznáme podle toho, ¾e "\box0" má
nulovou ¹íøku.

\inext {def\nb printfnote}{\empty}{+-}

\subsec Tisk údaje v obsahu a v rejstøíku
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Pøíkaz \db ptocline "{<èíslo>}{<text>}{<strana>}" se postará o tisk
údaje o sekci nebo èásti do obsahu. Dále pøíkaz \db ptocsubline
"{<èíslo>}{<text>}{<strana>}" vytiskne údaj o subsekci. Jak je patrné,
tyto dva pøíkazy se li¹í jen o jeden "\indent":

\inext {def\nb ptocline}{\empty}{+-}

Pøíkaz \db mydotfill vytiskne teèky do obsahu tak, aby byly pod sebou
zarovnány.

Pøíkaz \db ptocentry "<typ>{<slovo>}{<k-slovo>}" vytiskne jednu polo¾ku
o dokumentovaném slovì do obsahu. Parametr "<typ>=+", pokud je v daném
místì "\api" dokumentace, a "<typ>=@", je-li v daném místì "\dg"
dokumentace. "<k-slovo>" je prázdné, ale pøi pou¾ití "\dl" je v nìm
krátká verze slova, zatímco ve "<slovo>" je dlouhá verze slova.
Dlouhou verzí odkazujeme, krátkou verzi tiskneme. 

\inext {def\nb ptocentry}{\empty}{+-}

Kdyby bylo potøeba tisknout text pøed slovem nebo závorky za slovem,
je mo¾né vyu¾ít kontrolní sekvenci "\csname-<slovo>\endcsname" jako
v následujícím makru "\printindexentry".

Makro \db myldots vytvoøí tøi teèky, které jsou zarovnány s ostatními
teèkami v obsahu.

Makro \db printindexentry "{<slovo>}" tiskne údaj o slovì do
rejstøíku. Zaèíná ve vertikálním módu uvnitø sloupce, vytiskne údaj a
pomocí "\par" se musí vrátit do vertikálního módu.

\inext {def\nb printindexentry}{\empty}{+-}

Pomocí \db separeright ulo¾ím do "\tmpa" text vlevo od slova a do
"\tmpb" text vpravo od slova. Makro "\refdg" tyto údaje ulo¾ilo do
makra "\csname-<slovo>\endcsname" oddìlené od sebe znaèkou "\right".
Pomocí makra "\pgref[@<slovo>]" získám stránku s "\dg" deklarací
slova. Pomocí "\pgref[+<slovo>]" získám stránku s "\api" deklarací
slova. Tuto stránku (pokud existuje) tisknu podtr¾enì.

\subsec Tisk zdrojového textu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Makra "\ifirst" a "\inext" pøetisknou po¾adovanou èást zdrojového
textu. Pøi øe¹ení návrhu vzhledu tisku nás nyní pouze zajímá, ¾e tato
makra zalo¾í skupinu, pak zavolají pøíkaz \db printiabove, pak pro tisk
ka¾dého øádku zavolají \db printiline "{<èíslo>}{<text øádku>}" a nakonec pøed
ukonèením skupiny se spustí \db printibelow. Právì tato tøi makra si
nyní naprogramujeme. Budeme rozli¹ovat mezi DVI a PDF
módem.

\ilabel [isnameprinted]  {raise8}
\ilabel [isnameprinted2] {pt \nb inputfilename}
\inext {ifx\nb pdfoutput}{\empty}{+-}

V DVI módu tiskneme nahoøe èáru se jménem souboru pomocí "\leaders"
a makra \db specrule. Dole pak tiskneme jen jednoduchou èáru.
V~PDF módu nahoøe pouze nastavíme "\setsmallprinting" 
a vlo¾íme malou mezeru. Dole vlo¾íme støední mezeru.

Makro "\printiline" pøejde nejprve do horizontálního módu, tam vlo¾í v
DVI módu podpìru a dále box s èíslem a box s øádkem. Mezi øádky
vkládám penaltu~11. V PDF módu se místo podpìry tiskne celý ¾lutý
prou¾ek v~"\rlap". Proto¾e pøes první øádek je potøeba vpravo nahoru
vytisknout jméno souboru (pozdìji ne¾ ¾lutý prou¾ek), je potøeba
zjistit, zda tisknu první øádek nebo dal¹í øádky. K tomu slou¾í
kontrolní sekvence \db isnameprinted, která je typicky "\undefined".
Po vyti¹tìní jména souboru (øádky~\cite[isnameprinted] a~\cite[isnameprinted2]) 
nastavím "\isnameprinted" na "\relax" a tím poznám, ¾e u¾ je práce
provedena. A¾ makro "\ifirst" nebo "\inext" ukonèí skupinu, bude zase
mít "\isnameprinted" hodnotu "\undefined".

\subsec [begtt] Tisk z prostøedí {\tt\nb begtt}/{\tt\nb endtt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Makro "\begtt" zalo¾í skupinu a zavolá \db printvabove.
Dále pro ka¾dý ti¹tìný øádek volá makro \db printvline "{<èíslo>}{<text øádku>}"
a nakonec zavolá \db printvbelow. Èíslo øádku jsme se rozhodli
nevyu¾ít. V DVI verzi kreslíme jen èáry nahoøe a dole. V~PDF verzi 
kreslíme ¾luté èáry nahoøe a dole a v~ka¾dém øádku pomocí "\rlap" kreslíme 
¾luté obdélníky vpravo a vlevo.

\inext {ifx\nb pdfoutput}{\empty}{+-} 

\subsec Vkládání obrázkù
%%%%%%%%%%%%%%%%%%%%%%%%

Obrázky jsou vkládány nalevo podle odstavcové zará¾ky. Tato
zará¾ka je dostateènì velká, tak¾e to pùsobí docela dobøe.
Celkovou ¹íøku prostoru pro obrázek \db figwidth spoèítám jako
"\hsize" mínus "\parindent"

\inext {newdimen\nb figwidth}{\empty}{+-}

Makro \db ifig "<pomìr ¹íøky> <název> " v DVI módu vlo¾í "<název>.eps" a
vyu¾ije k tomu makrobalík {\tt epsf.tex}. V PDF módu vlo¾í
"<název>.pdf" a vyu¾ije k tomu pdf\TeX{}ové primitivy "\pdfximage",
"\pdfrefximage", "\pdflastximage".

\inext {ifx\nb pdfoutput}{\empty}{+-}

Makro \db figdir obsahuje adresáø, ze kterého se obrázky loví.

\subsec Výèty
%%%%%%%%%%%%%

Makra pro výèty jsou natolik jednoduchá, ¾e asi nepotøebují dal¹ího
konimentáøe. \db begitems zahájí prostøedí s výèty, \db enditems ukonèí
toto prostøedí, \db itemno èísluje a \db dbtitem "<znaèka> " zahajuje polo¾ku,
pøièem¾ se uvnitø prostøedí pøevtìlí na \db item.

\inext {newcount\nb itemno}{def\nb enditems}{++}


\sec [implementace] Pro otrlé
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Zde je dokumentována implementace \docbytex{}u. Je zde výpis 
v¹ech jeho interních maker vèetnì podrobného
komentáøe, jak fungují. Asi není rozumné tato makra mìnit, leda¾e by
si chtìl ètenáø naprogramovat \docbytex{} vlastní.

\subsec Pomocná makra
%%%%%%%%%%%%%%%%%%%%%

Makro \db dbtwarning zprostøedkuje tisk varovných hlá¹ek:

\inext {def\nb dbtwarning}{\empty}{+-}

Makra \db defsec "{<text>}", \db edefsec "{<text>}" a \db undef "{<text>}"
jsou zkratky za èasté operace s~"\csname<text>\endcsname".

\inext {def\nb defsec}{\empty}{+-}

Makro "\undef" je potøeba pou¾ít takto:

{\def\begtthook{\langleactive\mubytein=1}
\begtt
\undef{<text>}\iftrue <sekvence nedefinovaná> \else <sekvence definovaná> \fi
\endtt
\par}

Nutnost pou¾ití "\iftrue" se bohatì vyplatí, a¾ budeme "\undef" pøeskakovat
vnìj¹ími podmínkami typu~"\if".

Definuji makro \db nb (normální backslash). Toto makro je pak mo¾né
pou¾ívat pøi vyhledávání textu s tímto znakem. Rovnì¾ definuji aktivní
tabelátor a zástupné sekvence \db obrace, \db cbrace, \db percent
a \db inchquote.

{\catcode`\%=12 \noactive{\nb %} \noactive{[%} }

\inext {catcode}{\empty}{+-}

Makro \db softinput je vysvìtleno v \TeX{}booku naruby na stranì 288,
tak¾e bez komentáøe.

\inext {def\nb softinput}{\empty}{+-}

Makro \db setverb nastaví kategorie v¹ech speciálních znakù na
normální. Viz \TeX{}book naruby, stranu~28. 

\inext {def\nb setverb}{\empty}{+-}

\subsec Inicializace
%%%%%%%%%%%%%%%%%%%%

Ohlásíme se na terminál:

\inext {This is DocBy}{\empty}{+-}

Makro \db dbtversion obsahuje verzi \docbytex{}u a je definováno 
na zaèátku souboru {\tt docby.tex}. Tam je autor \docbytex{}u pozmìní, 
pokud pøejde na novou verzi.

\inssdef dbtversion

Je-li pou¾it "csplain", je aktivován UTF-8 vstup pomocí enc\TeX{}u. To 
ale bohu¾el není kompatibilní s pou¾itím enc\TeX{}u \docbytex{}em.
Je tedy potøeba deaktivovat UTF-8 vstup a èeské texty napsat napøíklad
v ISO-8859-2.

\inext {utf8off}{\empty}{+-}

%Inicializujeme csplain mód:
%
%\inext {ifx\nb chyph\nb undefined \nb else}{\empty}{+-}

Inicializujeme enc\TeX{}ový mód:

\inext {encTeX ??}{\empty}{+-}

Makro \db enctextable "{<slovo>}{<tìlo makra>}" vlo¾í do enc\TeX{}ové
tabulky vzor "<slovo>". Jakmile takový vzor enc\TeX{}
objeví, zru¹í jej ze vstupního proudu a promìní jej v kontrolní
sekvenci "\.<slovo>", která expanduje na "<tìlo makra>". 
Napøíklad makro "\dg"~"<slovo>" aktivuje pro enc\TeX{} "<slovo>", tak¾e
provede (mimo jiné) 
"\enctextable{<slovo>}{\sword{<slovo>}}", co¾ zpùsobí,
¾e se "<slovo>" v naèítaném zdrojovém kódu promìní na "\sword{<slovo>}".

Makro "\enctextable" odmítá ulo¾it do enc\TeX{}ové tabulky slova,
která jsou v seznamu \uv{zakázaných} slov \db owordbuffer. Tam jsou
slova (oddìlená z obou stran èárkou), která se nesmìjí aktivovat kvùli 
"\onlyactive". Pro taková slova provede "\enctextable" jen definici
sekvence "\.<slovo>".

Makro \db noactive "{<text>}" vlo¾í do enc\TeX{}ové tabulky vyhledávaný 
text, který ve vstupu zùstane a pøed nìj bude vlo¾ena sekvence \db emptysec.
Proto¾e enc\TeX{} neumí ze své tabulky zru¹it údaj (umí jen pøepsat
informaci, na co se má vyhledávaný text promìnit), je potøeba texty,
které u¾ v encTeXové tabulce nepotøebujeme, deaktivovat alespoò pomocí 
"\noactive".

Na \db sword "{<text>}" se díky enc\TeX{}u promìòují texty, které se mají
automaticky stát klikatelnými linky. 

\inext {def\nb sword}{\empty}{+-}

Makro \db onlyactive "{<pøed>}{<slovo>}{<za>}" zaká¾e vkládat
"<slovo>" do enc\TeX{}ové tabulky (vlo¾í je do "\owordbuffer", 
ov¹em jen za pøedpokladu, ¾e u¾ tam není),
a nechá celý text "<pøed><slovo><za>" promìnit v~"\oword{#1}{#2}{#3}".
Dále pomocí "\noactive" dekativuje "<slovo>" (pøi ètení "\reffile" 
toti¾ pravdìpodobnì bylo aktivováno).
Makro \db oword "{<pøed>}{<slovo>}{<za>}"
tiskne normálnì "<pøed>", dále, pokud je definováno "\.<slovo>", tak
je spustí, jinak tiskne normálnì "<slovo>". Koneènì tiskne v¾dy
normálnì text "<za>".

\inext {def\nb onlyactive}{\empty}{+-}

Nakonec inicializujeme DVI/PDF mód:

\inext {ifx\nb pdfoutput}{\empty}{+-}

\subsec Makra {\tt\nb ifirst}, {\tt\nb inext}, {\tt\nb ilabel}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Deklarujeme \db lineno jako èíslo øádku, \db ttlineno jako èíslo øádku
pro "\begtt...\endtt" výpisy, \db ifcontinue pro øízení cyklu a 
\db infile je deskriptor souboru otevøeného ke ètení.
\db ifskipping implementuje u¾ivatelské \db skippingfalse a 
\db skippingtrue.

\inext {newcount\nb lineno}{\empty}{+-}

%Makra "\ifirst", "\inext" jsou pro u¾ivatele popsána
%v~sekci~\cite[vkladani] a makro "\ilabel" má své povídání 
%v~sekci~\cite[lineodkazy].

Pøíkaz \db ifirst "{<soubor>}{<odkud>}{<kam>}{<jak>}" nejprve
pomocí "\readiparamwhy" analyzuje parametr "<jak>", pak otevøe soubor
ke ètení primitivem "\openin". Je-li otevøení neúspì¹né, vypí¹e
varování, jinak si ulo¾í název souboru do makra \db inputfilename 
a analyzuje parametry pomocí "\scaniparam": "<odkud>" je ulo¾eno do
"\tmpa" a "<kam>" do "\tmpb". Do "\tmpA" a "\tmbB" se ulo¾í poèet
opakování (z konstruktoru "\count=<num>"). Nakonec se spustí makro 
"\insinternal" s expandovanými parametry "<odkud>", "<kam>".
K tomu je pou¾it známý trik s makrem "\act".

\insdef ifirst 

Pøíkaz \db inext "{<odkud>}{<kam>}{<jak>}" pracuje analogicky, jako
"\ifirst", pouze neotevírá soubor, ale pomocí testu na definovanost
makra "\inputfilename" kontroluje, zda náhodou nebyl  spu¹tìn pøíkaz
"\inext" bez pøedchozího "\ifirst".

\insdef inext

V rámci expanze parametrù chceme, aby zmizely v¹echny kontrolní sekvence, které
nám do textu vlo¾il automaticky enc\TeX{}. To provede makro
\db noswords.

\inssdef noswords

Makro \db readiparamwhy naète znaky "+" nebo "-" z parametru "<jak>" a
ulo¾í je do sekvencí \db startline a \db stopline.

\inssdef readiparamwhy

Makro \db scaniparam "<param>^^X<out><outnum>" ète "<param>" 
ve tvaru "\count=<num> <text>". Do sekvence "<out>" ulo¾í "<text>"
a do sekvence "<outnum>" ulo¾í "<num>". Proto¾e konstruktor
"\count=<num>" je nepovinný, dá trochu více práce parametr analyzovat.
K tomu slou¾í i pomocná makra \db scaniparamA, \db scaniparamB, \db scaniparamC.
V pøípadì nepøítomnosti "\count=<num>" je v~"<outnum>" jednièka.

\inssdef scaniparam

Hlavní práci pøi vkládání zdrojového textu do dokumentace dìlá makro
\db insinternal s parametry "{<odkud>}{<kam>}".

\ilabel [prvniloop]       {preskakovani}
\ilabel [konec:prvniloop] {ifcontinue \nb repeat}
\ilabel [druhyloop]       {pretisk}
\ilabel [konec:druhyloop] {readnewline \nb repeat}
\ilabel [insinternal:end] {printibelow}
\insdef insinternal

Makro "\insinternal" se skládá ze dvou hlavních cyklù. První (na
øádcích~\cite[prvniloop] a¾~\cite[konec:prvniloop]) ète postupnì 
øádky ze vstupního souboru (makrem
"\readnewline") a ulo¾í je do makra "\etext". V tomto cyklu hledá
výskyt textu "<odkud>" a nic netiskne.

Druhý cyklus na øádku~\cite[druhyloop] a¾~\cite[konec:druhyloop] 
ète postupnì øádky ze vstupního
souboru a hledá výskyt textu "<kam>". V této chvíli tiskne pomocí
makra "\printilineA".

Pøed prvním cyklem jsou provedeny pøípravné práce: nastavení
kategorií, fontù, "\mubytein".
Dále je v pøípravné fázi definováno makro \db testline se separátorem
"<odkud>", pomocí nìho¾ budeme testovat pøítomnost textu "<odkud>".
Variantní definice makra "\testline" následují pro speciální pøípad
parametru "<odkud>" (viz u¾ivatelská dokumentace v~sekci~\cite[vkladani]).
Ukonèení cyklu je øízeno podmínkou "\ifcontinue". Pøíkaz \db nocontinue
provede "\continuefalse", ov¹em ne v¾dy. Pokud je zadáno "\count>1", tj. 
"\tempnum>1", pak pøíkaz pouze zaznamená výskyt hledaného textu a sní¾í 
"\tempnum" o jednièku.

\inssdef nocontinue

Pøed druhým cyklem v makru "\insinternal" jsou provedeny podobné pøípravné 
práce jako pøed
prvním, znovu je definováno makro "\testline", tentokrát se separátorem 
"<kam>". Vyhledávání probíhá podobnì, jako kdy¾ jsme hledali "<odkud>".

Pomocí "\ifx+\startline" testujeme, zda tisknout výchozí øádek.
Pomocí "\ifx+\stopline" testujeme, zda tisknout ukonèovací øádek.

Makro "\ilabellist" obsahuje testování pøítomnosti lejblíkù
deklarovaných pøíkazem "\ilabel".

Trikoidní je makro \db returninsinternal "{<text>}{<mo¾ná fi>}{<ignoruj>}",
které se spustí pøi dosa¾ení konce èteného souboru. Marko opustí svùj
cyklus pomocí parametru "<ignoruj>", který je separován textem
"\printibelow", tak¾e to pøeskoèí vìt¹í èást obsahu makra "\insinternal" a¾
po øádek~\cite[insinternal:end]. Abychom správnì opustili vnoøené
podmínky, jsou pøeètena v druhém parametru pøípadná "\fi" a v makru pou¾ita.
První parametr obsahuje varovací hlá¹ku, chceme-li vypsat varování.
Chceme-li být zticha, je parametr prázdný.

\insdef returninsinternal

Makro \db readnewline je naproti tomu jednoduché:

\inssdef readnewline

Pracujeme s øádkem èteného souboru ve dvou verzích: neexpandovaným
\db text a expandovaným \db etext pøi "\noswords". Tím máme zaruèeno,
¾e v "\etext" nejsou kontrolní sekvence vytvoøené enc\TeX{}em (pro
test pøítomnosti "<odkud>" nebo "<kam>" by tam ty sekvence pøeká¾ely). 
Verze s enc\TeX{}ovými sekvencemi "\text" se pou¾ije pøi tisku.

Makro \db printilineA musí mít svou inteligenci: nesmí bezhlavì tisknout
prázdné øádky, ale ty tiskne a¾ se zpo¾dìním, následuje-li tisk
neprázdného øádku. Tím je zaruèeno, ¾e se pøi "\skippingtrue" nevytiskne poslední
prázdný øádek. Makro \db lastline má tøi stavy: "\empty" (na zaèátku), 
"\relax" (po vyti¹tìní øádku), "<èíslo øádku>" (je-li pøedchozí øádek 
prázdný).

\insdef printilineA

Pro ulo¾ení deklarací pomocí \db ilabel "[<lejblík>]{<text>}"
slou¾í makro \db ilabellist, které musíme nastavit nejprve na prázdnou
hodnotu. 

\insdef ilabellist

Makro "\ilabel" nejprve expanduje své parametry (pomocí
"\act") a zavolá interní \db ilabelee. Toto makro pøidá do
"\ilabellist" toto: 

\def\begtthook{\langleactive\mubytein=1}
\begtt
\expandafter\testilabel\etext\end{<lejblík>}{<text>}
\endtt

Makro \db testilabel "<øádek>\end{<lejblík>}{<text>}"
si definuje pomocné makro "\tmp" se separátorem "<text>", aby
zjistilo, zda je "<text>" uvnitø "<øádek>". Pokud se to povede, 
registruje cíl odkazu pomocí "\labeltext".

\inext {testilabel}{\empty}{+-}
 
\def\begtthook{}

\subsec Pøíkazy {\tt\nb begtt}, {\tt\nb endtt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Makro \db begtt a "\endtt" 
je podrobnì popsáno v \TeX{}booku naruby
na stranách~27 a¾~30.  Makru \db startverb dodáme kompletní
verbatim text separovaný "\endtt". 
Tento text je dìlený znakem "^^M" (kategorie 12) na øádky a koncový øádek
obsahuje token "\end". Makro spustí ve spolupráci s makrem \db runttloop
cyklus a øádky rozebere, ka¾dý øádek zvlá¹» pøedá makru "\printvline".
Na konci cyklu se provede makro \db endttloop. To udìlá závìreèné
èinnosti (zavolá "\printvbelow", ukonèí skupinu) a pomocí makra
\db scannexttoken otestuje první následující
token. Pokud to není "\par", není pod "\endtt" prázdný øádek, 
tak¾e se provede "\noindent".

\ifirst {docby.tex}{def\nb begtt }{\empty}{+-}

V numerickém registru "\ttlineno" je èíslo øádku prùbì¾nì zvìt¹ované
v celém dokumentu. Pokud by nìkdo chtìl toto èíslo vyu¾ít, mù¾e jej
nulovat napøíklad na zaèátku ka¾dé sekce.

\subsec [ns] Jmenné prostory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ka¾dý jmenný prostor si udr¾uje své \db namespacemacro, co¾ je makro 
s jedním parametrem, které pøíkazem "\namespace{<tìlo makra>}" mimodìk
definuje u¾ivatel. Na poèátku je "\namespacemacro" prázdné:

\ifirst {docby.tex}{def\nb namespacemacro}{\empty}{+-}

Ke ka¾dému jmennému prostoru budeme chtít pøiøadit lejblík. Rozhodl
jsem se za lejblík pova¾ovat výsledek expanze "\namespacemacro{@!}".
Budu jej nadále znaèit "<nslejblík>".
Existuje sice urèité riziko nejednoznaènosti "<nslejblíku>", ale 
pøedpokládám, ¾e v praxi nenastane.

Ka¾dý jmenný prostor u¾ na poèátku musí vìdìt, jaká v¹echna lokální
slova obsahuje, aby jejich výskyt mohl smìøovat na místo, kde je
deklarace "\dl", která mù¾e být tøeba pozdìji ne¾ výskyt.  Jmenný
prostor na svém startu musí tedy do enc\TeX{}ových tabulek ulo¾it
v¹echna lokální slova a na svém konci vrátit v¹e pokud mo¾no do
pùvodního stavu.  Je tedy zøejmé, ¾e není vhodné èekat a¾ na pøíkaz
"\dl", ale ¾e je tøeba vyu¾ít soubor "\reffile". V prvním prùchodu
tedy jmenné prostory nemohou být aktivní.

Po pøeètení "\reffile" má ka¾dý jmenný prostor k dispozici makro
"\ns:<nslejblík>", které obsahuje seznam v¹ech svých 
lokálnì deklarovaných slov ve formátu 

{\def\begtthook{\mubytein=1\langleactive}
\begtt
\locword{<slovo1>}\locword{<slovo2>}\locword{<slovo3>}...
\endtt
\par}

Proto¾e ukládání do enc\TeX{}ové tabulky je globální, definujeme 
v rámci du¹evní hygieny v¹echna makra s tím spojená globálnì. Proto je
prostøedí "\namespace...\endnamespace" nezávislé na skupinách \TeX{}u.

Pøi startu \db namespace je tøeba definovat "\namespacemacro". 
Pùvodní hodnotu "\namespacemacro" ulo¾íme do "\no:<nslejblík>",
abychom se k nìmu mohli na konci prostøedí
"\namespace...\endnamespace" vrátit. Dále definujeme makro \db locword
tak, aby ulo¾ilo potøebné údaje do enc\TeX{}ové tabulky a pøed tím
je¹tì si ulo¾ilo stávající významy pøedefinovávaných kontrolních
sekvencí. Pak se prostì spustí "\ns:<nslejblík>". 

\inext {def\nb namespace }{^^B\cbrace}{++}

Na konci \db endnamespace znovu definujeme makro "\locword" tentokrát tak, aby
vrátilo pozmìnìným sekvencím pùvodní význam. Pokud pùvodní význam byl
\uv{nedefinovaná sekvence}, je potøeba do enc\TeX{}ové tabulky vlo¾it
aspoò "\nword", proto¾e zcela odstranit údaj z tabulky nelze. 
Dále se vrátíme k~pùvodní hodnotì "\namespacemacro", kterou máme
ulo¾enu v "\no:<nslejblík>".

\inext {def\nb endnamespace}{^^B\cbrace}{++}

Uvedená makra pracují s u¾iteènou zkratkou \db ewrite, která zapí¹e
text do "\reffile" se zpo¾dìním (primitivem "\write"), ale expanzi 
udìlá hned. Pøitom neexpanduje "\nb".

\inext {def\nb ewrite}{\empty}{+-}

Enc\TeX{} od startu jmenného prostoru vkládá tedy místo ka¾dého
lokálního "<slova>" kontrolní sekvenci "\.<slovo>", která expanduje
na "\lword{<slovo>}". Jakmile se tedy objeví výskyt lokálního slova,
pracuje \db lword takto:

\inext {def\nb lword}{\empty}{+-}

Makro \db genlongword "<tmp>{<slovo>}" 
vytvoøí z krátké verze slova dlouhou verzi slova a ulo¾í ji do "<tmp>".
Výskyt "<slova>" dává o sobì vìdìt v parametru "\ilink" i pøi zápisu
do souboru svým dlouhým (jednoznaèným) jménem, zatímco krátké jméno 
se tiskne.

Zbývá zaøídit ètení ze souboru "\reffile". Makro 
\db refns "{<nslejblík>}" se objeví v souboru v místì zaèátku jmenného
prostoru a \db refnsend "{<nslejblík>}" na konci jmenného prostoru. Mezi
nimi se vyskytují "\refdg{<pøed>}{<slovo>}{<za>}{<k-slovo>}", pøièem¾
si nyní v¹ímáme jen takových výskytù, které mají neprázdné
"<k-slovo>". Právì tyto výskyty zanesl do "\reffile" pøíkaz "\dl".

\inext {def\nb refns}{\empty}{+-}

Makro "\refns" si zapamatuje pøedchozí "<nslejblík>", který je ulo¾en 
v makru \db currns, do sekvence "\o:<nový nslejblík>" a definuje pak "\currns"
jako "<nový nslejblík>". Pøipraví také výchozí stav makra "\ns:<nslejblík>"
na prázdnou hodnotu. Makro "\refdg" pak postupnì plní buffer
"\ns:<nslejblík>" (viz øádky~\cite[ns1] a¾~\cite[ns2] v~definici makra
"\refdg" v~sekci~\cite[reference]). Koneènì makro "\refnsend" vrátí
"\currns" do stavu, v jakém bylo pøed vstupem do stávajícího jmenného 
prostoru. 


\subsec {\tt\nb dg} a pøátelé
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Makra \db dg, \db dl, \db dgn, \db dgh, \db dln, \db dlh 
ulo¾í do "\tmpA" svùj název, spustí sken parametrù pomocí \db dgpar
a nakonec se promìní ve svou interní verzi pomocí
"\csname ii\tmpA\endcsname".

\inext {def\nb dg}{\count=2 \empty}{+-}

Pøedchozí makra pøipraví ètení nepovinného parametru. Hlavní práci
provede makro \db dparam.

\ilabel [managebrackets] {managebrackets}
\ilabel [ii] {csname ii}
\inext {def\nb dparam}{\empty}{+-}

Je-li za ukonèovací závorkou "]" mezera, pak je parametr "#2" prázdný (je
separovaný mezerou). V~této situaci se makro "\dparam" protoèí je¹tì
jednou prostøednictvím makra \db nextdparam, které se¾ere obsah zbytku
makra "\dparam", vlo¾í mezeru dovnitø závorky a spustí "\dparam" je¹tì
jednou. Nyní u¾ je mo¾né zaèít parametr "#2", tj. "<slovo>" rozdìlit
na èást pøed první èárkou, teèkou, støedníkem nebo dvojteèkou a za za
tímto znakem. Èást pøed bude v "\tmpa" a èást za (vèetnì separátoru)
bude v "\tmpb". Tuto práci vykoná postupné volání makra \db varparam:

\inext {def\nb varparam}{\empty}{+-}

Makro "\varparam<separ>" definuje pomocné makro "\tmp#1<separ>#2 ", kterému
je pøedlo¾eno "<slovo><separ> ". Je-li "#2" prázdné, pak zabral a¾
"<separ>" na konci, tak¾e uvnitø "<slova>" není "<separ>". Pak v
"\tmpa" zùstává "<slovo>". Je-li uvnitø "<slova>" separátor, pak je
potøeba doplnit k "\tmpb" zbytek za separátorem vèetnì tohoto
separátoru. V "#2" máme "<zbytek><separ>" a my potøebujeme do "\tmpb"
ulo¾it stávající obsah "\tmpb" pøed kterým pøedchází "<separ><zbytek>".
Tuto práci udìlá \db gobblelast, kterému je pøedlo¾en
"<obsah tmpb>\end<separ><zbytek><separ>". Makro definuje 
"\tmp#1<separ>" a pøedlo¾í mu "<zbytek><separ>". Je tedy v "#1" holý
"<zbytek>" a do "\tmpb" se dostává "<separ><zbytek><starý obsah tmpb>". 

Po rozdìlení vyhledání separátoru máme n "\tmpa" <slovo>, ov¹em mù¾e
obsahovat na konci "()". Proto spustíme na øádku~\cite[managebrackets]
makro \db managebrackets, které se postará o pøípadné oddìlení tìchto
závorek.  Pokud se závorky skuteènì oddìlily od "\tmpa", zùstávají
v~\db printbrackets.

\inext {def\nb managebrackets}{\empty}{+-}

Makro \db maybespace v závìru èinnosti makra "\dparam" vytiskne za
obsahem "\tmpb" mezeru, ale jen tehdy, kdy¾ je jméno makra
dvoupísmenkové ("\dg", "\dl") a nenásleduje znak "`".

\inext {def\nb maybespace}{\empty}{+-}

Na øádku~\cite[ii] vytvoøí makro "\dparam" z pùvodního pøíkazu
"\dg*" resp. "\dl*" jeho interní verzi "\iidg*" resp. "\iidl*".
Parametry pøedá expandovány, aby s nimi bylo ménì práce.
Staèí tedy naprogramovat uvedená interní makra.

Makro \db iidg vlo¾í do enc\TeX{}ové tabulky "\sword" (je to mírnì
nadbyteèné, toté¾ se provede na zaèátku zpracování pøi ètení
"\reffile" pøíkazem "\refdg"). Dále makro vytvoøí cíl
odkazu tvaru "@<slovo>", ulo¾í informaci do "\reffile"
ve formátu "\refdg{<pøed>}{<slovo>}{<za>}{}",
vytiskne "<slovo>" zvýraznìné pomocí "\printdg" a vlo¾í poznámku pod
èáru pomocí "\printfnote".

\inext {def\nb iidg }{^^B\cbrace}{++}

Makro \db iidl nevkládá nic do enc\TeX{}ové tabulky, 
vytvoøí cíl pomocí "\label [@<dlouhé slovo>]", zapí¹e info do
"\reffile" ve formátu "\refdg{<pøed>}{<d-slovo>}{<za>}{<k-slovo>}",
vytiskne "<k-slovo>" zvýraznìné pomocí "\printdg" a vlo¾í poznámku
pomocí "\printfnote{<pøed>}{<d-slovo>}{<za>}".

\inext {def\nb iidl }{^^B\cbrace}{++}

Makra \db iidgh a \db iidlh dìlají to samé jako jejich non-"h"
protìj¹ky, jen netisknou slovo v místì výskytu. Lokálnì tedy
pøedefinujeme, aby "\printdg" nedìlalo nic.

\inext {def\nb iidgh}{\empty}{+-}

Makro \db iidgn pøedefinuje makro "\.<slovo>", které vyrábí enc\TeX,
tak, ¾e výsledkem expanze je "\fword{<pøed>}{<slovo>}{<za>}" 
(namísto obvyklého "\sword{<slovo>}").

\inext {def\nb iidgn}{\empty}{+-}

A¾ se \db fword spustí (pøi prvním následujícím výskytu "<slova>"), má
za úkol provést "\iidgh", vytisknout "<slovo>" èervenì a vrátit 
"\.<slovo>" do pùvodního stavu. 

\inext {def\nb fword}{\empty}{+-}

Makro \db iidln si ulo¾í stávající význam "\.<slovo>" do 
sekvence "\;<slovo>" a pøedefinuje makro "\.<slovo>", 
které vyrábí enc\TeX, tak, ¾e výsledkem je 
"\flword{<pøed>}{<slovo>}{<za>}".

\inext {def\nb iidln}{\empty}{+-}

Makro \db flword má za úkol provést "\iidlh", vytisknout "<slovo>"
èervenì a vrátit význam makra "\.<slovo>" do pùvodního stavu (který je ulo¾en
v sekvenci "\;<slovo>". Byl-li tento pùvodní význam nedefinován, je
potøeba potlaèit dal¹í èinnost makra "\.<slovo>" registrováním jako
"\nword{<slovo>}", proto¾e z enc\TeX{}ové tabulky u¾ záznam nelze
odebrat.  

\inext {def\nb flword}{\empty}{+-}

\subsec [specfootnote] Speciální poznámky pod èarou
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Poznámky pod èarou jsou øazeny vedle sebe a obsahují jen slova, která
mají na stránce své "\dg". Proto¾e toto øe¹ení je vizuálnì
nekompatibilní s u¾ivatelskými poznámkami pod èarou, jednodu¹e je
zaká¾eme:

\inext {let\nb footnote=}{\empty}{+-}

Pro speciální poznámky pod èarou vyu¾iji u¾ deklarovaný insert
"\footins". Problém je, jak odhadnout, kolik zabere vertikálního místa
v poznámkách jedno slovo, kdy¾ jich mù¾e být vedle sebe
více. Dirty trick z \TeX{}booku (vkládat inserty ve vý¹ce rovné jistému
procentu své ¹íøky) se neujal, nebo» zlom èasto nekonvergoval, ale osciloval.
V druhém prùchodu poznámky teprve dostávají své seznamy stránek a tyto
seznamy se pak mohou dále upøesòovat, co¾ zpìtnì ovlivní vertikální
sazbu. Po její zmìnì se mìní seznamy stránek a tak poøád dokola.

Rozhodl jsem se tedy pracovat pouze s prùmìrným koeficientem
poznámek, který budou mít v¹echny poznámky spoleèný. Tento koeficient 
získám jako celkový poèet øádkù poznámek v celém dokumentu dìlený
poètem poznámek. Ka¾dá poznámka pak \uv{pøeká¾í} v hlavním vertikálním
seznamu vý¹kou øádku poznámek (10pt) násobenou tímto koeficientem.
Staèí tedy nastavit "\count\footins".

Aby problém urèitì konvergoval, bylo nutné fixovat vý¹e uvedený
koeficient po druhém prùchodu. Kdybych jej ka¾dý následující prùchod
mìnil, zase se nedoèkáme konvergence. Získat uvedený koeficient hned
po prvním prùchodu není rozumné, proto¾e v té dobì poznámky je¹tì
nemají vedle sebe seznamy stránek. Výchozí koeficient pro první a
druhý prùchod je tedy nastaven na "\count\footins=200" (pøedpokládám
zhruba pìt poznámek na øádku).

Pracovat s prùmìrem místo s ka¾dou jednotlivou poznámkou mù¾e
samozøejmì zpùsobit, ¾e nìkteré stránky jsou plnìj¹í a nìkteré
prázdnìj¹í. Proto je potøeba mít rezervu ve "\skip\footins" a
vertikálnì pru¾it kolem poznámkové èáry.

\inext {skip\nb footins}{\empty}{+-}

V registru \db totalfoocount se bude postupnì pøièítat jednièka za ka¾dou
poznámku a na konci zpracování tam tedy je celkový poèet poznámek.
V registru \db totalfoodim bude na konci zpracování celková vý¹ka 
v¹ech øádkù s poznámkami. 

\inext {newcount\nb totalfoocount}{\empty}{+-}

Makro \db specfootnote "{<text>}" 
vlo¾í do insertu "\footins" jediný "\hbox{<text>}" a pøipoète
jednièku do "\totalfoocount".

\inext {def\nb specfootnote}{\empty}{+-} 

Proto¾e jsem se rozhodl nemìnit výstupní rutinu plainu, musel jsem se
\uv{nabourat} aspoò do její èásti na tisk poznámek pod èarou. Je to
provedeno pøedefinováním makra "\footnoterule" výstupní rutiny plainu.
Separátor "\unvbox\footins" zpùsobí odstranìní stejného textu 
z output rutiny plainu.

\inext {def\nb footnoterule}{\empty}{+-}

Makro rozebere vertikální seznam insertù "\footins" a poskládá je
vedle sebe do boxu~4. Pak nastaví parametry sazby na praporek a
vypustí box~4 do horizontálního seznamu ("\noindent") ukonèeném
"\endgraf". Tím jsou ve výstupní rutinì poznámky pod èarou vysázeny.
Nakonec pøipoèteme "\totalfoodim".

V závìru zpracování v makru "\bye" (viz øádek~\cite[write]) zapí¹eme
do souboru "\reffile" informaci o~poètu poznámek "<poèet>", o celkové
vý¹ce øádkù poznámek v dokumentu "<vý¹ka>" a pøidáme aktuální
koeficient pøíspìvku poznámek do vertikálního seznamu "<koeficient>".
Informaci zapisujeme jen tehdy, kdy¾ je "\indexbuffer" neprázdný,
tj. kdy¾ probíhá aspoò druhý prùchod. Kdybychom zapisovali i první
prùchod, dostali bychom velmi zkreslené informace (poznámky v~tu
chvíli nemají vedle sebe seznamy stránek).
%
Uvedenou informaci zapsanou v pøedchozím prùchodu 
pøeèteme na zaèátku zpracování makrem
\db refcoef "{<koeficient>}{<poèet>}{<vý¹ka>}" a 
nastavíme podle toho spoleèný koeficient v¹ech poznámek
"\count\footins". Makro zmìní koeficient z výchozí 
hodnoty 200 na vypoètenou jen jednou. Pøi dal¹ích prùchodech u¾
zùstává u vypoètené hodnoty.
Pomocné makro \db gobblerest odstraní cifry za desetinou
teèkou vèetnì nápisu~"pt".

\inext {def\nb refcoef}{\empty}{+-}

Výstupní rutina "\plainoutput" není zmìnìna. Potøebuji ale uvnitø
"\output" potlaèit expanzi nìkterých maker, které se objeví v argumentu
"\write". Tato makra jsou tedy uvnitø "\output" nastavena na "\relax".
Aby toto nastavení nezmìnilo sazbu záhlaví, je potøeba "\makeheadline" 
provést pøed zmìnou maker a ulo¾it si výsledek do boxu.

\inext {\nb output=}{\empty}{+-}

\subsec [secsec] Sekce, podsekce
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Nejprve zapí¹eme deklarace \db secnum, \db subsecnum, 
\db sectitle, \db ifsavetoc. Poslední deklarace pøipraví
u¾ivatelské \db savetocfalse.

\ifirst {docby.tex}{newcount\nb secnum}{\empty}{+-}

Makra \db sec a \db subsec mají mo¾nost nepovinného parametru
"[<lejblík>]", za ním mù¾e a nemusí být mezera, kterou musíme ignorovat. 
Na konci parametru "<titul>" pøed "\par" rovnì¾ mù¾e a nemusí být
mezera, kterou musíme ignorovat. Dá tedy práci parametry správnì
naèíst. Makra si ulo¾í svùj název do "\tmpA" a spustí proces naèítání
parametrù pomocí "\secparam".

\inext {def\nb sec}{\empty}{+-}

Makro \db secparam se vypoøádá s pøípadným nepovinným parametrem
"[<lejblík>]". Pokud je pøítomen, ulo¾í "<lejblík>" do pomocného makra
\db seclabel, jinak tam je prázdno. Makro \db secparamA se vypoøádává
s pøípadnou mezerou za hranatou závorkou "]" a odstraní ji.
Makro \db secparamB "<titul>\par" naète "<titul>", ale ten mù¾e mít
ne¾ádoucí mezeru zcela na konci. S tím se vypoøádá makro 
\db nolastspace ve spolupráci s makrem \db setparamC. Poslednì jmenované
makro ulo¾í u¾ od ne¾ádoucí mezery o¹etøený "<titul>" do "\sectitle" a
spustí "\iisec" resp. "\iisubsec".

\inext {def\nb secparam}{\empty}{+-}

Makro \db iisec nejprve nastaví hodnoty "\secnum" a "\subsecnum",
dále definuje \db makelinks, kde je pøipravena tvorba odkazù (to
pou¾ije makro "\printsec").
Dále zavolá "\printsec" na vyti¹tìní názvu sekce.
Poté ulo¾í informace do "\reffile" ve tvaru
"\reftocline"~"{<secnum>}{<titul>}{<strana>}" 
Nakonec se provede "\mark{<secnum> <titul>}" a 
vlo¾í se závìreèná mezera pomocí "\printsecbelow".

\inext {def\nb iisec}{^^B\cbrace}{++}

Makro \db iisubsec, které vytváøí podsekci, pracuje analogicky, jako
makro "\iisec".

\inext {def\nb iisubsec}{^^B\cbrace}{++}

Makro "\part" bylo zapracováno dodateènì ve verzi Jan. 2009. 
Registr \db partnum uchovává èíslo èásti a makro \db thepart
toto èíslo konvertuje na písmeno.

\inext {newcount\nb partnum}{\empty}{+-}

Makro \db part má svou implementaci v makru \db iipart
podobnì jako napøíklad makro "\sec".

\inext {def\nb part}{\empty}{+-}

\subsec [reference] Odkazy, reference
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Klikací odkazy øe¹í makra \db savelink "[<lejblík>]" a a \db ilink
"[<lejblík>]{<text>}". Makro "\savelink" ulo¾í do sazby cíl
odkazu. Cíl odkazu vystrèí do
vý¹ky \db linkskip nad úèaøí. Makro "\ilink" (èti interní link) je
dokumentováno v~sekci~\cite[krizodkaz]. Koneènì makro "\savepglink"
ulo¾í cíl numerického typu (èíslo stránky), který bude vyu¾it makrem
"\pglink" pøi odkazech na stránky.

\ifirst {docby.tex}{Odkazy, ref}{\empty}{--}

Uvedená makra jsem definoval zvlá¹» pro DVI výstup (jako prázdná
makra) a zvlá¹» pro PDF výstup. A¾ zase tvùrci pdf\TeX{}u zmìní
syntaxi nebo názvy primitivù, bude staèit pozmìnit uvedená makra.
V makru "\ilink" je pøímo øeèeno, ¾e se má pou¾ít modrá barva pro
vytvoøení odkazù a ¾e odkaz má být bez rámeèku. Pokud to nìkomu
nevyhovuje, mù¾e si makro pøedefinovat.

Trik s pøedefinováním "\nb" (normální backslash) pøi tvorbì PDF linkù
vychází ze zku¹enosti, ¾e pokud se v názvu linku objeví backslash,
nìkteré PDF prohlí¾eèe si s tím neporadí a chovají se podivnì. Je tedy
nutné, aby argument pøíkazù "\savelink" a "\ilink" byl neexpandovaný.

Makro \db savepglink (definice je v pøedchozím výpisu) je pou¾ito v
"\headline" ka¾dé stránky, tak¾e vytvoøí cíl \uv{nahoøe} na ka¾dé
stránce. Makro \db pglink "<number>" pøeète "<number>" (mù¾e být ve
tvaru numerického registru i pøímo jako èíslo) a vytvoøí link na
stránku s tímto èíslem. Èíslo samotné je vyti¹tìno modøe a dá se na nì
kliknout. Ke ètení numerického registru je pou¾it primitiv "\afterassignment"
a pomocné makro \db dopglink.

V souboru "\jobname.ref" se prostøednictvím makra
"\labeltext[<lejblík>]{<text>}" ulo¾í øádek, který obsahuje
"\reflabel"~"{<lejblík>}{<text>}{<strana>}".  Makrem \db reflabel tyto
údaje pøeètu a zapí¹u do kontrolních sekvencí "^^X<lejblík>" a
"^^Y<lejblík>". Tyto kontrolní sekvence jsou následnì vyu¾ity
v~makrech \db numref a \db pgref.  
Za pov¹imnutí stojí, ¾e pokud je "<text>" prázdný
(to jsou napøíklad v¹echny pøípady dokumentovaných slov), pak
kontrolní sekvenci "^^X<lejblík>" vùbec nedefinuji, abych ¹etøil
pamìtí, kterou má \TeX{} rezervovánu na kontrolní sekvence.

\inext {reflabel}{\empty}{+-}

Makro \db labeltext "[<lejblík>]{<text>}", jak bylo pøed chvílí
øeèeno, ulo¾í do souboru potøebné údaje. Jednak zapí¹e PDF link pomocí
makra "\savelink" a dále ulo¾í do souboru "\reffile" potøebné údaje.
K tomu je makro \db writelabel "[<lejblík>]{<text>}", které 
pracuje se zpo¾dìným "\write" (aby èíslo strany bylo správnì). 
V okam¾iku naètení parametru
"<text>" jej potøebuji expandovat, proto¾e tam obvykle bývá nìco jako
"\the\secnum". Pro vyøe¹ení tohoto problému jsem
na chvíli prohodil parametry ("<lejblík>" toti¾ nechci
expandovat) a zavedl pomocné makro 
\db writelabelinternal "{<text>}{<lejblík>}".
První èást, tj. "\writelabel{<text>}" expanduji pomocí "\edef".

\inext {labeltext}{\empty}{+-}

Makro \db label je u¾ definováno jednodu¹e jako \uv{prázdný}
"\labeltext".

\inext {label}{\empty}{+-}

Makro \db cite "[<lejblík>]" vytiskne klikatelný text. Pøi chybném
"<lejblíku>" vytiskne varování na terminál. Makro je dokumentováno 
v~sekci~\cite[krizodkaz].

\inext {cite}{\empty}{+-}

S odkazy souvisí makro \db api "{<slovo>}", které vlo¾í
"\label[+<slovo>]" dá o sobì vìdìt je¹tì jednou do "\reffile".

\inext {def\nb api}{\empty}{+-}

Makro \db apitext obsahuje text ti¹tìný vedle "<slova>" do obsahu a
rejstøíku. 

Pøi èinnosti makra \db bye zapí¹eme do souboru "\reffile" údaje 
pro "\refcoef" (øádek~\cite[write]) a dále se zabýváme testem
konzistence referencí.

\ilabel [texttoc] {text\nb tocbuffer}
\ilabel [vypust] {indexbuffer}
\ilabel [write] {write\nb reffile}
\inext {def\nb bye}{^^B\cbrace}{++}

Test konzistence vypadá následovnì: nejprve
uzavøeme zápis do souboru "\reffile", pak
pomocí "\setrefchecking" pøedefinujeme
kontrolní sekvence vyskytující se v "\reffile" a soubor znovu
naèteme. Nyní makra v nìm napsaná dìlají test a pokud narazí na
problém, provedou "\continuefalse". Mù¾eme tedy pomocí "\ifcontinue"
zjistit, jak test dopadl. Po pøeètení souboru je potøeba udìlat je¹tì
dùkladnou kontrolu v¹ech automatických odkazù. Proè je tato kontrola 
vyøe¹ena vypu¹tìním "\indexbuffer" do vstupní fronty bude jasné po prostudování
makra \db setrefchecking.

\ilabel[jerelax] {=\nb relax}
\inext {def\nb setrefchecking}{\empty}{+-}

Zde pøedefinujeme makro "\refcoef", aby nedìlalo nic. 
Dále nová verze "\reflabel" kontroluje, zda odkaz je na stejné stránce, jako byl
a má stejný text. 
Nové makro "\refuseword" pracuje jako jeho originální protìj¹ek, jen místo
sekvencí "w:<slovo>" plní sekvence "-<slovo>". Tyto sekvence u¾ známe,
nyní je vyu¾ijeme jinak. ©etøíme pamìtí \TeX{}u, proto nezakládáme
sekvence nové. Nejprve je nutné tìmto sekvencím nastavit výchozí
hodnotu "\relax", co¾ je provedeno na øádku~\cite[jerelax].
Pak znovu pøedefinuji sekvenci "\,", aby provedla test shodnosti sekvence
"w:<slovo>" se sekvencí "-<slovo>" a v makru "\bye" na
øádku~\cite[vypust] spustím tento test expandováním makra 
"\indexbuffer\relax". Kdy¾ makro najde nekonzistenci, ohlásí chybu a
uteèe pomocí \db ignoretorelax.
Dále je pøedefinováno makro "\refdg", aby pouze
zapisovalo do "\tocbuffer". Ostatní makra z "\reffile" také zapisují
do "\tocbuffer". Stávající verzi "\tocbuffer" ulo¾íme do "\text" a
"\tocbuffer" se pøi naètení "\reffile" vytvoøí znovu. Na
øádku~\cite[texttoc], zda se nezmìnil obsah.

\subsec Tvorba obsahu, rejstøíku a zálo¾ek
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Obsah i rejstøík se mohou pomocí "\dotoc" a "\doindex" objevit kdekoli
v dokumentu (tøeba na zaèátku, na konci, uprostøed...). Musíme být
pøipraveni je kdykoli vytisknout. Soubor "\reffile" z minulého bìhu 
mù¾eme otevøít ke ètení jen na zaèátku, pak jej ma¾eme a zaèínáme
znova zapisovat. Pøi ètení ze souboru "\reffile" tedy musíme ulo¾it
v¹echny potøebné informace k sazbì obsahu i rejstøíku. Pou¾íváme na to
makro "\tocbuffer" a "\indexbuffer". Na zaèátku tyto \uv{buffery}
vyprázdníme. Makro \db addtext "<text>\to<buffer>" budeme pou¾ívat na
vkládání "<textu>" do "<bufferu>", èím¾ buffery postupnì naplníme.

\inext {def\nb tocbuffer}{\empty}{+-}

V souboru \db reffile se vyskytují tyto pøíkazy:

{\def\begtthook{\langleactive\catcode`\!=0\mubytein=1}
\begtt
\reftocline{<èíslo>}{<název>}{<strana>}  % údaje o sekci a subsekci pro obsah
\refdg{<pøed>}{<slovo>}{<za>}{<k-slovo>}  % údaj o pou¾ití \dg, \dl
\refapiword{<slovo>}                   % údaj o výskytu \api{<slovo>}
\refuseword{<slovo>}{<strana>}          % údaj o pøímém výskytu <slova>
\reflabel{<lejblík>}{<text>}{<strana>}     % viz sekci !cite[reference], odkazy, reference
\refcoef{<koeficient>}{<poèet>}{<vý¹ka>}  % viz sekci !cite[specfootnote], spec. poznámky
\refns{<nslejblík>}                     % viz sekci !cite[ns], jmenné prostory
\refnsend{<nslejblík>}                  % viz sekci !cite[ns], jmenné prostory
\endtt
\par}

Pøi ètení souboru "\reffile" ukládáme potøebné údaje do
bufferù. Nejprve se zamìøíme na {\bf obsah} a definujeme 
\db reftocline "{<èíslo>}{<název>}{<strana>}".

\inext {def\nb reftocline}{\empty}{+-}

V \db tocbuffer tedy máme postupnì údaje o v¹ech sekcích a podsekcích v
za sebou jdoucích sekvencích \db dotocline "{<èíslo>}{<název>}{<strana>}".
Mezi sekcí a subsekcí rozli¹íme jen podle toho, zda
parametr "<èíslo>" obsahuje teèku. K tomu slou¾í pomocné makro 
\db istocsec.

\inext {def\nb dotocline}{\empty}{+-}

Kdybychom spustili makro "\tocbuffer", dostaneme obsah. Ale ten se
neskládá jen z údajù o~sekcích a podsekcích. Je¹tì je potøeba pøeèíst
\db refdg a \db refapiword, abychom mohli vkládat do obsahu i údaje 
o~dokumentovaných slovech.

\ilabel [right] {right}
\ilabel [ns1] {\nb dl}
\ilabel [ns2] {locword}
\inext {def\nb refdg}{\empty}{+-}

Makro "\refdg" pracuje s parametry "{<pøed>}{<slovo>}{<za>}{<k-slovo>}",
kde "<pøed>" je text pøed slovem, "<slovo>" je dlouhé slovo, "<za>" obsahuje
pøípadné závorky "()". Je-li dlouhé slovo rozdílné od krátkého slova
(pøi pou¾ití "\dl"), obsahuje "<k-slovo>" krátké slovo, jinak je tento
parametr prázdný.
Makro "\refdg" ukládá informace nejen do "\tocbuffer",
ale také do "\indexbuffer". Rovnì¾ pøi prázdném "<k-slovo>" makro
ukládá "\sword" do enc\TeX{}ové tabulky a pøi
neprázdném "<k-slovo>" makro cosi kutí se jmennými prostory. 
Nyní je ale na¹e pozornost vìnována tvorbì
obsahu.  Ten vytvoøí makro \db dotoc.

\inext {def\nb dotoc}{\empty}{+-}

{\bf Rejstøík} je vybudován z bufferu \db indexbuffer, ve kterém je seznam
deklarovaných slov v dokumentu. Ka¾dé slovo je v bufferu zapsáno jako
kontrolní sekvence (to zabere v pamìti \TeX{}u nejmíò místa) a je
oddìleno od dal¹í sekvence oddìlovaèem. Pøed zatøídìním podle abecedy
jsou polo¾ky v~"\indexbuffer" oddìleny èárkami za polo¾kami, po
zatøídìní jsou polo¾ky oddìleny "\," pøed polo¾kami. Tak¾e obsah
"\indexbuffer" vypadá zhruba takto:

{\def\begtthook{\langleactive}
\begtt
pøed zatøídìním:  \-<slovo1> , \-<slovo2> , \-<slovo3> , \-<slovo4> , ...
po zatøídìní:     \, \-<slovoA> \, \-<slovoB> \, \-<slovoC> \, \-<slovoD> ...
\endtt
\par}

\noindent Zde zápis "\-<slovo>" znamená jednu kontrolní sekvenci.
Ka¾dá taková kontrolní sekvence je makrem tvaru "<pøed>\right<za>".
To zaøídí øádek~\cite[right]. Rejstøík vytiskneme makrem \db doindex.

\ilabel [calculatedimone] {calculatedimone}
\inext {def\nb doindex }{^^B\cbrace}{++}

Pøíkaz "\calculatedimone" s následujícím testem "\dimen1" souvisí se
sazbou do dvou sloupcù, co¾ necháme na sekci~\cite[dvasloupce].  Makro
tedy zalo¾í pøíkazem "\sec" sekci nazvanou "\titindex" a pokud je
"\indexbuffer" neprázdný, spustí sazbu rejstøíku. Nejprve se pøíkazem
"\sortindex" setøídí "\indexbuffer" podle abecedy (viz sekci~\cite[abeceda]). 
Pak makro "\doindex" zalo¾í
dvousloupcovou sazbu ("\begmulti 2") a oddìlovaèi "\," pøidìlí význam
"\doindexentry". Nakonec vypustí "\indexbuffer" do vstupní fronty,
tak¾e dal¹í práci opakovanì provede makro \db doindexentry
"\-<slovo>", které se postará o tisk slova v~rejstøíku.

\inext {def\nb doindexentry}{\empty}{+-}

Makro "\doindexentry" pomocí \db ignoretwo odstraní z kontrolní
sekvence "\-<slovo>" úvodní dva znaky "\-", tak¾e v "\tmp" zùstane "<slovo>".
Pokud "<slovo>" zaèíná backslashem, udìláme z nìj makrem 
\db remakebackslash sekvenci "\nb", nebo» pøímý backslash není ulo¾en
v PDF odkazech (zlobí nìkteré PDF prohlí¾eèe, viz sekci~\cite[reference].
Nakonec se vytiskne polo¾ka v rejstøíku u¾ známým makrem "\printindexentry".

Pøi tvorbì {\bf strukturovaných zálo¾ek} je potøeba vìdìt, kolik má
ka¾dý uzel potomkù. Tento údaj je poèítaný pøi ètení "\reffile"
voláním makra \db addbookmark "<uzel>" (viz makra "\reftocline" a "\refdg").
Parametr "<uzel>" mù¾e být èíslo sekce, nebo dvojèíslí "<sekce>.<podsekce>".
V makru \db currb je "<uzel>", ke kterému je potøeba pøièítat potomka
a \db currsecb je pøípadný nadøazený "<uzel>" sekce.
Makro "\addbookmark" pøipoète jednièku k hodnotì makra "\bk:<uzel>".

\inext {def\nb addbookmark}{\empty}{+-}

Makro \db bookmarks zalo¾í skupinu, pøedefinuje "\dotocline" a
"\ptocentry" (tj.~makra obsa¾ená v~"\tocbuffer") vlo¾í první zálo¾ku 
s názvem dokumentu a spustí "\tocbuffer".

\inext {def\nb bookmarks}{^^B\cbrace}{++}

Makro \db setoutline "[<lejblík>]{<text>}{<prefix>}" vytvoøí zálo¾ku 
"<prefix><text>" a prolinkuje ji s cílem oznaèeným "<lejblík>". 
V "\tempnum" musí být ulo¾en poèet potomkù zálo¾ky.

\inext {def\nb setoutline}{\empty}{+-}

V tomto makru je pou¾ito konverzní makro \db cnvbookmark, které je
implicitnì neaktivní. U¾ivatel mù¾e napøíklad nastavit 
"\let\cnvbookmark=\lowercase"
a nechat konvertovat pomocí "\lccode" znak "è" na "c", znak "¾" na
"z", atd. Nastavení "\lccode" musí mít v "\bookmarkshook".

Dále je text pøed vlo¾ením do zálo¾ky podroben konverzi \db nobraces, 
která ve spolupráci s makrem \db nobrA sundá pøípadné závorky "{}". 
Tak¾e, pokud máme tøeba "{\tt text} v \TeX{}u",
po konverzi dostáváme "text v TeXu".

\subsec [abeceda] Abecední øazení rejstøíku
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Tuto práci provede makro "\sortindex". Pùvodnì bylo v \docbytex{}u
implementováno algoritmem bubblesort, co¾ vy¹lo na ¹est øádkù makrokódu
(prezentováno na tutoriálu \TeX{}perience~2008), ale pro vìt¹í
rejstøíky to bylo pomalé. Napø. pro rejstøík tohoto dokumentu to
vygenerovalo 52 tisíc dotazù na porovnání a trvalo to asi dvì
vteøiny. Mùj syn Mirek byl pozorný
posluchaè tutoriálu, tak¾e nabyté znalosti okam¾itì vyu¾il a pøepsal
tøídicí makro na mergesort. Ten na stejnì velkém rejstøíku generuje 
1600 dotazù na porovnání, tedy tøicetkrát ménì. Cena za to je
skuteènost, ¾e makro u¾ nemá jen ¹est øádkù, ale je mírnì
komplikovanìj¹í. Od mo¾nosti pou¾ít quicksort jsme upustili, proto¾e
implementace by vy¾adovala vy¹¹í pamì»ové nároky na inputstack
\TeX{}u.

Nejprve deklarujeme podmínku pro výsledek srovnání dvou polo¾ek
\db ifAleB a vytvoøíme pomocná makra \db nullbuf, \db return a 
\db fif. Pomocné makro "\return" ve spolupráci se zakrytým "\fi"
uvnitø "\fif" budeme pou¾ívat pro únik z ko¹atých hluboce vnoøených
podmínek typu "\if..\else..\fi". Jak uvidíte, makro pracuje na úrovni
expandprocesoru a nebude potøeba psát ¾ádné "\expandafter".

\inext {newif\nb ifAleB}{\empty}{+-}

Makro \db sortindex vypustí do vstupní fronty celý "\indexbuffer",
pøimaluje k nìmu "\end,\end", pronuluje "\indexbuffer" a spustí 
"\mergesort".

\inext {def\nb sortindex}{^^B\cbrace}{++}

Makro \db mergesort pracuje tak, ¾e bere ze vstupní fronty v¾dy dvojici skupin
polo¾ek, ka¾dá skupina je zatøídìná. Skupiny jsou od sebe oddìleny
èárkami. Tyto dvì skupiny spojí do jedné a zatøídí. Pak pøejde na
následující dvojici skupin polo¾ek. Jedno zatøídìní tedy vypadá
napøíklad takto: dvì skupiny: "eimn,bdkz," promìní v~jedinou 
skupinu "bdeikmnz,". V tomto pøíkladì jsou polo¾ky jednotlivá písmena,
ve skuteènosti jsou to kontrolní sekvence, které obsahují celá slova.

Na poèátku jsou skupiny jednoprvkové ("\indexbuffer" oddìluje ka¾dou
polo¾ku èárkou). Makro "\mergesort" v tomto pøípadì projde seznam a vytvoøí
seznam zatøídìných dvoupolo¾kových skupin, ulo¾ený zpìtnì v
"\indexbuffer". V dal¹ím prùchodu znovu vyvrhne "\indexbuffer" do vstupní fronty,
vyprázdní ho a startuje znovu. Nyní vznikají ètyøpolo¾kové zatøídìné
skupiny. Pak osmipolo¾kové~atd. V~závìru (na øádku~\cite[konecsortu]) 
je první skupina celá setøídìná a druhá obsahuje "\end", tj. 
v¹echny polo¾ky jsou u¾ setøídìné v první skupinì, tak¾e staèí 
ji ulo¾it do "\indexbuffer" a ukonèit èinnost. Pomocí "\gobblerest"
odstraníme druhé "\end" ze vstupního proudu.

\noactive{dvojice}
\ilabel [merge:porovnani] {isAleB}
\ilabel [merge:trojka] {mergesort p1+}
\ilabel [merge:p1] {ifx,}
\ilabel [merge:p2] {fif\nb mergesort\cbrace}
\ilabel [konecsortu] {empty\nb indexbuffer}
\ilabel [napercarky] {napercarky}
\inext {def\nb mergesort }{^^B\cbrace}{++}

{\def\quotehook{\catcode`\<12}
Jádro "\mergesort" vidíme na øádcích~\cite[merge:porovnani]
a¾~\cite[merge:trojka]. Makro "\mergesort" sejme ze vstupního proudu
do "#1" první polo¾ku první skupiny, do "#2" zbytek první skupiny a do 
"#3" první polo¾ku druhé skupiny. Je-li "#1<#3", je do výstupního
zatøídìného seznamu "\indexbuffer" vlo¾en "#1", ze vstupního proudu je
"#1" odebrán a "\mergesort" je zavolán znovu. V pøípadì "#3<#1"
je do "\indexbuffer" vlo¾en "#3", ze vstupního proudu je "#3" odebrán a 
"\mergesort" je zavolán znovu. Øádky~\cite[merge:p1]
a¾~\cite[merge:p2] øe¹í pøípady, kdy je jedna ze skupin prázdná: 
je potøeba vlo¾it do "\indexbuffer" zbytek neprázdné skupiny a pøejít 
na dal¹í dvojici skupin. Ostatní øádky makra se vyrovnávají se
skuteèností, ¾e zpracování narazilo na zará¾ku "\end,\end" a je tedy
potøeba vystartovat dal¹í prùchod.
\par}

Vlastní srovnání dvou polo¾ek dìlá makro 
\db isAleB "<polA><polB>". Polo¾ky jsou tvaru kontrolní
sekvence "\-<slovoA>" a "\-<slovoB>". 
Makro konvertuje své parametry pomocí "\string" na øadu znakù a
expanduje na "\testAleB"~"<slovoA>\relax<slovoB>\relax".
Navíc je na tento test aplikováno "\lowercase", 
nebo» nerozli¹ujeme pøi øazení mezi velkými a malými písmeny.

\ilabel [teckanula] {0\nb relax}
%\ilabel [teckajedna] {2.1}
\inext {def\nb isAleB }{^^B\cbrace}{++}

Makro \db testAleB "<slovoA>\relax<slovoB>\relax" zjistí, zda je 
"<slovoA>" men¹í ne¾ "<slovoB>". Makro volá 
samo sebe, pokud jsou první porovnávané znaky stejné. Rekurze urèitì
skonèí, nebo» na øádku~\cite[teckanula]
jsou k porovnávaným slovùm pøipojeny rùzné ocasy.

\inext {def\nb testAleB}{^^B\cbrace}{++}

Makro \db napercarky vlo¾í mezi polo¾ky do "\indexbuffer" separátory "\,".
To se provede uvnitø "\edef\indexbuffer" na øádku~\cite[napercarky].

\inext {def\nb napercarky}{\empty}{+-}


\subsec Transformace seznamu stránek
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ka¾dý výskyt "<slova>"
ulo¾í do "\reffile" údaj \db refuseword "{<slovo>}{<strana>}", který
pøeèteme na zaèátku zpracování v dal¹ím prùchodu:

\inext {def\nb refuseword}{^^B\cbrace}{++}

V sekvenci "\w:<slovo>" tedy máme seznam stránek s výskyty "<slova>",
stránky jsou oddìleny èárkami. Seznam mù¾e vypadat tøeba takto:

\begtt
2,5,5,10,11,12,12,13,13,13,27
\endtt

Cílem je takovýto seznam stránek vytisknout ve formátu 
"2, 5, 10--13, 27", tj. odstranit duplicity a nahradit souvisle jdoucí
øadu stránek zápisem ve tvaru "<od>--<do>". Tuto práci dìlá makro
\db listofpages "{<slovo>}", které pøedhodí makru "\transf" expandovaný seznam
stránek ukonèený ",0,".

\inext {def\nb listofpages}{^^B\cbrace}{++}

Makro "\transf" vylouèí ze seznamu stránek ty, které jsou rovny
\db dgnum a \db apinum. Nechceme toti¾, aby se v seznamu opakovala hlavní
stránka "<slova>" a podtr¾ená stránka. Tyto stránky jsou vyti¹tìny u¾
døíve. Deklarujeme uvedené registry:

\inext {newcount\nb apinum}{\empty}{+-}

Kromì toho jsme deklarovali pomocné \db tempnum (aktuálnì zpracovávaná
stránka), \db ifdash (zda zpracováváme souvislou skupinu stránek 
a vytiskli jsme "--") a 
\db iffirst  (zda vkládáme první èíslo, tj. není nutné vlo¾it èárku).

Makro \db transf "<seznam stránek>,0," spustí cyklus pomocí \db cykltransf.

\inext {def\nb transf}{def\nb carka}{++}

Makro "\cykltransf" je takový malý stavový automat. Vìøím, ¾e mu ètenáø
porozumí bez dal¹ího komentáøe. 

\subsec [dvasloupce] Více sloupcù
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Sazba do více sloupcù je kompletnì pøevzata z \TeX{}booku naruby,
strany 244--246. 

\ilabel [dimen1] {dimen1<2}
\inext {newdimen\nb colsep}{TBN}{++}

Zde navíc øe¹íme problém, ¾e na zaèátku pøepnutí do
dvou sloupcù pomocí \db begmulti "2" si makro na øádku~\cite[dimen1]
zkontroluje, zda není blízko dna stránky a v takovém pøípadì zahájí
dva sloupce a¾ na nové stránce. Ov¹em vypadá hloupì, pokud se kvùli
tomu ulomí nadpis \uv{Rejstøík} od jeho obsahu. Je tedy potøeba
provést podobné mìøení stránky u¾ pøed tiskem nadpisu \uv{Rejstøík}.
K tomu slou¾í makro \db calculatedimone spu¹tìné na 
øádku~\cite[calculatedimone] v makru "\doindex".

\inext {def\nb calculatedimone}{\empty}{+-}

\subsec Závìreèná nastavení, kategorie
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Kategorie je rozumné nastavit a¾ na konci souboru {\tt docby.tex}.
Na rozdíl od plainu pøidáváme aktivní kategorii pro znak palce a
nastavujeme podtr¾ítko na obyèejnou kategorii, proto¾e se ve
zdrojových kódech programù èasto pou¾ívá a vùbec ne ve významu
matematického indexu. Kdyby mu tento význam zùstal, byly by jen
potí¾e.

Podtr¾ítko je dal¹í problém. Skoro v¾dy chceme, aby se ve 
vnitøních makrech chovalo jako normální podtr¾ítko, ale kdy¾ tiskneme text s
podtr¾ítkem fontem, který na dané pozici podtr¾ítko nemá (to je Knuthùv
odkaz), pak by se to mìlo udìlat plainovským makrem "\_", Toto makro tedy
schováme do \db subori a pak ho probudíme k~¾ivotu jen v~okam¾iku tisku
v~makrech "\printsec", "\printsubsec", "\title" a "\normalhead".
U¾ivatel tedy mù¾e napsat "\sec moje\_funkce" a v~makrech se bude "\_" jako
obyèejné podtr¾ítko, zatímco pøi tisku v nadpise se pou¾ije "\subori".

\inext {catcode`\nb_}{\empty}{+-}

Nastavením "\everymath" a "\everydisplay" zaruèíme matematikùm stále
mo¾nost pou¾ívat podtr¾ítko ve významu indexu.

Aktivní palec spustí lokální verbatim prostøedí uvnitø odstavce:

\inext {catcode`\nb}{\empty}{+-}

Makro \db langleactive nastaví aktivní kategorii pro znak je men¹í
({\tt<}), tak¾e bude mo¾né zapisovat {\tt<text>} a vytiskne se
"<text>". 

\inext {def\nb langleactive}{\empty}{+-}

V tomto dokumentu jsem "\langleactive" pou¾il v makru
"\quotehook", proto¾e nechat znak {\tt<} aktivní v¹ude nedìlalo dobrotu.

\doindex

\bye


