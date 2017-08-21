%b=[1,15,26,40,3,19,31];
%a=[7,16,22,18,4,45,34];
%costo 57

%a=[5,2,3,10,7];
%b=[10,6,2,15,4];
%costo 10

a=[110,15,126,40,13,19,31,33,22,77];
b=[33,116,22,18,34,5,4,60,56,210];
%costo 146


%load('matlab.mat');
%b=bgrande';
%load('matlab2.mat');
%a=Agrande';


[b,d]=sort(b);
n=length(b);

a2=zeros(1,n);
for i= 1:length(b)
    a2(i)= a(d(i));
end

%d APLICAR INVERSA DE SORTEO AL FINAL
c2=[b;a2];

[a2,d2]=sort(a2);


%c=[b;a2;d2];
c=[b;a2];



%adjacency matrix

adjMat=zeros(n);

for i=1:n
    adjMat(d2(i),i)=1;
end


for i=1:(n-1)
    if(a2(i)>=b(i+1) || b(i)>=a2(i+1))
        costo=0;
    
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
    
        costo=2*abs(l2-l1);
    
    end
    costo2(i)=costo;
end

%contamos el numero de componentes que hay
%lo nombramos como cont

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
   j=d2(i);
   
   while visit(j)==0
       visit(j)=1;
       conexion(j)=nconex;
       j=d2(j);
   end
    end
   
end



%tenemos que hacer cont-1 nuevas conexiones para que nuestro grafo sea
%conexo

[cost2,orden2]=sort(costo2);
i=1;
j=1;
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


%dividir a escogi en dos grupos

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
%c2 matriz original sorteada
%c matriz auxiliar para calcular costos

%modificacion matriz auxiliar
%c3= nueva matriz auxiliar

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




enc=cPermut(1,1); %dato inicial 1
enc2=cPermut(2,1);%dato inicial 4

bool=0;   
i=1;
while(bool==0) %buscamos el 1 en c2
    if(c2(1,i)==enc)
        bool=1;
    else 
        i=i+1;
    end
end

ruta(j)=i;%obtenemos donde esta el 1, lo agregamos a la ruta
j=j+1;



%ciclo

for l=1:(n-1)

i=1; %buscamos donde esta el 4 en c2
bool=0;
while(bool==0)
    if(c2(2,i)==enc2)
        bool=1;
    else 
        i=i+1;
    end
end
ruta(j)=i;%encontramos donde esta y lo metemos a la ruta




enc=c2(1,i);

bool=0;   %ponemos el 3 en cPermut
i=1;
while(bool==0)
    if(cPermut(1,i)==enc)
        bool=1;
    else 
        i=i+1;
    end
end

enc2=cPermut(2,i); %sacamos el valor de cPermut
j=j+1;





end

ruta(n+1)=ruta(1);


%calculamos los costos

costo=0;
for i=1:n
    per=abs(c2(1,ruta(i))-c2(2,ruta(i+1)));
   costo=costo+per;
end

costo






