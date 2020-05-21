.PS
# ConfigA.m4
sinclude(Circuit_macros.dim)
s_init(ConfigA)
gen_init
  "{\tt .pic}" above
  arrow <-
  M4: shadebox(box wid boxht "{\tt m4}")

  arrow <-
  Conf: shadebox(box wid boxwid*2 "Configuration file")
  s_box(\tt pstricks.m4) at Conf.nw above ljust

  arrow <- from Conf.e
  Gen: shadebox(box wid boxwid*2.25)
  s_box(\tt libgen.m4) at Gen.nw above ljust
  s_box(\tt\small\shortstack[l]{%
   $\;\cdots$ \\
   ``define(\char96cct\_init\char39,...)'' \\
   $\;\cdots$}) with .w at 0.05 between Gen.w and Gen.e

  Src: shadebox(box ht Gen.ht wid Conf.wid with .nw at Conf.sw+(0,-0.25))
  s_box(Diagram source {\tt quick.m4}) at Src.nw above ljust
  s_box(\tt\small\shortstack[l]{%
   .PS \\
   cct\_init \\
   $\;\cdots$}) with .w at 0.05 between Src.w and Src.e
  arrow from Src.w left linewid/2 then up M4.y-Src.y-M4.ht/4 then left linewid/2

  arrow <- right from Src.e
  Cct: shadebox(box wid boxwid*2.25)
  s_box(\tt libcct.m4) at Cct.nw above ljust
  s_box(\tt\small\shortstack[l]{%
   $\;\cdots$ \\
   ``define(\char96resistor\char39,...)'' \\
   $\;\cdots$}) with .w at 0.05 between Cct.w and Cct.e

.PE
