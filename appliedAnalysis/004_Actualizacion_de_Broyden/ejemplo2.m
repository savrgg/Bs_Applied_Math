%
function [ F, J ] = ejemplo2 (x);
%
n = length(x);  F = zeros(n,1);

F(1)  = x(1)   + x(2)   - 3;
F(2)  = x(1)^2 + x(2)^2 - 9;

%
J = [      1     1      ;
        2*x(1) 2*x(2)  ];
%