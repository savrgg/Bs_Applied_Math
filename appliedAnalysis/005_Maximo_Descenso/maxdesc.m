

function [] = maxdesc()  %x0 vector columna

clc
clear
%caso con una matrix bien condicionada punto inicial aleatorio

tol= 10e-10;

fprintf('/////////////////////////////////////////////////////////////////\n');
fprintf('////////Caso bien Condicionado con punto inicial aleatorio///////\n');
fprintf('/////////////////////////////////////////////////////////////////\n\n\n');

Q=gallery('lehmer', 2);
C=cond(Q);
iter=1;

xk=5*rand(2,1); %%
array1=[];      %%
array2=[];      %%
array1(1)=xk(1);%%
array2(1)=xk(2);%%



fprintf('El número de condicionamiento de la matriz es: %i \n\n', C);

fprintf('iteracion\tvalorX\t\tclcvalorFx\talpha\n');


while(iter<1000 && (xk'*Q)*(Q*xk)> tol)

    
pk=-(Q*xk);
alpha= (pk'*pk)/(pk'*Q*pk);
xk=xk+alpha*pk;
    array1(iter+1)=xk(1);%%
    array2(iter+1)=xk(2);%%
iter=iter+1;
F = xk'*Q*xk;

fprintf('%f\t%f\t%f\t%f\n',(iter-1), xk, F, alpha);





end  
iter=iter-1;
fprintf('\nEl método terminó en %i iteraciones', iter);
fprintf('\n\n\n\n\n\n');

[y1,y2]=meshgrid(-2:.1:2);%%
Z=( y1.^2*Q(1,1) + y1.*y2*Q(1,2) + y1.*y2*Q(2,1) + y2.^2*Q(2,2) );%%

subplot(2,3,1);%%
hold on%%
    contour(y1,y2,Z,30);%%
    plot(array1,array2,'bx');%%
    plot(array1,array2,'b');%%
    title('Bien Condicionado, x0=aleatorio');%%
    xlim([-2,2]);%%
    ylim([-2,2]);%%
    
    
hold off%%

%caso bien condicionado con punto inicial paralelo al eigenvector

fprintf('/////////////////////////////////////////////////////////////////\n');
fprintf('////////Caso bien Condicionado punto inicial eigenvector/////////\n');
fprintf('/////////////////////////////////////////////////////////////////\n\n\n');
Q=gallery('lehmer', 2);
C=cond(Q);
[q1,q2]=eig(Q);
xk=5*q1(:,1);
fprintf('El número de condicionamiento de la matriz es: %i \n\n', C);
iter=1;


array1=[];      %%
array2=[];      %%
array1(1)=xk(1);%%
array2(1)=xk(2);%%

while(iter<1000 && (xk'*Q)*(Q*xk)> tol)

    
pk=-(Q*xk);
alpha= (pk'*pk)/(pk'*Q*pk);
xk=xk+alpha*pk;
     array1(iter+1)=xk(1);%%
    array2(iter+1)=xk(2);%%
iter=iter+1;
F = xk'*Q*xk;

fprintf('%i\t\t%d\t%d\t%d\n'  ,(iter-1), xk, F, alpha);



end  
iter=iter-1;
fprintf('\nEl método terminó en %i iteraciones', iter);

fprintf('\n\n\n\n\n\n');

[y1,y2]=meshgrid(-2:.1:2);%%
Z=( y1.^2*Q(1,1) + y1.*y2*Q(1,2) + y1.*y2*Q(2,1) + y2.^2*Q(2,2) );%%

subplot(2,3,2);%%
hold on%%
    contour(y1,y2,Z,30);%%
    plot(array1,array2,'bx');%%
    plot(array1,array2,'b');%%
    title('Bien Condicionado, x0=eigenvector');%%
    xlim([-2,2]);%%
    ylim([-2,2]);%%
    
    
hold off%%

fprintf('/////////////////////////////////////////////////////////////////\n');
fprintf('////////Caso mal Condicionado punto inicial eigenvector/////////\n');
fprintf('/////////////////////////////////////////////////////////////////\n\n\n');


Q=[500,0;0,1];
C=cond(Q);
[q1,q2]=eig(Q);
xk=5*q1(:,1);

array1=[];      %%
array2=[];      %%
array1(1)=xk(1);%%
array2(1)=xk(2);%%

fprintf('El número de condicionamiento de la matriz es: %i \n\n', C);
iter=1;

while(iter<1000 && (xk'*Q)*(Q*xk)> tol)

    
pk=-(Q*xk);
alpha= (pk'*pk)/(pk'*Q*pk);
xk=xk+alpha*pk;
    array1(iter+1)=xk(1);%%
    array2(iter+1)=xk(2);%%
iter=iter+1;
F = xk'*Q*xk;

fprintf('%i\t\t%d\t%d\t%d\n'  ,(iter-1), xk, F, alpha);



end 
iter=iter-1;

fprintf('\nEl método terminó en %i iteraciones', iter);

fprintf('\n\n\n\n\n\n');
[y1,y2]=meshgrid(-2:.1:2);%%
Z=( y1.^2*Q(1,1) + y1.*y2*Q(1,2) + y1.*y2*Q(2,1) + y2.^2*Q(2,2) );%%

subplot(2,3,3);%%
hold on%%
    contour(y1,y2,Z,10);%%
    plot(array1,array2,'bx');%%
    plot(array1,array2,'b');%%
    title('Mal Condicionado, x0=eigenvector');%%
    xlim([-2,2]);%%
    ylim([-2,2]);%%
    
    
hold off%%


fprintf('/////////////////////////////////////////////////////////////////\n');
fprintf('///Caso mal Condicionado punto inicial cerca del eigenvector/////\n');
fprintf('/////Tomamos el eigenvector asociado al eigenvalor mas alto//////\n');
fprintf('/////////////////////////////////////////////////////////////////\n\n\n');


Q=[500,0;0,1];
C=cond(Q);
[q1,q2]=eig(Q);
xk=q1(:,1)+.01;
array1=[];      %%
array2=[];      %%
array1(1)=xk(1);%%
array2(1)=xk(2);%%


fprintf('El número de condicionamiento de la matriz es: %i \n\n', C);
iter=0;

while(iter<1000 && (xk'*Q)*(Q*xk)> tol)

    
pk=-(Q*xk);
alpha= (pk'*pk)/(pk'*Q*pk);
xk=xk+alpha*pk;
array1(iter+1)=xk(1);%%
    array2(iter+1)=xk(2);%%
iter=iter+1;
F = xk'*Q*xk;

fprintf('%i\t\t%d\t%d\t%d\n'  ,(iter-1), xk, F, alpha);



end  

fprintf('\nEl método terminó en %i iteraciones', iter);

fprintf('\n\n\n\n\n\n');

[y1,y2]=meshgrid(-.2:.01:.2);%%
Z=( y1.^2*Q(1,1) + y1.*y2*Q(1,2) + y1.*y2*Q(2,1) + y2.^2*Q(2,2) );%%

subplot(2,3,4);%%
hold on%%
    contour(y1,y2,Z,10);%%
    plot(array1,array2,'bx');%%
    plot(array1,array2,'b');%%
    title('MalCond,x0=Cerca eigMayor');%%
    xlim([-.2,.2]);%%
    ylim([-.2,.2]);%%
    
    
hold off%%

fprintf('/////////////////////////////////////////////////////////////////\n');
fprintf('///Caso mal Condicionado punto inicial cerca del eigenvector/////\n');
fprintf('//Tomamos el eigenvector asociado al segundo eigvalor mas alto///\n');
fprintf('/////////////////////////////////////////////////////////////////\n\n\n');







Q=[500,0;0,1];
C=cond(Q);
[q1,q2]=eig(Q);
xk=q1(:,2)+.01;
array1=[];      %%
array2=[];      %%
array1(1)=xk(1);%%
array2(1)=xk(2);%%


fprintf('El número de condicionamiento de la matriz es: %i \n\n', C);
iter=1;

while(iter<1000 && (xk'*Q)*(Q*xk)> tol)

    
pk=-(Q*xk);
alpha= (pk'*pk)/(pk'*Q*pk);
xk=xk+alpha*pk;
array1(iter+1)=xk(1);%%
    array2(iter+1)=xk(2);%%
iter=iter+1;
F = xk'*Q*xk;

fprintf('%i\t\t%d\t%d\t%d\n'  ,(iter-1), xk, F, alpha);



end 
iter=iter-1

fprintf('\nEl método terminó en %i iteraciones', iter);

fprintf('\n\n\n\n\n\n');


[y1,y2]=meshgrid(-2:.01:2);%%
Z=( y1.^2*Q(1,1) + y1.*y2*Q(1,2) + y1.*y2*Q(2,1) + y2.^2*Q(2,2) );%%

subplot(2,3,5);%%
hold on%%
    contour(y1,y2,Z,10);%%
    plot(array1,array2,'bx');%%
    plot(array1,array2,'b');%%
    title('MalCond, x0=Cerca eigMenor');%%
    xlim([-2,2]);%%
    ylim([-2,2]);%%
    
    
hold off%%


