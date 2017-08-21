%Line Search Algorithm
%Salvador Garcia Gonzalez
%000119718

alpha0=0;
alphaA=.5;
alphaM=10;



phiA=phi(alphaA);
phi0=phi(alpha0);

phiZero=phi(0);
phiPZero=phiP(0);
phiPA=phiP(phiA);
c1=.1;
c2=.9;


while(1<2)
if(phiA>phiZero + c1*alphaA*phiPZero || (phiA>=phi0 && i>1))
    alphaSTAR = zoom(alpha0,alphaA);
    break;
    
end


if(abs(phiPA)>=-c2*phiPZero)
    alphaStar = alphaA;
    break;
end

if(phiPA>=0)
   alphaStar = zoom(alphaA, alphaM);
   break;
end



end