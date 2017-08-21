param npts := 40;
param price{1..npts};
var a := 0.2;
var b := 0.2;
var k := 0.1;
                                                                                                     
minimize f:
        sum {i in 1..npts}
            ( -(b/a) + k*exp(a*(i-1)) - price[i] )^2;

data;
param price :=
1 0.35 
2 0.38 
3 0.29 
4 0.45 
5 0.61 
6 0.69 
7 1    
8 0.88 
9 0.8  
10 0.91  
11 0.97  
12 1.08  
13 1.18  
14 1.15   
15 1.2  
16 1.27  
17 1.29  
18 1.4  
19 1.41 
20 1.52  
21 1.54 
22 1.58  
23 1.6  
24 1.61  
25 1.61 
26 1.63  
27 1.64 
28 1.67 
29 1.7  
30 1.7   
31 1.73 
32 2.23  
33 2.23  
34 2.23  
35 2.23  
36 2.23  
37 2.36  
38 5.81  
39 5.81  
40 5.85 ;


display f;
