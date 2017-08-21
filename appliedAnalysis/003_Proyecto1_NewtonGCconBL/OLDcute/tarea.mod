param x1;
param x2;

var x_1 := x1;
var x_2 := x2;

minimize f:
           -2*x_1 + x_2;
subject to const:
         (1-x_1)^3 + x_2  = 0;

data;
param x1 = 1;
param x2 = 1;



display f;
display x_1;
display x_2;
