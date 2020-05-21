.PS
# `Taps.m4'
cct_init

 t = 0.2 in__
 right_
 R1: resistor(,,E); addtaps(<-,0.2,-t,0.8,t)
   "\sl R1.start" wid 0.5 ht 11pt__ at R1.start above
   "\sl R1.end" at R1.end above
   "\sl Tap1" at Tap1 rjust
   "\sl Tap2" at Tap2 ljust
  `"\tt right\_; t = 0.2in\_\_" ljust \
   "\tt R1:$\;$resistor(,{,}E)" ljust \
   "\tt addtaps(<-,0.2,-t,0.8,t)" ljust' at R1.end+(0.3,0)

 move to R1.end+(2.25,0.1); right_
 R2: ebox(,elen_*0.6,)
       addtaps(type=-;name=Tx,0.2,-t,0.5,-t,0.8,-t)
   "\sl Tx1" at Tx1 rjust
   "\sl Tx3" at Tx3 ljust
  `"\tt R2:$\;$ebox(,elen\_*0.6)" ljust \
   "\tt addtaps(type=-;name=Tx," ljust \
   "\tt \hspace*{0.2in}0.2,-t,0.5,-t,0.8,-t)" ljust ' at R2.end+(0.1,-0.15)

 R3: tapped(`ebox(,elen_*0.6,)',->,0.2,-t,0.5,-t,0.8,-t) \
  with .Start at R1.start+(0.25in__,-0.6in__)
   "\sl R3.Start" at R3.Start rjust
   "\sl R3.End" at R3.End ljust
   "\sl R3.Tap1" at R3.Tap1 rjust
   "\sl R3.Tap3" at R3.Tap3 ljust
  `"\tt \
   R3:$\;$tapped(`ebox(,elen\_*0.6,)',->,0.2,-t,0.5,-t,0.8,-t) \char92" ljust \
   "\tt $\;$ with .Start at R1.start+(0.25in\_\_,-0.6in\_\_)" ljust' \
     at R3.End+(0.5,0)

 L1: tapped(`inductor(right_ 9*dimen_/8,,9)',
      -,0,-t,3/9,-t/2,6/9,-t/2,1,-t) at R3+(0,-0.6)
  `"\tt L1:$\;$tapped(`inductor(right\_ 9*dimen\_/8,{,}9)'," ljust' \
  `"\hspace*{0.5in}\tt -,0,-t,3/9,-t/2,6/9,-t/2,1,-t)" ljust' at (last "",L1)
   "\sl L1.Tap1" at L1.Tap1-(10pt__,0) below
   "\sl L1.Tap4" at L1.Tap4+(10pt__,0) below

.PE
