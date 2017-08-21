function [ F, J ] = ejemplo1 (x);

n = length(x);  F = zeros(n,1);
%
F(1)  = x(1)^2 + x(2)^2 - 2;
F(2)  = exp(x(1)-1) + x(2)^3 - 2;

%
J = [   2*x(1)      2*x(2)    ;
     exp(x(1)-1)  3*x(2)^2   ];
%