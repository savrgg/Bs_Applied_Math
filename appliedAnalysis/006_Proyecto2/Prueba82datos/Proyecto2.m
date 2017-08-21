%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Segundo Proyecto Analisis Aplicado                                  %
%   Salvador García González                                            %    
%   incluir datos.txt de la pagina:                                     %
%   http://www.itl.nist.gov/div898/strd/lls/data/LINKS/DATA/Filip.dat   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%Inicializamos vectores%%%%%%%%%%%%%%%%%%%%%%%%%

    coeff1 = zeros( 9 ,1 );   coeff2 = zeros( 9 ,1 ); 

    error1 = zeros( 9 ,1 );   error2 = zeros( 9 ,1 );

    grados = [ 2 ,3 ,4 ,5 ,6 ,7 ,8 ,9 ,10];

    datos = load( 'datos.txt' );
    
    s1=std(datos(:,1)); m1=mean(datos(:,1));
    s2=std(datos(:,2)); m2=mean(datos(:,2));
    
    for i=1:82
       datos(i,1)=(datos(i,1)-m1)/s1;
       datos(i,2)=(datos(i,2)-m2)/s2;
    end
    
    xx=linspace(min(datos(:,2)),max(datos(:,2)),100);  enPol=zeros(100,1);
    
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%% Hacemos para el grado 2 al 10 %%%%%%%%%%%%%%%%%%%%%%%%
for j=1:9
    
    [ P2 ,S2,MU ] = polyfit( datos( : ,2 ) ,datos( : ,1 ) ,j+1 ); %coeficientes
    norma = sqrt( norm( P2 ) ); coeff1( j ) = norma; %1) norma de coefficientes
    yy = spline( datos( : ,2 ) ,datos( : ,1 ) ); %2) ajustamos spline a las obs
    zz=ppval(yy,xx);                              %3) xx evaluados en spline
   
    for i=1:82
        error1( j ) = error1( j )+( polyval(P2,datos(i,2)) - datos(i,1) )^2;     
    end
    
    for l=1:100
        enPol(l)=polyval(P2,xx(l));
        error2( j ) = error2( j )+( enPol(l) - zz(l) )^2;
    end   
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%% Ploteamos los datos %%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,2,1)
plot(grados, coeff1);
title('norma euclidiana de las betas');

subplot(2,2,2)
plot(grados,error1);
title('error de ajuste polinomio-obs');

subplot(2,2,3)
hold on
plot(xx,enPol,'-r');
plot(xx,zz,'-b');%spline
hold off
title('comparacion polinomio-spline');

subplot(2,2,4)
plot(grados, error2);
title('error de predicción');



