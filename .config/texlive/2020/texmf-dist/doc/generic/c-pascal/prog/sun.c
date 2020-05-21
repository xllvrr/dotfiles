#include <stdio.h>
#include <math.h>

int months[]={0, 31, 28, 31, 30, 31, 30,
              31, 31, 30, 31, 30, 31};
char weekdays[7][15]={"Sunday", "Monday", "Tuesday", "Wednesday",
                      "Thursday", "Friday", "Saturday"};

/* this program calculates the latidude
   where polar day begins/ends */
void main()
{
  int day=24, month=6, weekday=2;
  double angle=0;
  double latitude;

  do
  {
    latitude=atan(tan((23+27.0/60)*M_PI/180)*cos(angle))*180/M_PI;
    latitude=(latitude>0)? 90-latitude : -90-latitude;
    printf("%2d.%02d %12s : %d %02d'\n", day, month,
                weekdays[weekday], (int)latitude,
                (int)fabs((latitude-(int)latitude)*60));
    if (weekday==0)
      printf("\n");

    angle+=2*M_PI/365;
    day++;
    if (day>months[month])
    {
      day=1;
      month++;
      if (month>12)
        month=1;
    }
    if (++weekday>6)
      weekday=0;
  } while (month!=1);
}
