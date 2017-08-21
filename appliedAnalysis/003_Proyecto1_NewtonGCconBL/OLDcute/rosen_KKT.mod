#
param x11 :=  1;
param x12 :=  1;
param x21 :=  2;
param x22 :=  1;
param x31 :=  1;
param x32 :=  2;
param x41 :=  0;
param x42 :=  1;
param x51 :=  1;
param x52 :=  0;


var   f;
var  g1;
var  g2;
var b11;
var b12;
var b21;
var b22;
#
minimize q:
            0.5*( b11^2 + b12^2 + b21^2 + b22^2 );
subject to 

#               1        x1            x2               b11             b12              b21            b22;

            c1: f   +  g1*x11    +   g2*x12     +    b11* x11^2    + b12*x11*x12   +  b21*x11*x12  +    b22*x12^2 = 1;
            c2: f   +  g1*x21    +   g2*x22     +    b11* x21^2    + b12*x21*x22   +  b21*x21*x22  +    b22*x22^2 = 2;
            c3: f   +  g1*x31    +   g2*x32     +    b11* x31^2    + b12*x31*x32   +  b21*x31*x32  +    b22*x32^2 = 3;
            c4: f   +  g1*x41    +   g2*x42     +    b11* x41^2    + b12*x41*x42   +  b21*x41*x42  +    b22*x42^2 = 2;
            c5: f   +  g1*x51    +   g2*x52     +    b11* x51^2    + b12*x51*x52   +  b21*x51*x52  +    b22*x52^2 = 3;



