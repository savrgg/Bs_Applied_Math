#
# A very simple QP by j-l morales
#

param n:= 2;
param a:= 31;
param b{1..n};
param C{1..n,1..n};

param xinit{1..n};
var x{i in 1..n} := xinit[i];


minimize f: a +  b[1]*x[1] + b[2]*x[2] 
              +
              + 0.5*( C[1,1]*x[1] + C[1,2]*x[2] )*x[1] 
              + 0.5*( C[2,1]*x[1] + C[2,2]*x[2] )*x[2] ;

data;
param xinit := 1  1   2  1 ;
param     b := 1 10   2 10 ;
param     C :    1   2   :=
              1  2   1     
              2  1   3   ;

display f; display x; 

