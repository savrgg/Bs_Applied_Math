function [x1,x0] = miprueba (point,fungrad,name,maxit)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%prueba realizada con funcion de prueba min=(x-1)^2 +(x-3.5)^2
%se conoce con antelacion el minimo (1,3,5)
%se probara para 3 casos (GC=gradienteConjugado; LS=lineSearch:
%
%   1) SI AMPL, NO GC, NO LS
%   2) SI AMPL, SI GC, NO LS
%   3) SI AMPL, NO GC, SI LS
%   4) SI AMPL, SI GC, SI LS
%   
%
%   Salvador Garcia G. Octubre 2013
%
%   ITAM, Analisis Aplicado I
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%mandar llamar con:
%{
%
%incluir el path antes de iniciar
%path(path,'/bin/AMPL/');
%
%
%prueba 1
%funcion min=(x-1)^2 +(x-3.5)^2
use_ampl_stub rosenbr.nl;
x=miprueba ('amplpnt','amplstub', 'rosenbr', 50);

%prueba2
%funcion banana de rosenberg
use_ampl_stub rosenbrOriginal.nl;
x=miprueba ('amplpnt','amplstub', 'rosenbrOriginal', 50);

%prueba3
%arglina
use_ampl_stub arglina.nl;
x=miprueba ('amplpnt','amplstub', 'arglina', 50);

%prueba conflictiva
%biggs6
use_ampl_stub biggs6.nl;
x=miprueba ('amplpnt','amplstub', 'biggs6', 50);

%prueba mas conflictiva
%maratosb.nl
use_ampl_stub maratosb.nl;
x=miprueba ('amplpnt','amplstub', 'maratosb', 50);

%prueba una y me rindo
%extrosnb
use_ampl_stub extrosnb.nl
x=miprueba ('amplpnt','amplstub', 'maratosb', 50);
%}

%7 nov/SEGUNDO PROYECTO

%prueba pol.mod
%path(path,'/bin/AMPL/');
%use_ampl_stub pol.nl
%x=miprueba ('amplpnt','amplstub', 'pol', 50);


tol=10e-8;   
fout2 = fopen(cat(2,'2',name),'wt');
fprintf( fout2, '  %10s| %9s| %15s| %15s| %14s| %9s| %15s| %15s| %14s| \n','Nombre', 'Iter RC', 'f RegionC','g RegionC','tiempo','Iter BL', 'f BusquedaL','g BusquedaL','tiempo');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[x0,s0,y0]=feval(point);
n=length(x0);
m=length(y0);
[f0,c0,g0,A0,H0]=feval(fungrad,x0,s0,y0);
fout0 = fopen(cat(2,'0',name),'wt');
norm_g0=norm(g0);
eta0=.2;
delta_max0=1000;
delta0=.5;
%fprintf( fout0, ' Problema  ......................... %s    \n', name);
%fprintf( fout0, ' Numero de variables  .............. %3i   \n', n);
%fprintf( fout0, ' Numero de restricciones ........... %3i \n\n', m);
%fprintf( fout0, ' ITER         f                ||g||   \n\n');
iter0=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[x1,s1,y1]=feval(point);
[f1,c1,g1,A1,H1]=feval(fungrad,x1,s1,y1);
fout1 = fopen(cat(2,'1',name),'wt');
norm_g1=norm(g1);
%fprintf( fout1, ' Problema  ......................... %s    \n', name);
%fprintf( fout1, ' Numero de variables  .............. %3i   \n', n);
%fprintf( fout1, ' Numero de restricciones ........... %3i \n\n', m);
%fprintf( fout1, ' ITER         f                ||g||   \n\n');
iter1=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tiempo01=tic;

