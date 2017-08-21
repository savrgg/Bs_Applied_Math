for i=57:64
    
   subplot(2,4,i-56);
   hold on
   a=load(char(array1(i)));
   b=load(char(array1(64+i)));
   plot(a,'r')
   plot(b,'b')
   title(char(array1(i)));
   hold off
   
end