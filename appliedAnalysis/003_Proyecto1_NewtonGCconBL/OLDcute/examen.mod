#
# 
#

param n:= 5;
var x{i in 1..n}>=0;


minimize f:  5*x[1]  + 4*x[2] + 3*x[3] +  4*x[2] + 3*x[3] + 2*x[4] + 1.5*x[5];
#
subject to c1: x[1]*10 + x[2]*25 + x[3]*50 + x[4]*75 + x[5]*95 = 30;
           c2: x[1]*90 + x[2]*75 + x[3]*50 + x[4]*25 + x[5]*5  = 70;
           c3: x[1]    + x[2]    + x[3]    + x[4]    + x[5]    = 1.0;

 display f; display x; 

