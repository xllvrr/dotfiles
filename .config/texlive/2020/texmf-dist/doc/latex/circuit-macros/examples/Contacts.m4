.PS
# Contacts.m4
cct_init

 space = 0.75
 KS:contacts(2)
 {`"\tt contacts(2)"' at KS.s +(0,-12bp__)
  for_(1,2,1,
   `"\sl P`'m4x" rjust at last [].P`'m4x-(dotrad_,0)
    "\sl O`'m4x" ljust at last [].O`'m4x+(dotrad_,0)
    "\sl C`'m4x" ljust at last [].C`'m4x+(dotrad_,0) ') }

 KS:contacts(2,I) with .sw at last [].se+(space,0)
 {`"\tt (2,I)"' at KS.s +(0,-12bp__)
  for_(1,2,1,
   `"\sl P`'m4x" rjust at last [].P`'m4x-(dotrad_,0)
    "\sl O`'m4x" ljust at last [].O`'m4x+(dotrad_,0)
    "\sl C`'m4x" ljust at last [].C`'m4x+(dotrad_,0) ') }

 KS:contacts(2,IO) with .sw at last [].se+(space,0)
 {`"\tt (2,IO)"' at KS.s +(0,-12bp__)
  for_(1,2,1,
   `"\sl P`'m4x" rjust at last [].P`'m4x-(dotrad_,0)
    "\sl O`'m4x" ljust at last [].O`'m4x+(dotrad_,0) ') }

 KS:contacts(2,PICD) with .sw at last [].se+(space,0)
 {`"\tt (2,PICD)"' at KS.s +(0,-12bp__)
  for_(1,2,1,
   `"\sl P`'m4x" rjust at last [].P`'m4x-(dotrad_,0)
    "\sl O`'m4x" ljust at last [].O`'m4x+(dotrad_,0)
    "\sl C`'m4x" ljust at last [].C`'m4x+(dotrad_,0) ') }

 KS:contacts(2,PTCD) with .sw at last [].se+(space,0)
 {`"\tt (2,PTCD)"' at KS.s +(0,-12bp__)
  for_(1,2,1,
   `"\sl P`'m4x" rjust at last [].P`'m4x-(dotrad_,0)
    "\sl O`'m4x" ljust at last [].O`'m4x+(dotrad_,0)
    "\sl C`'m4x" ljust at last [].C`'m4x+(dotrad_,0) ') }

 KS:contacts(2,PUCD) with .sw at last [].se+(space,0)
 {`"\tt (2,PUCD)"' at KS.s +(0,-12bp__)
  for_(1,2,1,
   `"\sl P`'m4x" rjust at last [].P`'m4x-(dotrad_,0)
    "\sl O`'m4x" ljust at last [].O`'m4x+(dotrad_,0)
    "\sl C`'m4x" ljust at last [].C`'m4x+(dotrad_,0) ') }
.PE
