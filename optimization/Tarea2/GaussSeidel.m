function [xk,iter,t,suma,res]=GaussSeidel(A,b,max,u)

n=size(A);
D=zeros(n);
L=zeros(n);
U=zeros(n);

for i=1:n
    D(i,i)=A(i,i);
end

for i=1:n
    for j=i+1:n
        U(i,j)=A(i,j);
    end
end


for j=1:n
    for i=j+1:n
        L(i,j)=A(i,j);
    end
end


xk=zeros(n,1);

dis=10;
iter=0;
tic
while dis>10e-6 && iter<max
    xk1=-inv(D+L)*U*xk + (L+D)\b;  
    dis=norm(xk1-xk);
    xk=xk1;
    iter=iter+1;
end
t=toc;
suma=0;
for i=1:255 
    suma=suma+(xk1(i)-u(i))^2;
end

suma=sqrt(suma);
res=zeros(255,1);

for i=1:255
res(i)=xk1(i)-u(i);
end








