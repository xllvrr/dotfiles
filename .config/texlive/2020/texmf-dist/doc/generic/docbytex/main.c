#include <stdio.h>

//: main

int main (int argc, char** argv)
{
  int i;
  inicializuj();
  pocitej();
  for (i=0; i<argc; i++) uzasna_funkce(i);
  uzasne_wokno();
  return 0;
}
 
