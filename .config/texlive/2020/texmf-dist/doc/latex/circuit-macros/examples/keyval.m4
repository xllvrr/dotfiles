.PS
# keyval.m4
cct_init

#An experiment in defining macro options as key1=val1;key2=val2; ...
#                                `resistor( linespec,
#                                           cycles=n;type=E|Q|H;side=L|R)
#                                 chars : E=ebox
#                                         Q=offset
#                                         H=squared (default 3 cycles)
#                                         R=to right of drawing direction'
define(`xesistor',
`print "`$0'($@)" ;
  setkey_(`$2',cycles,4,N)dnl
  setkey_(`$2',type,N,N)dnl
  setkey_(`$2',side,R,N)dnl
  print "cycles:m4cycles"
  print "type:m4type"
  print "side:m4side"
ifelse(
 m4type,E,
   `ebox(`$1',shift(shift(shift($@))))',
 `eleminit_(`$1')
  ifelse(m4type,N,
   `define(`m4n',`eval((m4cycles)*2)')dnl
    define(`m4h',`dimen_/24')dnl
    define(`m4v',2)dnl
    if m4h*m4n*2 > rp_len then { eleminit_(to rvec_(m4h*m4n*2,0)) }
    tr_xy_init(last line.c, m4h, ifelse(m4side,R,-))dnl
    { line from last line.start to tr_xy(-m4n,0)\
      for_(2,m4n,2,
        `then to tr_xy(eval(2*m4x-3-m4n), m4v) \
         then to tr_xy(eval(2*m4x-1-m4n),-m4v) \')dnl
      then to tr_xy(m4n, 0) then to last line.end
      [box invis ht_ m4h*m4v*2 wid_ m4h*m4n*2] at 2nd last line.c
      }',
  m4type,Q,
   `define(`m4n',`eval(2*(m4cycles))')dnl
    define(`m4h',`dimen_/24')dnl
    define(`m4v',2)dnl
    if m4h*m4n*2 > rp_len then { eleminit_(to rvec_(m4h*m4n*2,0)) }
    tr_xy_init(last line.c, m4h, ifelse(m4side,R,-))dnl
    { line from last line.start to tr_xy(-m4n,0)\
      for_(2,m4n,2,
       `then to tr_xy(eval(2*m4x-2-m4n), m4v*2) \
        then to tr_xy(eval(2*m4x-m4n),0) \')dnl
      then to tr_xy(m4n, 0) then to last line.end
      [box invis ht_ m4h*m4v*2 wid_ m4h*m4n*2] at 2nd last line.c + ta_xy(0,m4v)
      }',
  m4type,H,
   `define(`m4n',`ifelse(`$2',,5,`eval(2*$2-1)')')dnl
    define(`m4h',`dimen_/20')dnl
    define(`m4v',7/3)dnl
    if m4h*m4n*2 > rp_len then { eleminit_(to rvec_(m4h*m4n*2,0)) }
    tr_xy_init(last line.c, m4h, ifelse(m4side,R,-))dnl
    { line from last line.start to tr_xy(-m4n,0)\
      for_(-m4n,m4n,2,
       `ifelse(eval(((m4x+m4n)/2)%2),0,
         `then to tr_xy(m4x,m4v) then to tr_xy(eval(m4x+2),m4v) \',
         `then to tr_xy(m4x,0) \
          ifelse(m4x,m4n,,`then to tr_xy(eval(m4x+2),0)')\')')dnl
      then to tr_xy(m4n, 0) then to last line.end
      [box invis ht_ m4h*m4v wid_ m4h*m4n*2] at 2nd last line.c+(0,m4h*m4v/2)
      }')
  line invis from 2nd last line.start to 2nd last line.end ')

  popdef(`m4cycles')dnl
  popdef(`m4type')dnl
  popdef(`m4side')dnl
')

  xesistor(,type=E;cycles=5;)
  xesistor(,type=Q;cycles=3;side=L)
.PE
