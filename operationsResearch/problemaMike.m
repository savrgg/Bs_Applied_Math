%M=csvread('maintenance_datos.csv');
%a=M(:,1)';
%b=M(:,2)';

%%%%prueba 5
a=load('ak.csv');
a=a';
b=load('bk.csv');
b=b';


%%%%prueba 1
%b=[1,15,26,40,3,19,31];
%a=[7,16,22,18,4,45,34];
%optima: 1 2 7 4 5 6 3 1
%costo 57

%%%%prueba 2
%a=[5,2,3,10,7];
%b=[10,6,2,15,4];
% optima  1     3     4     5     2     1
%costo 10

%%%%prueba 3
%a=[110,15,126,40,13,19,31,33,22,77];
%b=[33,116,22,18,34,5,4,60,56,210];
%costo 146
%optima: 1     6     8    10     4     7     3     2     9     5     1

for i=1:length(a)
    for j=1:length(a)
        Matriz(i,j)=abs(a(j)-b(i));
    end
end
for i=1:length(a)
    Matriz(i,i)=10000;
end


% Inicialización de los datos.
tic;
n=size(Matriz);
costo=100000;
camino=[];

%Ciclo sobre todos los posibles estados iniciales.
for i=1:n
    
    estadoA=i;
    caminoT=[estadoA];
    vecIndice=[1:estadoA-1 estadoA+1:n];
    costoT=0;
    
    %Recorre todos los posibles estados.
    while(isempty(vecIndice)==0)

        minv=10000;
        %Encuentra el mínimo sobre una fila.
        for j=1:length(vecIndice)

            if ( minv > Matriz(estadoA,vecIndice(j)))
                minv=Matriz(estadoA,vecIndice(j));
                mini=j;        
            end
        end
        
        %Actualización del mejor camino para un estado inicial fijo.
        costoT=costoT+minv;
        caminoT=[caminoT vecIndice(mini)];
        estadoA = vecIndice(mini);

        vecIndice = vecIndice([ 1:mini-1 mini+1:end]);

    end
    
    %Actualización del mejor camino para todos los posibles estados
    %iniciales.
    
    costoT=costoT+Matriz(caminoT(end),caminoT(1));
    caminoT=[caminoT caminoT(1)];
    if(costo>costoT)
        costo=costoT;
        camino=caminoT;
    end

end
toc