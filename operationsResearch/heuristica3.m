
function[]=heuristica3(P,R,S,V)

%donde R es el número de pistas

E=V(:,2);
T=V(:,3);
L=V(:,4);
g=V(:,5);
h=V(:,6);

%max(max(x(A(setdiff([1 2 3],[2]),:))))


%A1=[];
%A2=[];
%A3=[];
B=zeros(3,1);
x=[];
c1=zeros(1,3);
[T2,m]=sort(T);

j=1;

x=T2;
A(1,1) =m(1);
A(1,2)=m(4);
A(1,3)=m(7);

A(2,1)=m(2);
A(2,2)=m(5);
A(2,3)=m(8);

A(3,1)=m(3);
A(3,2)=m(6);
A(3,3)=m(9);







for j=2:P;
    for r=1:R
        max1=T2(j)
      
        
        A1=[A(1,1) A(1,2) A(1,3)];
        A2=[A(2,1) A(2,2) A(2,3)];
        A3=[A(3,1) A(3,2) A(3,3)];
        A=[A1; A2; A3];
        %pause
        d1=x(A1)+S(A1,j);
        d2=x(A2)+S(A2,j);
        d3=x(A3)+S(A3,j);

        
        max2=max(x(A(r,:))+S(A(r,:),m(j)))
       
        max3=max(max(x(A(setdiff([1 2 3],[r]),:))))
        
        
        B(r)=max(max1,max(max2,max3))
        
        pause
    end
    
        
end 
        
        