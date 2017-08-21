%% Máximo descenso - Ejemplo aleatorio cuadrático
%

%% 
% Inicialización de variables
defaultStream = RandStream.getDefaultStream;
savedState = defaultStream.State;
Q=gallery('lehmer',(2));
x=[1;1];
%%
% Constante de Tolerancia:
%
% $$TOL= 10^{-5}$$
%
TOL =10^(-5);
%%
% Número de itaraciones.
% 
numIteraciones=0;


%% Función a Optimizar
% Análiticamente
%
% $$f(x)= f_{0} - x^{T}b+\frac{1}{2}x^{T}Qx$$
%

f =(x'*Q*x);
%%
% Gradiente de F
%
% $$f(x)= f_{0} - x^{T}b+\frac{1}{2}x^{T}Qx$$
%
%
% $$p = - \nabla f(x)$$
%
gradiente_f= Q*x;
%gradiente_f0=gradiente_f;
p = -gradiente_f;


%% Gráfica -Curvas de nivel de la función
%


%%
% Parámetros
desdex = -3.0;
hastax = 3;

x1 = (desdex:0.01:hastax);   
x2 = (desdex:0.01:hastax);
n = length(x1);
[y1,y2]=meshgrid(x1,x2);
fplot = ( y1.^2*Q(1,1) + y1.*y2*Q(1,2) + y1.*y2*Q(2,1) + y2.^2*Q(2,2) );

%%
% Gráfica
hold on;
niv = -100:.2:5;
h1 = contour(x1,x2,fplot,niv);


%% Iteraciónes
% Iterar sobre _k_ hasta condición de paro:
%
% $$\left \| \nabla f(x) \right \|_{2}\leq Tolerancia$$
%

%%
% Cálculo de alpha:
%
% $$ \alpha_{k} = \frac{\left \| p_{k} \right \|_{2}}{p_{k}^{T}Qp_{k}}$$
%
%%
% Asiganación de x_k y p_K
%
% $$ x_{k} = x_{k-1} + a_{k-1}p_{k-1}$$  
%
% $$p_{k} = -  Q x_{k}+b$$
%

fprintf('It \t alpha \t\t\t Valores x \t\t\t Eval. f(x) \t     Gradiente f(x) \n')

while (norm(gradiente_f,2)> TOL && numIteraciones < 100)
    %alpha=1;
    alpha= ((norm(p,2))^2)/(p'*Q*p);
    x = x + alpha*p;
    gradiente_f= Q*x;
    p = -gradiente_f;
    
    f = (x'*Q*x);
    numIteraciones = numIteraciones + 1;
       fprintf('%2d  %5.5f    %+.4f | %+.4f \t   %.5f  \t  %+.4e | %+.4e\n', numIteraciones, alpha,x,f,gradiente_f);
   % fprintf('%2d  %7.5f  %6.4f %6.4f %6.4f %7.5 \n', numIteraciones, alpha, x(1),x(2), f, gradiente_f);
    scatter(x(1),x(2),100-5*numIteraciones, numIteraciones/3,'x')
    
end
    

