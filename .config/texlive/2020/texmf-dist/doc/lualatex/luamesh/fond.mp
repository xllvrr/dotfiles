input svgnames;

l = 596;
h = 842;

pair A, B, C, D;

A = (0,0);
B = (l,0);
C = (l,h);
D = (0,h);

beginfig(1);

  fill (A--B--D--cycle) withcolor Moccasin;
  fill (A--C--D--cycle) withcolor Gainsboro;
  

endfig;

end
