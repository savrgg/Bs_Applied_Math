function [A] = estDatosReg (A,b)

%la matriz debe tener el siguiente formato

%primer columna:    0 si es una muestra benigna
%                   1 si es una muestra maligna

%segunda a ultima columna son las variables

%ejemplo con 5 variables

%1      45      35      3       5       3
%0      34      28      4       6       3
%1      78      91      64      3       5


%el programa estandarizara las columnas 2 a 5
fil=fopen(b,'w');
[n,m]=size(A);

for i = 2:m
    prom=mean(A(:,i));
    std1=std(A(:,i));    
    for j = 1:n    
        A(j,i) = (A(j,i)-prom)/std1;      
    end        
end





fprintf(fil,'param n;\n'); 
fprintf(fil,'param k:=30;\n'); 
fprintf(fil,'param gamma:=0.01;\n'); 
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


end