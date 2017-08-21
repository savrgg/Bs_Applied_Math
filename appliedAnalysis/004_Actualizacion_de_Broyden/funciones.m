x = [1.1 ;1.1];

[B1,x1,norma1]=Broyden(x, 'ejemplo1');
[B2,x2,norma2]=Broyden(x, 'ejemplo2');
[B3,x3,norma3]=Broyden(x, 'ejemplo3');

subplot(2,2,1)
semilogy(norma1);
title 'ejemplo1'
subplot(2,2,2)
semilogy(norma2);
title 'ejemplo2'
subplot(2,2,3)
semilogy(norma3);
title 'ejemplo3'

 
 
 
 
