#!/bin/bash
for datei in $1????.tex
do
   RUNS=1
   echo "LuaLaTeX-Lauf Nr. $RUNS von $datei ======================================="
   lualatex $datei
   MAIN=$(basename -a -s .tex $datei)
   TEST=`grep -c "Label(s) may have changed." $MAIN.log`
   while [ $TEST -gt 0 ]; 
   do
     let RUNS=RUNS+1
     echo "LuaLaTeX-Lauf Nr. $RUNS von $datei ======================================="
     lualatex $datei
     TEST=`grep -c "Label(s) may have changed." $MAIN.log `
     if [ $RUNS -gt 5 ]
     then TEST=0
     fi
   done
   rm $MAIN.aux $MAIN.log $MAIN.out $MAIN.toc
done
