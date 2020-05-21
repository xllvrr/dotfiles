divert(-1)

   Macros defining some integrated circuits and connectors

                     `DIP_chip_outline( pin count, wid )'
define(`DIP_chip_outline',
 `[ define(`m4chgw',`ifelse(`$2',,(18*L_unit),`$2')')dnl
    Chip: box invis wid m4chgw ht lg_pinsep*eval((`$1')/2+1)
    arcd(last box.n, lg_pinsep/2, 180, 360)
    { line to last box.ne chop -linewid bp__/2 }
    { line from last arc.start to last box.nw chop -linewid bp__/2 }
    line from last box.nw to last box.sw then to last box.se then to last box.ne
   `$3']')

                     `A sequence of pins along the east or west side of a chip:
                      lg_pinseq(initial pin no, final pin no,
                         e|w, initial offset, pinnum_root, Labelroot, [N])'
                     `e.g., lg_pinseq(1,8,w)'
define(`lg_pinseq',`for_($1,$2,1,
   `lg_pin( Chip.s`$3'+(0,($4+m4x)*lg_pinsep),
      $6`'m4x,Pin`'eval($5`'m4x),`$3'`$7',eval($5`'m4x))') ')


define(`ic6116',`[ Chip: box wid_ lg_chipwd ht_ 15*lg_pinsep
   lg_pin(Chip.sw_+(0,lg_pinsep),GND,Pin12,w,12)
   lg_pin(Chip.sw_+(0,2*lg_pinsep),lg_bartxt(CS),Pin18,wN,18)
   lg_pinseq(0,2,w,4,9+,D)
   lg_pinseq(3,7,w,4,10+,D)
   lg_pin(Chip.sw_+(0,13*lg_pinsep),R/lg_bartxt(W),Pin21,w,21)
   lg_pin(Chip.sw_+(0,14*lg_pinsep),V\hbox{\tiny CC},Pin24,w,24)
   lg_pin(Chip.se_+(0,lg_pinsep),lg_bartxt(OE),Pin20,eN,20)
   lg_pinseq(0,7,e,3,8-,A)
   lg_pinseq(8,9,e,3,31-,A)
   lg_pin(Chip.se_+(0,13*lg_pinsep),A10,Pin19,e,19)
    `$1']')

define(`ic6502',`[ Chip: box wid_ lg_chipwd ht_ 24*lg_pinsep
   lg_pin(Chip.sw_+(0,lg_pinsep),V\hbox{\tiny SS},Pin21,w,21)
   lg_pin(Chip.sw_+(0,2*lg_pinsep),V\hbox{\tiny SS},Pin1,w,1)
   lg_pin(Chip.sw_+(0,4*lg_pinsep),R/lg_bartxt(W),Pin34,w,34)
   lg_pinseq(0,7,w,6,33-,D)
   lg_pin(Chip.sw_+(0,15*lg_pinsep),lg_bartxt(RESET),Pin40,wN,40)
   lg_pin(Chip.sw_+(0,17*lg_pinsep),SYNC,Pin7,w,7)
   lg_pin(Chip.sw_+(0,19*lg_pinsep),lg_bartxt(NMI),Pin6,wN,6)
   lg_pin(Chip.sw_+(0,21*lg_pinsep),RDY,Pin2,w,2)
   lg_pin(Chip.sw_+(0,22*lg_pinsep),SO,Pin38,w,38)
   lg_pin(Chip.sw_+(0,23*lg_pinsep),V\hbox{\tiny CC},Pin8,w,8)
   lg_pin(Chip.se_+(0,lg_pinsep),{\large$\phi$}\hbox{\tiny 1}(in),Pin39,e,39)
   lg_pin(Chip.se_+(0,4*lg_pinsep),
     {\large$\phi$}\hbox{\tiny 2}(out),Pin37,e,37)
   lg_pinseq(0,11,e,6,9+,A)
   lg_pinseq(12,15,e,6,10+,A)
   lg_pin(Chip.se+(0,23*lg_pinsep),lg_bartxt(IRQ),Pin4,eN,4)
    `$1']')

define(`ic6522',`[ Chip: box wid_ lg_chipwd ht_ 24*lg_pinsep
   lg_pin(Chip.sw_+(0,lg_pinsep),V\hbox{\tiny SS},Pin1,w,1)
   lg_pin(Chip.sw_+(0,3*lg_pinsep),CS1,Pin24,w,24)
   lg_pin(Chip.sw_+(0,4*lg_pinsep),{\large$\phi$},Pin25,w,25)
   lg_pin(Chip.sw_+(0,5*lg_pinsep),lg_bartxt(CS2),Pin23,wN,23)
   lg_pin(Chip.sw_+(0,7*lg_pinsep),RS0(A0),Pin38,w,38)
   lg_pin(Chip.sw_+(0,8*lg_pinsep),RS1(A1),Pin37,w,37)
   lg_pin(Chip.sw_+(0,9*lg_pinsep),RS2(A2),Pin36,w,36)
   lg_pin(Chip.sw_+(0,10*lg_pinsep),RS3(A3),Pin35,w,35)
   lg_pinseq(0,7,w,12,33-,D)
   lg_pin(Chip.sw_+(0,21*lg_pinsep),R/lg_bartxt(W),Pin22,w,22)
   lg_pin(Chip.sw_+(0,22*lg_pinsep),lg_bartxt(IRQ),Pin21,wN,21)
   lg_pin(Chip.sw_+(0,23*lg_pinsep),V\hbox{\tiny CC},Pin20,w,20)
   lg_pinseq(0,7,e,1,10+,PB)
   lg_pinseq(1,2,e,8,17+,CB)
   lg_pinseq(0,7,e,12,2+,PA)
   lg_pinseq(1,2,e,19,41-,CA)
   lg_pin(Chip.se_+(0,23*lg_pinsep),lg_bartxt(RESET),Pin34,eN,34)
    `$1']')

define(`ic74LS138',`[ Chip: box wid_ lg_chipwd ht_ 11*lg_pinsep
   lg_pin(Chip.sw_+(0,lg_pinsep),GND,Pin8,w,8)
   lg_pin(Chip.sw_+(0,2*lg_pinsep),lg_bartxt(G2a),Pin4,wN,4)
   lg_pin(Chip.sw_+(0,3*lg_pinsep),lg_bartxt(G2b),Pin5,wN,5)
   lg_pin(Chip.sw_+(0,5*lg_pinsep),A,Pin1,w,1)
   lg_pin(Chip.sw_+(0,6*lg_pinsep),B,Pin2,w,2)
   lg_pin(Chip.sw_+(0,7*lg_pinsep),C,Pin3,w,3)
   lg_pin(Chip.sw_+(0,9*lg_pinsep),G1,Pin6,w,6)
   lg_pin(Chip.sw_+(0,10*lg_pinsep),V\hbox{\tiny CC},Pin16,w,16)
   lg_pinseq(0,6,e,2,15-,Y,n)
   lg_pin(Chip.se_+(0,9*lg_pinsep),Y7,Pin7,eN,7)
    `$1']')

define(`ic4017',`[ Chip: chip_gen(16)
  Loopover_(`x',
   `lg_pin(Chip.nw-(0,lg_pinsep*m4Lx),x,Pin`'m4Lx,w,m4Lx)',
    PL, Q3, I3, I0, CLE, Q0, TC, GND)
  Loopover_(`x',
   `lg_pin(Chip.se+(0,lg_pinsep*m4Lx),x,Pin`'eval(m4Lx+8),e,eval(m4Lx+8))',
    MR, U/D, Q1, I1, I2, Q2, CLK, Vcc)
   `$1']')

define(`ic4510',`[ Chip: chip_gen(16)
  Loopover_(`x',
   `lg_pin(Chip.nw-(0,lg_pinsep*m4Lx),x,Pin`'m4Lx,w,m4Lx)',
    PL, Q3, I3, I0, CLE, Q0, TC, GND)
  Loopover_(`x',
   `lg_pin(Chip.se+(0,lg_pinsep*m4Lx),x,Pin`'eval(m4Lx+8),e,eval(m4Lx+8))',
    MR, U/D, Q1, I1, I2, Q2, CLK, Vcc)
   `$1']')

define(`icVS1053',`[ Chip: chip_gen(32)
  Loopover_(`x',
   `lg_pin(Chip.nw-(0,lg_pinsep*m4Lx),x,Pin`'m4Lx,w,m4Lx)',
    LOUT,ROUT,GBUF,AGND,AGND,DREG,Vcc,3V3,GND,MISO,MOSI,sclk,RST,CS,DCS,DCS)
  Loopover_(`x',
   `lg_pin(Chip.se+(0,lg_pinsep*m4Lx),x,Pin`'eval(m4Lx+16),e,eval(m4Lx+16))',
    SDCD,RX,TX,7,6,5,4,3,2,1,0,GND,3V3,AGND,MIC-,MIC+)
   `$1']')

                           `ArduinoUno( wid,ht,pinlen )'
define(`ArduinoUno',`[
 define(`m4bwid',`ifelse(`$1',,`24*L_unit',`$1')')dnl
 define(`m4bht',`ifelse(`$2',,`20*lg_pinsep',`$2')')dnl
#
 command "{\small\sf"
 Connector: box wid m4bwid ht m4bht
#
 plen = ifelse(`$4',,`2*L_unit',`$4')
#
Loopover_(`x',`ifelse(x,nul,,
 `Pin`'eval(5+m4Lx): line left_ plen from Connector.nw-(0,(5+m4Lx)*lg_pinsep)
  { "x" ljust at last line.start }')',
 IOREF, RESET,`$+$`'3V3',`$+$`'5V', GND, GND, VIN,
 nul, A0, A1, A2, A3, A4, A5)
#
Loopover_(`x',`ifelse(x,nul,,
 `Pin`'eval(22-m4Lx): line right_ plen from Connector.ne-(0,m4Lx*lg_pinsep)
  { "x" rjust at last line.start }')',
 SCL, SDA, AREF, GND, D13, D12, \char126 D11, \char126 D10, \char126 D9, D8,
 nul, D7, \char126 D6, \char126 D5, D4, \char126 D3, D2, TX D1, RX D0)
#
 command "}"
 `$4'] ')

                           `ArduinoLeonardo( wid,ht,pinlen )'
define(`ArduinoLeonardo',`[
 define(`m4bwid',`ifelse(`$1',,`24*L_unit',`$1')')dnl
 define(`m4bht',`ifelse(`$2',,`20*lg_pinsep',`$2')')dnl
#
 command "{\small\sf"
 Connector: box wid m4bwid ht m4bht
#
 plen = ifelse(`$4',,`2*L_unit',`$4')
#
Loopover_(`x',`ifelse(x,nul,,
 `Pin`'eval(5+m4Lx): line left_ plen from Connector.nw-(0,(5+m4Lx)*lg_pinsep)
  { "x" ljust at last line.start }')',
 IOREF, RESET,`$+$`'3V3',`$+$`'5V', GND, GND, VIN,
 nul, A0, A1, A2, A3, A4, A5)
#
Loopover_(`x',`ifelse(x,nul,,
 `Pin`'eval(22-m4Lx): line right_ plen from Connector.ne-(0,m4Lx*lg_pinsep)
  { "x" rjust at last line.start }')',
 SCL, SDA, AREF, GND,
 \char126 D13, D12, \char126 D11, \char126 D10, \char126 D9, D8,
 nul, D7, \char126 D6, \char126 D5, D4, \char126 D3, D2, TX D1, RX D0)
#
 command "}"
 `$4'] ')

                           `RPi( wid,ht,pinlen )'
define(`RPi',`[
 define(`m4bwid',`ifelse(`$1',,`34*L_unit',`$1')')dnl
 define(`m4bht',`ifelse(`$2',,`21*lg_pinsep',`$2')')dnl
#
 command "{\small\sf"
 GPIO: box wid m4bwid ht m4bht
 plen = ifelse(`$4',,`6*L_unit',`$4')
#
define A_LeftGPIO {
 exec sprintf("Pin%g: line left_ plen from GPIO.nw-(0,%g)",\
  2*(`$'1)-1,(`$'1)*lg_pinsep)
  { "`$'3" ljust at last line.start }
  "`$'2" at last line.c above }
#
Loopover_(`x',`ifelse(x,nul,,`A_LeftGPIO(m4Lx,patsubst(x,;,`,'))')',
  ;3V3,
  2;SDA1, 3;SCL1, 4;GPIO\_GCLK,
  ;GND,
  17;GPIO\_GEN0, 27;GPIO\_GEN2, 22;GPIO\_GEN3,
  ;3V3,
  10;SPI\_MOSI, 9;SPI\_MISO, 11;SPI\_SCLK,
  ;GND,
  ;ID\_SD,
  5;, 6;, 13;, 19;, 26;,
  ;GND )
#
define A_RightGPIO {
 exec sprintf("Pin%g: line right_ plen from GPIO.ne-(0,%g)",\
  2*(`$'1),(`$'1)*lg_pinsep)
  { "`$'3" rjust at last line.start }
  "`$'2" at last line.c above }
#
Loopover_(`x',`ifelse(x,nul,,`A_RightGPIO(m4Lx,patsubst(x,;,`,'))')',
  ;5V,
  ;5V,
  ;GND,
  14;TXD0, 15;RXD0, 18;GPIO\_GEN1,
  ;GND,
  23;GPIO\_GEN4, 24;GPIO\_GEN5,
  ;GND,
  25;GPIO\_GEN6, 8;SPI\_CEO\_N, 7;SPI\_CE1\_N,
  ;ID\_SC,
  ;GND,
  12;,
  ;GND,
  16;, 20;, 21; ) 
#
 command "}"
 `$4'] ')

                           `USB_C_Socket( wid, ht, pinlen )'
define(`USB_C_Socket',`[
 define(`m4bwid',`ifelse(`$1',,`18*L_unit',`$1')')dnl
 define(`m4bht',`ifelse(`$2',,`14*lg_pinsep',`$2')')dnl
 command "{\small\sf"
#
 Base: box wid m4bwid ht m4bht rad 5/3*lg_pinsep
 plen = ifelse(`$4',,`6*L_unit',`$4')
#
 Loopover_(`x',
  `B`'eval(13-m4Lx): dnl
  line left_ plen from Base.n-(m4bwid/2,(m4Lx+0.5)*lg_pinsep)
   {"x" ljust at last line.start}',
  GND, RX1$+$, RX1$-$, VBUS, SBU2, D$-$, D$+$, CC2, VBUS, TX2$-$, TX2$+$, GND)
#
 Loopover_(`x',
  `A`'m4Lx: line right_ plen from Base.n+(m4bwid/2,-(m4Lx+0.5)*lg_pinsep)
   {"x" rjust at last line.start}',
  GND, TX1$+$, TX1$-$, VBUS, CC1, D$+$, D$-$, SBU1, VBUS, RX2$-$, RX2$+$, GND)
#
 command "}"
 `$4']')

                           `HDMI_micro( wid, ht, pinlen )'
define(`HDMI_micro',`[
 define(`m4bwid',`ifelse(`$1',,`16*L_unit',`$1')')dnl
 define(`m4bht',`ifelse(`$2',,`20*lg_pinsep+m4bwid*2/3',`$2')')dnl
 command "{\small\sf"
#
 Base:[line up m4bht/2 then right m4bwid*2/3 \
  then right m4bwid/3 down m4bwid/3 \
  then down m4bht-2*m4bwid/3 then down m4bwid/3 left m4bwid/3 \
  then left m4bwid*2/3 then to Here]
 plen = ifelse(`$4',,`6*L_unit',`$4')
#
 Loopover_(`x',
  `Pin`'m4Lx: line left_ plen from Base.nw-(0,m4bwid/3+m4Lx*lg_pinsep)
   {"x" ljust at last line.start}
   "m4Lx" at last line.c above',
  HPD, UTILITY, D2$+$, D2\_SH, D2$-$, D1$+$, D1\_SH, D1$-$, D0$+$, D0\_SH,
  D0$-$, CLK$+$, CLK\_SH, CLK$-$, CEC, GND, SCL, SDA, $+``$''5V)
 line from Base.nw+(m4bwid*2/3-lg_pinsep,0) up plen
 r_text(21) at last line.c+(-5bp__,0)
 r_text(SH2) at last line.start + (0,-10bp__)
 line from Base.nw+(m4bwid*2/3-2*lg_pinsep,0) up plen
 r_text(20) at last line.c+(-5bp__,0)
 r_text(SH1) at last line.start + (0,-10bp__)
 line from Base.sw+(m4bwid*2/3-lg_pinsep,0) down plen
 r_text(23) at last line.c+(-5bp__,0)
 r_text(SH4) at last line.start + (0, 10bp__)
 line from Base.sw+(m4bwid*2/3-2*lg_pinsep,0) down plen
 r_text(22) at last line.c+(-5bp__,0)
 r_text(SH3) at last line.start + (0, 10bp__)
#
 command "}"
 `$4']')

divert(0)dnl
