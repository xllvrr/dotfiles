.PS
# `FusesSVG.m4'
cct_init(svg_font(sans-serif,11bp__))

movewid = 0.25

 {fuse ; {"`fuse'" at last line.c+(0,-0.2)}
  move
  fuse(,D) ; {"`fuse(,D)'" at last line.c+(0,-0.2)}
  move
  fuse(,B) ; {"`fuse(,B)'" at last line.c+(0,-0.2)}
  move
  fuse(,C) ; {"`fuse(,C)'" at last line.c+(0,-0.2)}
  move
  fuse(,S) ; {"`fuse(,S)'" at last line.c+(0,-0.2)}
  move
  fuse(,SB) ; {"`fuse(,SB)'" at last line.c+(0,-0.2)}
  }
  move down; right_
  {
  cbreaker; {"`cbreaker'" at last line.c+(0,-0.25)}
  move
  cbreaker(,R); {"`cbreaker(,R)'" at last line.c+(0,-0.25)}
  move
  cbreaker(,,D); {"`...(,,D)'" at last line.c+(0,-0.25)}
  move
  cbreaker(,,T); {"`...(,,T)'" at last line.c+(0,-0.25)}
  move
  cbreaker(,,TS); {"`...(,,TS)'" at last line.c+(0,-0.25)}
  }
  move down; right_
  {
  fuse(,HB) ; {"`fuse(,HB)'" at last line.c+(0,-0.2)}
  move
  fuse(,HC,0.5,0.3) ; {"`(,HC,0.5,0.3)'" ljust at last line.start+(0,-0.25)}
  }

 command "</g>" # end font
.PE
