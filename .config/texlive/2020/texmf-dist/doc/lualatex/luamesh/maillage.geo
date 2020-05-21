// Gmsh project created on Tue Nov 29 22:45:35 2016
Point(1) = {0, 0, 0, .5};
Point(2) = {3, 0, 0, .5};
Point(3) = {0, 3, 0, .5};
Circle(1) = {3, 1, 2};
Line(2) = {1, 3};
Line(3) = {2, 1};
Line Loop (1) = {1,3,2};
Plane Surface (6) = {1};
