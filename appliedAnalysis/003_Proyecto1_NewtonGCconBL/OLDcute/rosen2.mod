
param xinit{1..2};
var x{i in 1..2} := xinit[i];

minimize f:
	(x[2]-x[1]^2)^2/0.01+(x[1]-1)^2;
subject to 
            c1:  x[1] >= 0;
            c2:  x[2] >= 0;
            c3:  x[1] + x[2] <= 1;


data;
param xinit:= 1 0.5 2 0.3;


#display f; display x;
