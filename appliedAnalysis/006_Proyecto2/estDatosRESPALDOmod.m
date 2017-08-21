function [A] = estDatosRESPALDOmod (A,b,g,p)

%la matriz debe tener el siguiente formato

%primer columna:    0 si es una muestra benigna
%                   1 si es una muestra maligna

%segunda a ultima columna son las variables

%ejemplo con 5 variables

%1      45      35      3       5       3
%0      34      28      4       6       3
%1      78      91      64      3       5


fil=fopen(b,'w');
[n,m]=size(A);

fprintf(fil,'param n;\n'); 
fprintf(fil,'param p:=%i;\n',p); 
fprintf(fil,'param gamma:=%d;\n',g); 
fprintf(fil,'set I :={1..n};\n'); 
fprintf(fil,'set J :={1..p};\n'); 
fprintf(fil,'param x{I,J};\n'); 
fprintf(fil,'param y{I};\n'); 
fprintf(fil,'var beta{t in 1..p+1};\n'); 
fprintf(fil,'minimize f:\n'); 
fprintf(fil,'-sum{i in 1..n} (y[i]*(beta[1]+ (sum{k in 1..p}(beta[k+1]*x[i,k])))) + sum{i in 1..n} ( log(1 + exp(beta[1]+ (sum{k in 1..p}(beta[k+1]*x[i,k])))))++(gamma/2)*(sum{j in 1..p+1}beta[j]^2);\n'); 
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

%fprintf('Se ha creado el archivo %s en la direcci�n \n %s \n',b,pwd);

end