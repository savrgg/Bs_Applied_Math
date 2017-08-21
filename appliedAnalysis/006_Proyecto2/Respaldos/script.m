%script
%sin reorden
%estDatos recibe: (matriz entrenamiento, nombre mod)


path(path,'/bin/AMPL/');
fil2=fopen('LIST_large2','w');
%[train1,test1,ntrain1,ntest1] = wdbcData('Segundo',30,.1,0);
%estDatos(train1,'train1.mod');
%fprintf(fil2,'train1 \n');


%%%%%%%%%%%%%%%%%%%%%con reorden

%[train1,test1,ntrain1,ntest1] = wdbcData('wdbc.data',30,.1,1);
%estDatos(train1,'trainReor1.mod');
%fprintf(fil2,'trainReor1 \n');

%[train2,test2,ntrain2,ntest2] = wdbcData('wdbc.data',30,.2,1);
%estDatos(train2,'trainReor2.mod');
%fprintf(fil2,'trainReor2 \n');

%[train3,test3,ntrain3,ntest3] = wdbcData('wdbc.data',30,.3,1);
%estDatos(train3,'trainReor3.mod');
%fprintf(fil2,'trainReor3 \n');

%[train4,test4,ntrain4,ntest4] = wdbcData('wdbc.data',30,.4,1);
%estDatos(train4,'trainReor4.mod');
%fprintf(fil2,'trainReor4 \n');

[train1,test1,ntrain1,ntest1] = wdbcData('wdbc.data',30,.5,1);
estDatos(train1,'trainReor5.mod',0.01);
fprintf(fil2,'trainReor5 \n');

fclose(fil2);
perl('rCUTE')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%use_ampl_stub train1.nl;
%x1=Newton1pruebas ('amplpnt','amplstub', 'train', 50)

%use_ampl_stub trainReor1.nl;
%x1=Newton1pruebas ('amplpnt','amplstub', 'trainReor1', 50)

%use_ampl_stub trainReor2.nl;
%x3=Newton1pruebas ('amplpnt','amplstub', 'trainReor2', 50)

%use_ampl_stub trainReor3.nl;
%x4=Newton1pruebas ('amplpnt','amplstub', 'trainReor3', 50)

%use_ampl_stub trainReor4.nl;
%x5=Newton1pruebas ('amplpnt','amplstub', 'trainReor4', 50)

use_ampl_stub trainReor5.nl;
x1=Newton1pruebas ('amplpnt','amplstub', 'trainReor5', 50)

Orig=test1(:,1);
resul=zeros(ntest1,1);
test1(:,1)=ones(ntest1,1);
suma=0;
for i=1:ntest1
b=-x1'*test1(i,:)';
valor = 1/(1+exp(b));
    if valor >= .5
        resul(i)=1;
    end
    
    if(Orig(i)==resul(i))
        suma=suma+1;
    end
end

suma

