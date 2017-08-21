r=0:0.01:4;
figure(1)
filename='demo.gif';


for k=1:400

vector=zeros(1,100);
vector(1)=.5;
for i=2:100
   vector(i)=r(k)*(vector(i-1))*(1-vector(i-1));
end
x=linspace(1,100,100);

plot(x,vector)
axis([0 100 0 1]) 

drawnow
frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
if k == 1;
imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
else
imwrite(imind,cm,filename,'gif','WriteMode','append');
end

end

    
