var x{1..8} >=.1 <=10;

minimize obj:
   .4*x[1]^.67*x[7]^-.67+.4*x[2]^.67*x[8]^-.67+10-x[1]-x[2];

s.t. c1: 1-.0588*x[5]*x[7]-.1*x[1]>=0;
s.t. c2: 1-.0588*x[6]*x[8]-.1*x[1]-.1*x[2]>=0;
s.t. c3: 1-4*x[3]/x[5]-2/(x[3]^.71*x[5])-.0588*x[7]/x[3]^1.3>=0;
s.t. c4: 1-4*x[4]/x[6]-2/(x[4]^.71*x[6])-.0588*x[8]/x[4]^1.3>=0;
s.t. c5: .4*x[1]^.67*x[7]^-.67+.4*x[2]^.67*x[8]^-.67+10-x[1]-x[2]>=.1;
s.t. c6: .4*x[1]^.67*x[7]^-.67+.4*x[2]^.67*x[8]^-.67+10-x[1]-x[2]<=4.2;

data;

let x[1] := 6  ;
let x[2] := 3  ;
let x[3] :=  .4;
let x[4] :=  .2;
let x[5] := 6  ;
let x[6] := 6  ;
let x[7] := 1  ;
let x[8] :=  .5;

display obj; 
 


display x;

display obj;

display obj-3.9511634396;















