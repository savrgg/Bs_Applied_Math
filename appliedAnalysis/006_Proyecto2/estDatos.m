%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%La funcion estDatos crea el archivo con el parámetro b                   %
%                                                                         % 
% [ENTRADA] A = matriz train con el formato:                              % 
%           Col[VarDependiente],Col[VarInd],Col[VarInd],...,Col[VarInd]   %                
% [ENTRADA] b = string con el nombre del archivo                          %
% [ENTRADA] g = valor de la constante de penalización gamma               %
% [ENTRADA] p = numero de variables independientes                        % 
% [ENTRADA] impr = variable que decide si imprimir los resultados         % 
%                  0=no imprime, 1=imprime                                                       %  
% Ejemplo de Prueba: estDatos(train1,'trainReor1.mod',.01,30);            %
%                                                                         %    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [A] = estDatos (A,b,g,p,impr)


[n,m]=size(A);

fil=fopen(b,'w');
fprintf(fil,'param n;\n'); 
fprintf(fil,'param k:=%i;\n',p); 
fprintf(fil,'param gamma:=%d;\n',g); 
fprintf(fil,'set I :={1..n};\n'); 
fprintf(fil,'set J :={1..k};\n'); 
fprintf(fil,'param x{I,J};\n'); 
fprintf(fil,'param y{I};\n'); 
fprintf(fil,'var beta{t in 1..k+1};\n'); 
fprintf(fil,'minimize f:\n'); 
fprintf(fil,'-(sum{i in 1..n}(y[i]*log((1)/(1+exp(-beta[1]-(sum{l in 2..k+1}(beta[l]*x[i,l-1])))))+((1-y[i])*log(1-(1)/(1+exp(-beta[1]-(sum{l in 2..k+1}(beta[l]*x[i,l-1]))))))))+(gamma/2)*(sum{l in 1..k+1}beta[l]^2);\n'); 
fprintf(fil,'data;\n'); 
fprintf(fil,'param n:=%1.0i;\n',n); 
fprintf(fil, 'param x: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30:=\n');
for i = 1:n
  fprintf(fil, '%1.0f\t',i);
    for j = 2:m
        fprintf(fil, '%12.8f\t', A(i,j));
    end
    if (i==n) 
        fprintf(fil,';'); 
    end
  fprintf(fil, '\n');
end
fprintf(fil, 'param y:=\n');
for i = 1:n
    fprintf(fil, '%1.0f\t',i);
    
    fprintf(fil, '%i', A(i,1));
    if (i==n) 
        fprintf(fil,';'); 
    end
    
    fprintf(fil, '\n');
end
fclose(fil);

%%%%%%%%%%%%%%%%%%%%% si se imprimen los resultados
if(impr==1)

fprintf(1,'param n;\n'); 
fprintf(1,'param k:=%i;\n',p); 
fprintf(1,'param gamma:=%d;\n',g); 
fprintf(1,'set I :={1..n};\n'); 
fprintf(1,'set J :={1..k};\n'); 
fprintf(1,'param x{I,J};\n'); 
fprintf(1,'param y{I};\n'); 
fprintf(1,'var beta{t in 1..k+1};\n'); 
fprintf(1,'minimize f:\n'); 
fprintf(1,'-(sum{i in 1..n}(y[i]*log((1)/(1+exp(-beta[1]-(sum{l in 2..k+1}(beta[l]*x[i,l-1])))))+((1-y[i])*log(1-(1)/(1+exp(-beta[1]-(sum{l in 2..k+1}(beta[l]*x[i,l-1]))))))))+(gamma/2)*(sum{l in 1..k+1}beta[l]^2);\n'); 
fprintf(1,'data;\n'); 
fprintf(1,'param n:=%1.0i;\n',n); 
fprintf(1, 'param x: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30:=\n\n');

fprintf('Se ha creado el archivo %s en la dirección \n %s \n\n',b,pwd);
end    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end