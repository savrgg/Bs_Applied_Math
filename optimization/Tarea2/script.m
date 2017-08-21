%a=0;
%b=1;
%A=zeros(255);
%for i=1:254
%   A(i,i)=2;
%   A(i,i+1)=-1;
%   A(i+1,i)=-1;
%end
%A(255,255)=2;


%d=1/256;
%d2=d*d;
%for i=1:254
%b(i)=-d*2;
%end
%b(255)=1;

u=A\b;


%[xk,iter,toc,suma,res]=GC(A,b,262144,u);
%suma2=max(res);
%toc
%suma
%suma2

%[xk,iter,toc,suma,res]=GaussSeidel(A,b,16384,u);
%suma2=max(res);
%iter
%toc
%suma
%suma2
%x=linspace(1,255,255);

%[xk,iter,toc,suma,res]=Jacobi(A,b,262144,u);
%suma2=max(res);
%iter
%toc
%suma
%suma2

%{
hold on
x=linspace(1,255,255);
plot(x,u,'r')
title('Jacobi')
[xk,iter,toc,suma,res]=Jacobi(A,b,16,u);
plot(x,xk,'b')
[xk,iter,toc,suma,res]=Jacobi(A,b,64,u);
plot(x,xk,'b')
[xk,iter,toc,suma,res]=Jacobi(A,b,256,u);
plot(x,xk,'b')
[xk,iter,toc,suma,res]=Jacobi(A,b,1024,u);
plot(x,xk,'b')
[xk,iter,toc,suma,res]=Jacobi(A,b,16384,u);
plot(x,xk,'b')
hold off
%}


%{
hold on
x=linspace(1,255,255);
plot(x,u,'r')
title('GaussSeidel')
[xk,iter,toc,suma,res]=GaussSeidel(A,b,16,u);
plot(x,xk,'b')
[xk,iter,toc,suma,res]=GaussSeidel(A,b,64,u);
plot(x,xk,'b')
[xk,iter,toc,suma,res]=GaussSeidel(A,b,256,u);
plot(x,xk,'b')
[xk,iter,toc,suma,res]=GaussSeidel(A,b,1024,u);
plot(x,xk,'b')
[xk,iter,toc,suma,res]=GaussSeidel(A,b,16384,u);
plot(x,xk,'b')
hold off
%}
%{
hold on
x=linspace(1,255,255);
plot(x,u,'r')
title('Gradiente Conjugado')
[xk,iter,toc,suma,res]=GC(A,b,16,u);
plot(x,xk,'b')
[xk,iter,toc,suma,res]=GC(A,b,64,u);
plot(x,xk,'b')
[xk,iter,toc,suma,res]=GC(A,b,256,u);
plot(x,xk,'b')
[xk,iter,toc,suma,res]=GC(A,b,1024,u);
plot(x,xk,'b')
[xk,iter,toc,suma,res]=GC(A,b,16384,u);
plot(x,xk,'b')
[xk,iter,toc,suma,res]=GC(A,b,65536,u);
plot(x,xk,'b')
hold off
%}