
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%Presentamos los 4 casos que vamos a ejecutar%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%Aeronave 1
%b=[1,15,26,40,3,19,31];
%a=[7,16,22,18,4,45,34];
%optima: 1 2 7 4 5 6 3 1
%costo 57

%%%%Aeronave 2
%a=[5,2,3,10,7];
%b=[10,6,2,15,4];
% optima  1     3     4     5     2     1
%costo 10

%%%%Aeronave 3
%a=[110,15,126,40,13,19,31,33,22,77];
%b=[33,116,22,18,34,5,4,60,56,210];
%costo 146
%optima: 1     6     8    10     4     7     3     2     9     5     1

%%%%Aeronave 4
%load('matlab.mat');
%b=bgrande';
%load('matlab2.mat');
%a=Agrande';

%%%%AERONAVE DE PRUEBA
a=load('ak.csv');
a=a';
b=load('bk.csv');
b=b';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%sorteamos las b's
[b,d]=sort(b);
%n = tamaÒo de los vectores
n=length(b);


a2=zeros(1,n);

%a2 lo ordeno dado las permutaciones para ordenar b
for i= 1:length(b)
    a2(i)= a(d(i));
end

%matriz con b's y a2 ordenamos la nombre para poderla ver al final, nunca 
%la modificamos

c2=[b;a2];

[a2,d2]=sort(a2);

%matriz con b's y los ordenados, esta la modificaremos
c=[b;a2];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%Matriz de Adyacencia%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%adjacency matrix no se usa, es solo para ver 

%adjMat=zeros(n);

%for i=1:n
%    adjMat(d2(i),i)=1;
%end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%calcular vector de costos%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:(n-1)
    %dada la regla para los costos en este caso tiene costo 0
    if(a2(i)>=b(i+1) || b(i)>=a2(i+1))
        costo=0;
    %para estos casos calculamos el costo para los casos a2(i)<=b(i) y
    %a2(i+1)<=b(i+1)
    else

        if(a2(i)<=b(i))
            l1=b(i);
        else
            l1=a2(i);
        end
        
        if(a2(i+1)<=b(i+1))
            l2=a2(i+1);
        else
            l2=b(i+1);
        end
    %costo asignado
        costo=2*abs(l2-l1);
    
    end
    %costo final del arco (i,i+1)
    costo2(i)=costo;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%Colorear el numero de componentes%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%arreglo indicador de visitar
visit=zeros(1,n);
%colorea el grafo, los que estan conexos(en la misma componente) tienen el
%mismo numero
conexion=zeros(1,n);
%cuenta cuantos colores/componentes hay en el grafo
nconex=0;
cont=0;
for i=1:n
    %entra el if si no lo ha visitado
    if (visit(i)==0)
        cont=cont+1;
        nconex=nconex+1;
        %te lleva al nodo donde que manda
        visit(i)=1;
   conexion(i)=nconex;
   j=d2(i);
   %aumenta el numero de conexiones
   while visit(j)==0
       visit(j)=1;
       conexion(j)=nconex;
       j=d2(j);
   end
    end
   
end

cone=conexion;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%Unimos por medio del arco (i,i+1) para hacer conexco%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%como tenemos 'cont' conexiones necesitamos 'cont'-1 arcos para unirlos.
%Hacemos un for con 'cont'-1 ciclos para unirlos. los vamos a unir si estan
%de diferente color, es decir si estan en diferente componente

[cost2,orden2]=sort(costo2);
i=1;
j=1;
%escogi es el vector que almacena el 'i' del arco i,i+1
escogi=zeros(1,cont-1);

while(i<=(cont-1))
    
   if(conexion(orden2(j))~=conexion(orden2(j)+1))
       escogi(i)=orden2(j);
       i=i+1;
       n5=conexion(orden2(j)+1);
       for k=1:n
           if(conexion(k)==n5)
               conexion(k)=conexion(orden2(j));
           end
       end

      j=j+1;
   else
      j=j+1;
   end

end

i=0;
j=0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%Agrupamos en dos conjuntos los nuevos arcos%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


div=zeros(1,(cont-1));

for i=1:(cont-1)
   if(b(escogi(i))<=a2(escogi(i)))
      div(i)=1;
   else
       div(i)=2;
   end    
end

contDiv=0;
for i=1:(cont-1)
    if(div(i)==1)
    contDiv=contDiv+1;
    end
end
contDiv2=cont-contDiv-1;
div1=zeros(1,contDiv);
div2=zeros(1, contDiv2);
j=1;
k=1;
for i=1:(cont-1)
    if(div(i)==1)
    div1(j)=escogi(i);
    j=j+1;
    else
    div2(k)=escogi(i);
    k=k+1;
        
    end
end



div1=sort(div1,'descend');
div2=sort(div2);

divX=[div1,div2];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%Calculamos la ruta Ûptima%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vectAux1=a2;
for i=1:(cont-1)
   vectAux1(divX(i))=a2(divX(i)+1);
   vectAux1(divX(i)+1)=a2(divX(i));
   a2=vectAux1;
end

cPermut=[b;vectAux1];
c2;
j=1;
ruta=zeros(1,n+1);


ver1=zeros(1,n);
ver2=zeros(1,n);


enc=cPermut(1,1); %dato inicial 1
enc2=cPermut(2,1);%dato inicial 4

bool=0;   
i=1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

while(bool==0) %buscamos el 1 en c2
    if(c2(1,i)==enc)
        ver1(i)=1;
        ver2(i)=1;
        bool=1;
    else 
        i=i+1;
    end
end

ruta(j)=i;%obtenemos donde esta el 1, lo agregamos a la ruta
j=j+1;
plus=0;

for i=1:n
    if(cPermut(2,i)==c2(2,1))
    plus=plus+1;
    end
end
plus;
plu1=plus;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%este codigo es el que obtiene las permutaciones que obtiene las ak,bk
vectAux15=d2;
for i=1:(cont-1)
   vectAux15(divX(i))=d2(divX(i)+1);
   vectAux15(divX(i)+1)=d2(divX(i));
   d2=vectAux15;
end
d2p=d2;

visit=zeros(1,n);
conexion=zeros(1,n);
nconex=0;

cont=0;
for i=1:n
    if (visit(i)==0)
        cont=cont+1;
        nconex=nconex+1;
        visit(i)=1;
   conexion(i)=nconex;
   j=d2p(i);
   
   while visit(j)==0
       visit(j)=1;
       conexion(j)=nconex;
       j=d2p(j);
   end
    end
   
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%almacenamos la ruta en el vector ruta Optima
rutaOptima=zeros(1,n+1);
rutaOptima(1)=1;
j=1;
for i=2:n
 
rutaOptima(i)=d2p(j);
j=d2p(j);

end

rutaOptima(n+1)=1;
rutaOptima
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Calculamos los costos dada la ruta Ûptima

costo=0;
for i=1:n
    per=abs(c2(1,rutaOptima(i))-c2(2,rutaOptima(i+1)));
   costo=costo+per;
end

costo












