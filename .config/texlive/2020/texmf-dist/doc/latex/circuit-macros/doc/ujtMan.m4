.PS
# `ujt.m4'
cct_init
dwn = 1.0
dsep = 0.15

define(`demo_ujt',`Q: ujt(`$1',`$2',`$3',`$4')
  "\sl B1" ifelse(`$5',,below,ljust) at last [].B1
  "{\sl E}sp_" at 1.5 between last [].Bulk.c and last [].E
  "\sl B2" ifelse(`$5',,above,ljust) at last [].B2
 ')

[demo_ujt(up_ dimen_,,,E,A)
`"{\tt ujt(up\_ dimen\_,{,},E)}"' wid 1.45 ht 0.1 at Q.s+(0,-0.15) ]

[demo_ujt(,,P,)
`"{\tt ujt(,{,}P,)}"' at Q.s+(0.1,-dsep) below ] \
with .Q.w at last [].Q.e+(0.85,0)

[demo_ujt(,R,,)
`"{\tt ujt(,R,{,})}"' at Q.s+(0,-dsep) below] \
with .Q.w at last [].Q.e+(0.8,0)

[demo_ujt(,R,P,)
`"{\tt ujt(,R,P,)}"' at Q.s+(0,-dsep) below] \
with .Q.w at last [].Q.e+(0.8,0)

.PE
