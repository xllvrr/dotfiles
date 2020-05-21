.PS
# `CctTable.m4'
cct_init

movewid = 2 pt__
hm = 2.05
vm = 0.28
{  {resistor ; move ;"`{\tt resistor}'" ljust}
   move right_ hm
   {resistor(,,Q) ; move ;"`\tt resistor(,{,}Q) '" ljust}
   move right_ hm
   {resistor(,,E) ; move 
    "`\shortstack[l]{\tt resistor(,{,}E)\\ {\tt $\equiv$ ebox}}'" ljust}
}
   move down vm; right_
{  {resistor(,,ES) ; move ;"`\tt resistor(,{,}ES) '" ljust}
   move right_ hm
   {resistor(,,H) ; move ;"`\tt resistor(,{,}H) '" ljust}
   move right_ hm
   {ebox(,,,0.5) ; move ;"`{\tt ebox(,{,},0.5)}'" ljust}
}
   move down vm; right_
{  {resistor(,,V) ; move ;"`{\tt resistor(,{,}V)}'" ljust}
   move right_ hm
   {move down_ 0.05; right_
    thermocouple ; move;"`{\tt thermocouple}'" ljust; move up_ 0.05}
   move right_ hm
   {ebox(,0.5,0.3) ; move ;"`{\tt ebox(,0.5,0.3)}'" ljust}
}
   move down vm; right_
{  {inductor ; move ;"`{\tt inductor}'" ljust}
   move right_ hm
   {inductor(,W); move ;"`{\tt inductor(,W)}'" ljust}
   move right_ hm
   {inductor(,L); move ;"`{\tt inductor(,L)}'" ljust}
}
   move down vm; right_
{ {inductor(,,,M) ; move ;"`{\tt inductor(,{,},M)}'" ljust}
   move right_ hm
   {inductor(,W,6,P); move ;"`{\tt inductor(,W,6,P)}'" ljust}
   move right_ hm
   {move right_ 0.2; ttmotor(,G) ; move ;"`{\tt ttmotor(,G)}'" ljust}
}
   move down vm; right_
{  {capacitor ; move ;"`{\tt capacitor}'" ljust}
   move right_ hm
   {capacitor(,C); move ;"`{\tt capacitor(,C)}'" ljust}
   move right_ hm
   {capacitor(,C+); move ;"`{\tt capacitor(,C+)}'" ljust}
}
   move down vm; right_
{  {capacitor(,P); move ;"`{\tt capacitor(,P)}'" ljust}
   move right_ hm
   {capacitor(,E); move ;"`{\tt capacitor(,E)}'" ljust}
   move right_ hm
   {capacitor(,K); move ;"`{\tt capacitor(,K)}'" ljust}
}
   move down 0.25; right_
{  {capacitor(,M); move ;"`{\tt capacitor(,M)}'" ljust}
   move right_ hm
   {capacitor(,N); move ;"`{\tt capacitor(,N)}'" ljust}
   move right_ hm
   {xtal ; move ;"`{\tt xtal}'" ljust}
}
   move down 0.25; right_
{  {memristor ; move;"`{\tt memristor}'" ljust}
   move right_ hm
   {heater; move;"`{\tt heater}'" ljust}
   move right_ hm
   {tline ; move;"`{\tt tline}'" ljust}
}
   move down 0.25; right_
{  {move up_ 0.05; right_; gap ; move ;"`{\tt gap}'" ljust}
   move right_ hm
   {gap(,,A) ; move ;"`{\tt gap(,{,}A)}'" ljust}
   move right_ hm
  {arrowline ; move;"`{\tt arrowline}'" ljust}
}
   move down 0.25; right_
{ {lamp ; move;"`{\tt lamp}'" ljust}
   move right_ hm
   {reed ; move ;"`{\tt reed}'" ljust}
   move right_ hm
   {reed(,,,fill_(0.9),CR) ; move ; "`{\tt reed(,{,},fill\_(0.9),CR)}'" ljust}
}
   move down 0.25; right_
{ {pvcell ; move;"`{\tt pvcell}'" ljust}
}

.PE
