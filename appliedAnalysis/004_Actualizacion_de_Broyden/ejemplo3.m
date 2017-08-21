function [ F, J ] = ejemplo3 (x);
%
n = length(x);  F = zeros(n,1);

F(1)  = ( x(1) + 3 )*( x(2)^3 - 7 ) + 18;
F(2)  = sin( x(2)*exp(x(1)) - 1 );

%
J = [               x(2)^3 - 7                     (x(1) + 3)*3*x(2)^2               ;
     x(2)*exp(x(1))*cos( x(2)*exp(x(1)) - 1)   exp(x(1))*cos( x(2)*exp(x(1)) - 1)    ];
 