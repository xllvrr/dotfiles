.PS
# `Fuses.m4'
cct_init

movewid = 0.25

 {
  fuse ; {"`{\tt fuse}'" at last line.c+(0,-0.2)}
  move
  fuse(,D) ; {"`{\tt fuse(,D)}'" at last line.c+(0,-0.2)}
  move
  fuse(,B) ; {"`{\tt fuse(,B)}'" at last line.c+(0,-0.2)}
  move
  fuse(,C) ; {"`{\tt fuse(,C)}'" at last line.c+(0,-0.2)}
  move
  fuse(,S) ; {"`{\tt fuse(,S)}'" at last line.c+(0,-0.2)}
  move
  fuse(,SB) ; {"`{\tt fuse(,SB)}'" at last line.c+(0,-0.2)}
  }
  move down; right_
  {
  cbreaker; {"`{\tt cbreaker}'" at last line.c+(0,-0.25)}
  move
  cbreaker(,R); {"`{\tt cbreaker(,R)}'" at last line.c+(0,-0.25)}
  move
  cbreaker(,{,}D); {"`{\tt $\ldots$(,{,}D)}'" at last line.c+(0,-0.25)}
  move
  cbreaker(,{,}T); {"`{\tt $\ldots$(,{,}T)}'" at last line.c+(0,-0.25)}
  move
  cbreaker(,{,}TS); {"`{\tt $\ldots$(,{,}TS)}'" at last line.c+(0,-0.25) }
  }
  move down; right_
  {
  fuse(,HB) ; {"`{\tt fuse(,HB)}'" at last line.c+(0,-0.2)}
  move
  fuse(,HC,0.5,0.3) ; {"`{\tt (,HC,0.5,0.3)}'" at last line.c+(0,-0.25)}
  }

.PE
