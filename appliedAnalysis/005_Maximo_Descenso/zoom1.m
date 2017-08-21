%zoom
%Salvador Garcia Gonzalez
%Analisis Aplicado 2013

function[alphaSTAR]=zoom1(alphaH, alphaL,phi,phiP)  
%alphaH=High tomado por alpha
%alphaL=Low tomado por alpha
%phi= funcion phi
%phiP= funcion phi derivada

%alphaA= alpha J actual
%phiA = valor evaluado de alpha J actual

%phiZero
%phiPZero


alphaA=(alphaH+alphaL)/2;

phiA=phi(alphaA);
phiL=phi(alphaL);

phiZero=phi(0);
phiPZero=phiP(0);
phiPA=phiP(phiA);
c1=.1;
c2=.9;

while(1<2)
   
    if(phiA>phiZero+c1*alphaA*phiPZero || phiA>=phiL)
        alphaH=alphaA;
    
    else
        if(abs(phiPA)<=-c2*phiPZero)
            alphaSTAR=alphaA;
            break
        end
    
        if(phiPA*(alphaH-alphaL)>=0)
            alphaH=alphaL; 
        end
    
        alphaL=alphaA;
    end
    
     alphaA=(alphaH+alphaL)/2;
     phiA=phi(alphaA);
     phiL=phi(alphaL);
     phiPA=phiP(phiA);
end
    

    
    