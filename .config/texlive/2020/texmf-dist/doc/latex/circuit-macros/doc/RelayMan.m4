.PS
# Relay
cct_init

skip = 1.1

R1:relay
 {"\sl V1" wid 0.16 rjust at last [].V1
  "\sl V2" ljust at last [].V2
  "\sl P1" rjust at last [].P1-(dotrad_,0)
  "\sl O1" ljust at last [].O1
  "\sl C1" ljust at last [].C1 }
 S: `"\tt relay"' at last [].s+(0,-0.2)

R5:relay(2,CTh) with .sw at last [].sw+(skip,0)
 { for_(1,2,1,`
  "\sl P`'m4x" rjust at last [].P`'m4x-(dotrad_,0)
  "\sl C`'m4x" ljust at last [].C`'m4x ') }
  `"\tt (2,CTh)"' at (last [],S)

R4:relay(2,O) with .sw at last [].sw+(skip,0)
 {for_(1,2,1,`
  "\sl P1" rjust at last [].P1-(dotrad_,0)
  "\sl O`'m4x" ljust at last [].O`'m4x ')}
  `"\tt (2,O)"' at (last [],S)

R3:relay(2,PIAX) with .sw at last [].sw+(skip,0)
 {"\sl V1" rjust at last [].V1
  "\sl V2" rjust at last [].V2
  for_(1,2,1,
   `"\sl P`'m4x" rjust at last [].P`'m4x-(dotrad_,0)
    "\sl O`'m4x" ljust at last [].O`'m4x+(dotrad_,0)
    "\sl C`'m4x" ljust at last [].C`'m4x+(dotrad_,-2pt__) ') }
 `"\tt (2,PIAX)"' at (last [],S)

R2:relay(2,R) with .sw at last [].sw+(skip,0)
 {"\sl V1" rjust at last [].V1
  "\sl V2" ljust at last [].V2
  for_(1,2,1,
 `"\sl P`'m4x" rjust at last [].P`'m4x-(dotrad_,0)
  "\sl O`'m4x" ljust at last [].O`'m4x 
  "\sl C`'m4x" ljust at last [].C`'m4x ') }
  `"\tt relay(2,R)"' at (last [],S)
.PE
