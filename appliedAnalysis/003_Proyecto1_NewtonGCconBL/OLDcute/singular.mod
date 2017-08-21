param N := 4;
param xinit{1..N};
var x{i in 1..N} := xinit[i];

#
# Powell's function (singular)
#

minimize f :   ( x[1] + 10*x[2])^2  +    5*(x[3] - x[4])^2 
             + ( x[2] -  2*x[3])^4  +   10*(x[1] - x[4])^4 ;

data;
param xinit:= 1 3    2 -1      3 0     4 1  ;
 
 display f; display x;
 
