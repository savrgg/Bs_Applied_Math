
param N;
param xinit{1..N};
var x{i in 1..N} := xinit[i];

minimize f:
       (1/100)*( x[2] + 100)^2 +  x[1]^2;
subject to cons1:
	x[2] - cos( x[1]) >= 0;

data;

param N:= 2;
param xinit:=
1 500 
2 0;

display f;
display x;
