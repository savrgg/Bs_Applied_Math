param N:=100; #Puntos de partición entre cada tiempo
param M:=50;  #Indice de los tiempos dados
set I:={0..M};
set J:={0..M*N};
param h:=1/N;
param p_inf{I}:=[0,..,M];
param p_sup{I}:=[1..M+1];
param p:=0.5;

var v {i in I};
var f {J};

minimize L2_smooth:
	(1/h) * ( sum {j in 1..M*N-1} (f[j-1]-2*f[j]+f[j+1])^2 + (f[M*N]-2*f[M*N-1]+f[M*N-2])^2 );

subject to cons1 {i in 1..M}:
	h * sum {j in 1..M} f[N*(i-1)+j] = - log(v[i]/v[i-1]);

subject to cons2 {i in 1..M}:
	p_inf[i] <= sum {j in 1..M} p*v[j] <= p_sup[i];

subject to cons3:
	v[0]=1;

data;
