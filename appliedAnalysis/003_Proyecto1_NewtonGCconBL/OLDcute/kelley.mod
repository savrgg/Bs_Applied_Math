#
# A perturbed QP by c t kelley.  n = 4
#
param n := 4;
param pi:= 3.14159265358979;
param a_1:= 0.01;
param a_2:= 0.01;
#
param b_1{1..n};
param b_2{1..n};
#
param c_1:= 10*pi;
param c_2:= c_1;
#
param xsi_0{1..n};
param xsi_1{1..n};
param xsi_2{1..n};
#
param H{1..n};
param xinit{1..n};
var x{i in 1..n} := xinit[i];


minimize f: (sum{i in 1 ..n} H[i]*( x[i] - xsi_0[i] )^2)
                  *( 1 + a_1*cos(  sum{i in 1..n} b_1[i]*( x[i] - xsi_1[i] ) + 
                     c_1*sum{i in 1..n} ( x[i] - xsi_1[i])^2  ))        
              +
              a_2*( 1 +     cos(  sum{i in 1..n} b_2[i]*( x[i] - xsi_2[i] ) + 
                     c_2*sum{i in 1..n} ( x[i] - xsi_2[i])^2  ));        
data;
#param xinit := 1   0.025  
#               2   0.05   
#               3   0.075
#               4   0.1  ;

param xinit := 1   -2.5  
               2   -5.0   
               3   -7.5
               4   -10.0  ;

#param xinit := 1   -250  
#               2   -500   
#               3   -750
#               4   -1000 ;

param b_1 :=   1  1
               2  1   
               3  1
               4  1 ;

param b_2 :=   1  0
               2  0  
               3  0
               4  0 ;

param xsi_0 := 1  0.84147098480790 
               2  0.90929742682568
               3  0.14112000805987
               4 -0.75680249530793 ;

param xsi_1 := 1  0
               2  0   
               3  0
               4  0 ;

param xsi_2 := 1  1
               2  1   
               3  1
               4  1 ;

param  H    := 1  0.5
               2  0.25
               3  0.166666667
               4  0.125;

 display f; display x; 

