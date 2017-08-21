

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resuelve numericamente un sistema de ecuaciones lineales con matrices
% positivas definidas, sirve demasiado para resolver sistemas sparce muy 
% grandes rapidamente y que no pueden ser tratados por Cholesky.
% 
% Resolvemos el problema de min una cuadrativa:
% f(x) = 0.5*x'*A*x - b'*x
%             
%     
% para resolver el sistema Ax=b   
%
%   Salvador Garcia G. Octubre 2013
%
%   ITAM, Analisis Aplicado I
%         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [ x ] = GradienteConjugado2 ( A, b, x0, tol ,delta)

%%%inicializamos variables
[m,n] = size(A);      x = zeros(n,1);      maxit = 2 * n;

TOL = 10e-6;       iter=0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


r = -A * x0 + b;

rr = r' * r;

rnorm = norm( r );

rnorm0 = rnorm;

d = r;



while (rnorm/rnorm0 > tol) && (iter < maxit)
    
    Ad = A * d;
    
    dAd = d' * Ad;
    
    
    if dAd < -TOL
        
        if iter == 0
                x=b;
        end
        
        return
        
    end
    
    
    
    alfa = rr / dAd;
 
    x = x + alfa * d;
    
    r = r - alfa * Ad;
    
    rr_new = r' * r;
    
    rnorm = norm( r );
    
   % f = 0.5 * x' * A * x - b' * x;
    
    beta = rr_new / rr;
    
    d = r + beta * d;
    
    iter = iter+1;
    
    %rr = rr_new;
    
    
   if( norm(x) > delta )
            
         x = x / norm(x) * delta;
         
         return;
         
    end
    
    
end



