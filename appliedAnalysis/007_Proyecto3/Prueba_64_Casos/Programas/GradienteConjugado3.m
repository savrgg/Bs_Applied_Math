function [x] = GradienteConjugado3(x,b,A,delta,tol)

if nargin < 5
    tol = 1e-6;
end

n = length( b ); 
maxit = 2*n;
tol1 = 1e-16;
r = A*x-b; p = -r; k = 0;
rr = r'*r; r_norm = norm(r);
rnorm0 = norm(r);
Ap = A*p; pAp=p'*Ap;

if pAp < -tol1
    x = b;
    x_norm = norm(x);
    if x_norm > delta
        tau = delta/x_norm;
        x = tau*x;
    end
end
    
while(r_norm/rnorm0 > tol && k < maxit)

    if pAp < -tol1

        return
    end
    alfa = rr/pAp;
    x = x+alfa*p;
    
    x_norm = norm(x);

    
    if x_norm > delta
        a = p'*p; b = 2*x'*p; c = x'*x-delta^2;
        tau = (-b+sqrt(b^2-4*a*c))/(2*a);
        x = x+tau*p;
        return
    end

    rn = r+alfa*Ap;
    rrn = rn'*rn;
    beta = rrn/rr;
    p = -rn+beta*p;
    r = rn; rr = rrn; r_norm = norm(r);
    Ap = A*p; pAp=p'*Ap;
    k = k+1;
end

