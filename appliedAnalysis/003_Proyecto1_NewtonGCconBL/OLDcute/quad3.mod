#
# A very simple QP by j-l morales
#

param n:= 3;
param a:= 54;
param b{1..n};
param C{1..n,1..n};

param xinit{1..n};
var x{i in 1..n} := xinit[i];


minimize f: a +  b[1]*x[1] + b[2]*x[2] + b[3]*x[3]
              + 
              + 0.5*( C[1,1]*x[1] + C[1,2]*x[2] + C[1,3]*x[3])*x[1]
              + 0.5*( C[2,1]*x[1] + C[2,2]*x[2] + C[2,3]*x[3])*x[2]
              + 0.5*( C[3,1]*x[1] + C[3,2]*x[2] + C[3,3]*x[3])*x[3];   

data;
param xinit := 1  1   2  1   3  1;
param     b := 1 10   2 10   3 10;
param     C :    1   2   3 :=
              1  2   1   0 
              2  1   3   0
              3  0   0   2;

display f; display x; 

