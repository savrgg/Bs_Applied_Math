%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PROGRAMAS NECESARIOS PARA EL METODO DE DESCENSO

GradienteConjugado2.m 			/Contiene el método de gradiente conjugado
Newton1pruebas.m			/Contiene el script que manda llamar al metodo de descenso
cubic_interp.m				/necesario para line search
inside.m				/necesario para line search
linesch_sw.m				/necesario para line search
lszoom.m				/necesario para line search

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PROGRAMAS NECESARIOS PARA EDITAR LOS DATOS

Main2.java, Main2.class			/este contiene el archivo java que te normaliza los datos, 
					/mandar llamar con java Main2 < wdbc.data > Segundo  necesita archivo Primer



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ARCHIVOS DE DATOS INTERMEDIOS

Primer 					/contiene la primer columna de wdbc.data
wdbc.data				/contiene los datos originales sin normalizar separadaos por comas(,)
Segundo					/contiene los datos normalizados con la Primer y segunda columna originales de wdbc.data
LIST_large2				/contiene la lista de los programas que generaran los mod

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PROGRAMAS PARA EL SEGUNDO PROYECTO

estDatos.m				/genera el archivo .mod de los train que le pidas
estDatosReg.m				/HASTA EL MOMENTO CREO QUE NOLO USO NO BORRAR TODAVIA
rCUTE					/metodo en perl que automatiza la creacion de nl
regrlog.mod				/mod del metodo de manolo
script.m				/metodo a correr en MATLAB

