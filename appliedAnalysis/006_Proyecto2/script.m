
%% Resultados en función de gamma
% consideraremos que siempre tomamos muestras reordenadas
% tomando la funcion del PDF anterior, hacemos un ciclo sobre la gamma y
% obtenemos los siguientes resultados:
% podemos hacer busquedas en un intervalo de gamma, de valor de corte o
% bien del porcentaje de entrenamiento, podemos elegir si queremos que la
% muestra la tome aleatoriamente o solo los primeros valores.
%
% El programa toma por default para crear los archivos *.mod y *.nl la
% ruta donde se encuentran los programas, y necesita que la base de datos
% se encuentre en el mismo directorio con el formato presentado
% anteriormente
o=10;
porc = zeros(o+1,1);
xx=linspace(0,0.1,o+1);


for i=0:o
    %suma=0;
    %for j =0:10
    %    [x1, y]=regL2 (((i+1)/100),.5,.1, 30,1,'/bin/AMPL/');       
    %    suma=suma+y;
    %end    
    %porc(i+1)=suma/11;
    
    
    [x1, porc(i+1)]=regL2 (((i+1)/(o+1)),.5,.1, 30,1,'/bin/AMPL/');
    %fprintf('evaluando iteracion %i de %i\n',i,o);
end
plot(xx,porc)
title('Predicción en función de gamma');
%}


