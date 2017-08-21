%Necesitamos:
%PruebaLS.m que contiene la funcion y la jacobiana
%funciones que contiene las funciones de prueba
%ejemplo1.m, ejemplo2.m, ejemplo3.m

%mandar llamar con 
%Broyden(x0,pruebaLS.m)

function [B,x,norma]  =  Broyden(x0,funder)
tol = 10e-7;
k = 0;
[F,B] = feval(funder,x0);

x = x0;
norma(1) = norm(F);
fprintf(1,'It.\t NormaF \n')

while ( norma>tol)
    p = B\(-F);
    x1 = x+p;
    [F1,] = feval(funder,x1);
    y = F1-F;
    s = x1-x;
    B = B+((y-B*s)*s')./(s'*s);
    x = x1;
    F = F1;
    k = k+1;
    norma (k+1)= norm(F);
    
    fprintf(1,'%3i \t %8.2e \n', k, norma)
   
end
[F,J] = feval(funder,x)

end



 
