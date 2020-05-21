.PS
# ConfigB.m4
sinclude(Circuit_macros.dim)
s_init(ConfigB)
gen_init
  aw = linewid/2
  linewid = linewid*2/3
  "{\tt .pic}" above
  arrow <- right aw
  M4: shadebox(box wid boxht "{\tt m4}")

  arrow <- right aw
  Src: shadebox(box wid boxwid*1.85)
  s_box(Diagram source) at Src.nw above ljust
  s_box(\tt\small\shortstack[l]{%
   .PS \\
 ``include(pstricks.m4)'' \\
   cct\_init \\
   $\;\cdots$}) with .w at 0.05 between Src.w and Src.e

  arrow <- right aw from 0.35 between Src.ne and Src.se
  Conf: shadebox(box wid boxwid*2 "Configuration file" with .nw at (Here,Src.n))
  { s_box(\tt pstricks.m4) at Conf.nw above ljust }

  arrow <- right aw from Conf.e
  Gen: shadebox(box wid Conf.wid)
  s_box(\tt libgen.m4) at Gen.nw above ljust
  s_box(\tt\small\shortstack[l]{%
   $\;\cdots$ \\
   ``define(\char96cct\_init\char39,...)'' \\
   $\;\cdots$}) with .w at 0.05 between Gen.w and Gen.e

  Cct: shadebox(box wid Conf.wid with .nw at Conf.sw+(0,-0.25))
  s_box(\tt libcct.m4) at Cct.nw above ljust
  s_box(\tt\small\shortstack[l]{%
   $\;\cdots$ \\
   ``define(\char96resistor\char39,...)'' \\
   $\;\cdots$}) with .w at 0.05 between Cct.w and Cct.e
  dw =(Conf.w.x-Src.e.x)/2
  arrow from Cct.w left dw then up Src.y-Cct.y-0.05 then left dw

.PE
