function [x1, porc,test1]=pruebaEXTREMA (gamma,corte,tamTest, nvar,reor,pathAmpl)
%PARA PROBAR EN UNO DE ESTOS DOS CASOS:
%1) probar un caso a mano en matlab
%2) probar con el script
%3) ESTA VERSIÒN ESTA APTA PARA EXPORTAR EN PDF, USAR REGL()

% Parámetros de Entrada y Salida

% [ENTRADA] gamma = valor para regularizar 
%
% [ENTRADA] corte = el valor de probabilidad para el cual aceptaremos entre (0,1)
%
% [ENTRADA] tamTrain = porcentaje que queremos que sea de test
%
% [ENTRADA] nvar = el numero de variables independientes
%
% [ENTRADA] reor = para sacar la muestra aleatoriamente (0=no aleat,1=aleat)
%
% [ENTRADA] pathAmpl = path de los programas de ampl
%
% [SALIDA] x1 = valor de las betas que toma el modelo
%
% [SALIDA] porc = porcentaje de aciertos que tuvo el modelo


% Paths que necesitaremos a lo largo del programa:
%Path de ampl:
    path(path,pathAmpl);   
%Path de nuestro trabajo
    work=pwd;
    
    
    

% Automatizar creación del archivo *.mod 

[train1,test1,ntrain1,ntest1] = wdbcData('Segundo',nvar,tamTest,reor);
%fprintf('el tamaño del conjunto de entrenamiento es : %i \n',ntrain1) 
%fprintf('el tamaño del conjunto de test es : %i \n',ntest1) 

n10=20;
xx=linspace(0,5,n10);
porc=zeros(n10,1);

for u=1:n10
    fil2 = fopen( 'LIST_large2', 'w' );
estDatos(train1,'trainReor1.mod',xx(u),nvar);
fprintf(fil2,'trainReor1 \n');
fclose(fil2);

% Automatizar creación del archivo *.nl
writePerl(work);
perl('rCUTE');
%fprintf('Se ha creado el archivo trainReor1.nl en la dirección');
use_ampl_stub trainReor1.nl;

% Encontrar las Betas
x1=Newton1pruebas ('amplpnt','amplstub', 'trainReor1', 50);
% Valor de la función y gradiente en el óptimo:

% Comparar con el test y los resultados originales
Orig=test1(:,1);
resul=zeros(ntest1,1);
%test1(:,1)=ones(ntest1,1);
suma=0;
for i=1:ntest1
    
b=x1(1)+x1(2:nvar+1)'*test1(i,2:nvar+1)';
valor = 1/(1+exp(-b));
    %if valor >= corte
    %    resul(i)=1;
    %end
    
    %if(Orig(i)~=resul(i))
    %   suma=suma+1;
    %end
   
    suma= suma + (valor-Orig(i))^2;

    porc(u)=suma;
    %porc(u)=suma/ntest1;
%fprintf('El porcentaje de predicción es: %5.4f \n', porc) 


end

plot(xx,porc);


end


