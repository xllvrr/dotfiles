.PS
gen_init

divert(-1)
dnl Should this macro be in libgen.m4 or would that be just adding clutter?

                               `squiggle(linespec,
                                         amplitude,wavelength,attributes)'
                               `squiggly line (sinusoid), e.g.
                                  squiggle(up_ 1 right_ 2,,,outlined "red")'
define(`squiggle',`rpoint_(ifelse(`$1',,linewid,`$1'))
  m4dist = lin_leng(last line)
  m4cycles = int(m4dist/(ifelse(`$3',,0.25*scale,`$3'))+0.5)
  define(`squiggleampl',`ifelse(`$2',,0.04*scale,`$2')')dnl
  define(`squigglefreq',`(twopi_*m4cycles/m4dist)')dnl
  sinusoid(squiggleampl,squigglefreq,-twopi_/4,0,m4dist,`$4') \
    with .Origin at last line.start
  move to last line.end')
divert(0)dnl

squiggle(up_ 1 right_ 2,,,outlined "red")
squiggle(up 2 right_ 2,0.1,0.15,outlined "red" <-> wid 0.06 ht 0.05)
squiggle(right_ 1,,,dotted outlined "blue" wid 0.06 ht 0.05)

.PE
