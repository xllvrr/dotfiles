.PS
# `CctTableSVG.m4'
cct_init(svg_font(sans-serif,11pt__))
textwid = 1.5
movewid = 2 pt__
hm = 2.1
vm = 0.28
{  {resistor ; move ; svgLink(NportSVG.svg,"`resistor'" ljust)}
   move right_ hm
   {resistor(,,Q) ; move ; "`resistor(,,Q) '" ljust}
   move right_ hm
   {resistor(,,E) ; move ; "`resistor(,,E) = ebox'" ljust}
}
   move down vm; right_
{  {resistor(,,ES) ; move ;"`resistor(,,ES) '" ljust}
   move right_ hm
   {resistor(,4,QR) ; move ;"`resistor(,4,QR) '" ljust}
   move right_ hm
   {resistor(,,H) ; move ;"`resistor(,,H) '" ljust}
}
   move down vm; right_
{  {resistor(,,V) ; move ;"`resistor(,,V)'" ljust}
   move right_ hm
   {ebox(,,,0.5) ; move ;"`ebox(,,,0.5)'" ljust}
   move right_ hm
   {ebox(,0.5,0.3) ; move ;"`ebox(,0.5,0.3)'" ljust}
}
   move down vm; right_
{  {inductor ; move ;"`inductor'" ljust}
   move right_ hm
   {inductor(,W); move ;"`inductor(,W)'" ljust}
   move right_ hm
   {inductor(,L); move ;"`inductor(,L)'" ljust}
}
   move down vm; right_
{ {inductor(,,,M) ; move ;"`inductor(,,,M)'" ljust}
   move right_ hm
   {inductor(,W,6,P); move ;"`inductor(,W,6,P)'" ljust}
   move right_ hm
   {ttmotor(,G) ; move ;"`ttmotor(,G)'" ljust}
}
   move down vm; right_
{  {capacitor ; move ;"`capacitor'" ljust}
   move right_ hm
   {capacitor(,C); move ;"`capacitor(,C)'" ljust}
   move right_ hm
   {capacitor(,C+); move ;"`capacitor(,C+)'" ljust}
}
   move down vm; right_
{  {capacitor(,P); move ;"`capacitor(,P)'" ljust}
   move right_ hm
   {capacitor(,E); move ;"`capacitor(,E)'" ljust}
   move right_ hm
   {capacitor(,K); move ;"`capacitor(,K)'" ljust}
}
   move down 0.25; right_
{  {capacitor(,M); move ;"`capacitor(,M)'" ljust}
   move right_ hm
   {capacitor(,N); move ;"`capacitor(,N)'" ljust}
   move right_ hm
   {xtal ; move ;"`xtal'" ljust}
}
   move down 0.25; right_
{  {memristor ; move;"`memristor'" ljust}
   move right_ hm
   {heater; move;"`heater'" ljust}
   move right_ hm
   {tline ; move;"`tline'" ljust}
}
   move down 0.25; right_
{  {gap ; move ;"`gap'" ljust}
   move right_ hm
   {gap(,,A) ; move ;"`gap(,,A)'" ljust}
   move right_ hm
  {arrowline ; move;"`arrowline'" ljust}
}

 command "</g>" # end font
.PE
