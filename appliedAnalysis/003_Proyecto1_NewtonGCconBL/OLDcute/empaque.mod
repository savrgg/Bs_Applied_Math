# AMPL Model by j.l. morales


var x {j in 1..3} >= 1;


minimize obj:- x[1]*x[2]*x[3];

subject to 
       r1: x[1] + 2*(  x[2] + x[3] )  <= 72;
       r2:       x[1]  <= 42;
       r3:       x[2]  <= 42;
       r4:       x[3]  <= 42;

display x;