while ((norm_g1 > tol && iter1 <= maxit ) )
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %{
    %%%% 1) SI AMPL, NO GC, NO LS
    p_N = -H\g;
    x = x + p_N;
    [f,c,g,A,H] = feval(fungrad,x,s,y);
    norm_g = norm(g);
    fprintf( fout, ' %3i   % 14.8e   %14.8e  \n', iter,    f,   norm_g );  
    iter = iter + 1;
    %}
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %{
    %%%% 2) SI AMPL, SI GC, NO LS
    p_N=GradienteConjugado2(H,-g,x,10e-12);
    x1   = x + p_N; 
    x=x1+x;
    [ f, c, g, A, H ] = feval( fungrad, x, s, y);   
    norm_g = norm(g);
    fprintf( 1, ' %3i   % 14.8e   %14.8e  \n', iter,    f,   norm_g );  
    iter = iter + 1;
    %}
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
   
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%% 3) SI AMPL, NO GC, SI LS
    %p_N = -H\g;
    %[alpha,x,f,g]=linesch_sw(x,f,g,p_N,fungrad,s,y,0.0001,0.9,2);
    %[f,c,g,A,H]=feval(fungrad,x,s,y);
    %norm_g = norm(g);
    %fprintf( 1, ' %3i   % 14.8e   %14.8e  \n', iter,    f,   norm_g );  
    %iter = iter + 1;
    %}
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%% 4) SI AMPL, SI GC, SI LS
    p_N1=GradienteConjugado2(H1,-g1,x1,10e-6);
    p_N1=( x1 + p_N1); 
    if(p_N1'*(-g1) < 0)
       p_N1=-g1; 
    end
    if(norm(p_N1)<tol || norm(g1)<tol)
        iter1=iter1+1;
        break;
    end
       f_ant1=f1;
    [alpha1,x1,f1,g1,lol,n51]=linesch_sw(x1,f1,g1,p_N1,fungrad,s1,y1,0.0001,0.9,2);
    if(alpha1<tol)
        break;
    end
    iter1=iter1+n51;
    [f1,c1,g1,A1,H1]=feval(fungrad,x1,s1,y1);
    
    if(isnan(f1))
        f1=f_ant1;
        iter1=iter1+1;
        break;
    end
    %alpha
    %x
    norm_g1 = norm(g1);
    %fprintf( fout1, ' %3i   % 14.8e   %14.8e  \n', iter1,    f1,   norm_g1 );  
    fprintf( fout1, '%14.8e \n', f1);
    iter1 = iter1 + 1;
    %}
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tiempo11=toc(tiempo01);   
    %%%% 5) REGION DE CONFIANZA
    
tiempo00=tic;    
while ( (norm_g0 > tol && iter0 <= maxit) )

    p0 = GradienteConjugado3(zeros(n,1),-g0,H0,delta0);
    m0 = f0+g0'*p0+(1/2)*p0'*H0*p0;
    [fnew0] = feval(fungrad,x0+p0,s0,y0);
    r0 = ((f0-fnew0)/(f0-m0));
    if r0 < 0.25
        delta0 = 0.25*delta0;
    else
        if (r0 >= 0.75 && abs(norm(p0)-delta0) < 10e-5)
            delta0 = min(2*delta0,delta_max0);
        end
    end
    if(isnan(fnew0))
        iter0=iter0+1;
        break;
    end
    if r0 > eta0
        x0 = x0 + p0;
        [f0,h10,g0,h20,H0] = feval(fungrad,x0,s0,y0);
        norm_g0 = norm(g0);
    end
    %fprintf( fout0, ' %3i   %14.8e   %14.8e  \n', iter0,    f0,   norm_g0 );
    fprintf( fout0, '%14.8e \n', f0);
    iter0 = iter0+1;
    
    
end

tiempo10=toc(tiempo00);
    %}
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
   
    


if(iter0<1) 
    iter0=1; 
end
if(iter1<1) 
    iter1=1; 
end   
fprintf( fout2, '  %10s| %9i| %+14.8e| %+14.8e| %9.8e| %9i| %+14.8e| %+14.8e| %9.8e| \n',name, iter0-1,f0,norm(g0),tiempo10,iter1-1, f1,norm(g1),tiempo11);

fclose(fout0);
fclose(fout1);
fclose(fout2);

end 



























