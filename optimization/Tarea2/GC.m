function [xk1,iter,t,suma,res]=GC(A,b,max,u)

%%%inicializamos variables
n=size(A);
xk=zeros(n,1);
rk=A*xk-b;
pk=-rk;
iter=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
suma=0;
tic

while norm(rk)>10e-6 && iter < (max+1)
    alpha=-(rk'*pk)/(pk'*A*pk);
    
    xk1=xk+alpha*pk;
    rk1=rk+alpha*A*pk;
    
    
    bk1=(rk1'*rk1)/(rk'*A*rk);
    pk1=-rk1+bk1*pk;
    pk=pk1;
    rk=rk1;
    xk=xk1;
    iter=iter+1;
    
    
end
t=toc;
for i=1:255 
    suma=suma+(xk1(i)-u(i))^2;
end
suma=sqrt(suma);
res=zeros(255,1);

for i=1:255
res(i)=xk1(i)-u(i);
end



