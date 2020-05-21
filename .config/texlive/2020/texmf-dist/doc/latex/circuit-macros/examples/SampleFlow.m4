.PS
# SampleFlow.m4
darrow_init

boxwid = 1.9
boxht = 1.0 
linethick = 1.2

 define(`dlthick',0.25)
 define(`dfillcolor',`0.7,0.7,0.7')

 define rbox {box rad boxht/10}
 define offset { with .nw at last box.se+(-0.15,-0.125)}
 define indent { at last box.w+(0.1,0)}
 define connect {
  { Dline(from 2nd last box.s to (2nd last box,last box),E;ends=!-)
    dleft
    darrow(to last box.w) } }

 command "{\sf\huge"

 B1: rbox
  { "Sample" ljust indent "Acquisition" ljust }
 B2: rbox offset
  {"Sample" ljust indent "Checking" ljust } 
  connect
 B3: rbox offset
  {"Dimensionality" ljust indent "Sample Check" ljust } 
  connect
 B4: rbox offset
  {"Sample" ljust indent "Synthesis" ljust "Techniques" ljust } 
  connect

 command "}%"
.PE
