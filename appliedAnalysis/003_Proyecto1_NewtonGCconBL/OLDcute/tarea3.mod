# AMPL Model by j.l. morales


var x {j in 1..3} >= 0;


minimize obj: -x[1] -x[2];

subject to 
       r1: x[1]       + 2*x[3]  <= 1;
       r2:       x[2] -   x[3]  <= 1;
       r3: x[1] + x[2] +  x[3]   = 2;


display x;

