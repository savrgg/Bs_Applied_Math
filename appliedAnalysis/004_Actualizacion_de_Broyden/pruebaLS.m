function [F,J] = pruebaLS(x)
%F escalar
%J Jacobiana

F=100*( x(1)-1)^2+(x(2)-3.5)^2;



J(1) =2*(x(1)-1);
J(2)=2*(x(2)-3.5);

J=J';

end

