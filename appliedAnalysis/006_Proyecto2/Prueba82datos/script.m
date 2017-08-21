%% Resultados en función de gamma
% consideraremos que siempre tomamos muestras reordenadas
porc = zeros(51,1);
for i=0:.1:5
[x1, porc((i+.1)*10)]=regL (i,.5,.1, 30,1,'/bin/AMPL/');
end

xx=linspace(0,5,51);

%%
plot(xx,porc)