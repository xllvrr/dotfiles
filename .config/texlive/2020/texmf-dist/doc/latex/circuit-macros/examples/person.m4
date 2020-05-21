.PS
# person.m4
gen_init

divert(-1)
                                    `person(
                                       height=val;width=val;fill="colorname")
                                     e.g. person(height=1;fill="gray")'
define(`person',`[ setkey_(`$1',height,linewid)
  setkey_(`$1',width,m4height*2/5)dnl
  setkey_(`$1',fill,"black",N)dnl
  bodywid = m4width/2
  bodyrad = bodywid/8
  bodyht = (m4height - bodywid - bodywid/16 + bodyrad*2)/2
  tmplth = linethick; linethick = 0
  Head: circle diam bodywid colored m4fill
  Body: box rad bodyrad ht bodyht wid bodywid colored m4fill  \
   with .n at Head.s+(0,-Head.diam/16)
  armwid = bodywid/3
  Armleft: box wid armwid rad armwid/2 ht Body.ht-bodyrad colored m4fill \
    with .w at Body.e + (armwid/2,0) 
  Armright: box same with .e at Body.w + (-armwid/2,0) 
  Legleft: box wid bodywid/2.5 rad armwid/2 ht Body.ht colored m4fill \
    with .n at (Body.w,Body.s)+(bodywid/5,bodyrad*2)
  Legright: box same with .n at (Body.e,Body.s)+(-bodywid/5,bodyrad*2)
  linethick_(tmplth)
  popdef(`m4height',`m4fill')dnl
  ]')

divert(0)dnl

  linewid = 3*linewid

  setrgb(0.54,0.81,0.94,babyblue)
  person(fill="babyblue")
  person(width=linewid*3/4;fill="babyblue")
  person(width=linewid;fill="babyblue")
  person
  resetrgb
  person(height=1;fill="gray")

  line up linewid with .c at last [].e+(linewid/10,0)
.PE
