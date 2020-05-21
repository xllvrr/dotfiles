#include <stdio.h>

//: dvojice

struct dvojice {
  float x, y;
};

//: uzasna_funkce

struct dvojice uzasna_funkce (float p)
{
  struct dvojice navrat;
  navrat.x = 2*p; // tady nasobim p dvema
  navrat.y = 3*p; // tady nasobim p tremi
  return navrat;
} 
