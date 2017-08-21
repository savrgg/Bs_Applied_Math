#
#**************************
# SET UP THE INITIAL DATA *
#**************************
#   Problem :
#   *********
#   A quadratic obstacle problem by Dembo and Tulowitzki
#   The problem comes from the obstacle problem on a rectangle.
#   The rectangle is discretized into (px-1)(py-1) little rectangles. The
#   heights of the considered surface above the corners of these little
#   rectangles are the problem variables,  There are px*py of them.
#   Source:
#   R. Dembo and U. Tulowitzki,
#   "On the minimization of quadratic functions subject to box
#   constraints",
#   WP 71, Yale University (new Haven, USA), 1983.
#   See also More 1989 (Problem B, Starting point L)
#   SIF input: Ph. Toint, Dec 1989.
#   classification QBR2-AY-V-0
#   PX is the number of points along the X side of the rectangle
#   PY is the number of points along the Y side of the rectangle
#IE PX                  4              $ n = 16
#IE PY                  4
#IE PX                  23             $ n = 529
#IE PY                  23
#IE PX                  32             $ n = 1024
#IE PY                  32
#IE PX                  75             $ n = 5625
#IE PY                  75
#IE PX                  100            $ n = 10000
#IE PY                  100
#IE PX                  125            $ n = 15625
#IE PY                  125
#   The force constant
#   Define the stepsize in the X direction and its inverse
#   Define the stepsize in the Y direction and its inverse
#   Define a few helpful parameters
#   Define one variable per discretized point in the unit square
#   Define a group per interior node
#   Fix the variables on the lower and upper edges of the unit square
#   Fix the variables on the left and right edges of the unit square
#   Describe the lower obstacle (problem B)
#   Describe the upper obstacle (problem B)
#   Start from the boundary values on the lower and upper edges
#   Start from the boundary values on the left and right edges
#   Describe the lower obstacle (starting point L)
#   Each node has four elements
#   Solution
#LO SOLTN(4)            -0.0081108
#LO SOLTN(10)           2.87503823
#LO SOLTN(23)           6.51932527
#LO SOLTN(32)           6.88708670
#LO SOLTN(75)           ???
#LO SOLTN(100)          ???
	param px := 10;
	param py := 10;
	param c := 1.0;
	param pxm1 := -1 + (10);
	param rpxm1 := 9.0;
	param hx := 1.0 / (9.0);
	param pym1 := -1 + (10);
	param rpym1 := 9.0;
	param hy := 1.0 / (9.0);
	param hxhy := (1.0 / (9.0)) * (1.0 / (9.0));
	param hxdhy := (1.0 / (9.0)) * (1.0 / (1.0 / (9.0)));
	param hydhx := (1.0 / (9.0)) * (1.0 / (1.0 / (9.0)));
	param hyd4hx := 0.25 * ((1.0 / (9.0)) * (1.0 / (1.0 / (9.0))));
	param hxd4hy := 0.25 * ((1.0 / (9.0)) * (1.0 / (1.0 / (9.0))));
	param c0 := ((1.0 / (9.0)) * (1.0 / (9.0))) * (1.0);
	param lc := -1.0 * (((1.0 / (9.0)) * (1.0 / (9.0))) * (1.0));
	param im1 := -1 + (9);
	param rim1 := 8.0;
	param xi1 := (8.0) * (1.0 / (9.0));
	param sxi1 := sin(9.2 * ((8.0) * (1.0 / (9.0))));
	param jm1 := -1 + (9);
	param rjm1 := 8.0;
	param xi2 := (8.0) * (1.0 / (9.0));
	param sxi2 := sin(9.3 * ((8.0) * (1.0 / (9.0))));
	param l1 := (sin(9.2 * ((8.0) * (1.0 / (9.0))))) * (sin(9.3 * ((8.0) * (1.0 / 
	(9.0)))));
	param l2 := ((sin(9.2 * ((8.0) * (1.0 / (9.0))))) * (sin(9.3 * ((8.0) * (1.0 / 
	(9.0)))))) * ((sin(9.2 * ((8.0) * (1.0 / (9.0))))) * (sin(9.3 * ((8.0) * (1.0 / 
	(9.0))))));
	param low := (((sin(9.2 * ((8.0) * (1.0 / (9.0))))) * (sin(9.3 * ((8.0) * (1.0 
	/ (9.0)))))) * ((sin(9.2 * ((8.0) * (1.0 / (9.0))))) * (sin(9.3 * ((8.0) * (1.0 
	/ (9.0))))))) * ((sin(9.2 * ((8.0) * (1.0 / (9.0))))) * (sin(9.3 * ((8.0) * 
	(1.0 / (9.0))))));
	param upp := 0.02 + (((sin(9.2 * ((8.0) * (1.0 / (9.0))))) * (sin(9.3 * ((8.0) 
	* (1.0 / (9.0)))))) * ((sin(9.2 * ((8.0) * (1.0 / (9.0))))) * (sin(9.3 * ((8.0) 
	* (1.0 / (9.0)))))));
	param ip1 := 1 + (9);
	param jp1 := 1 + (9);

	var x1_1 >= 0.0 ,  <= 0.0;
	var x2_1 >= 0.0 ,  <= 0.0;
	var x3_1 >= 0.0 ,  <= 0.0;
	var x4_1 >= 0.0 ,  <= 0.0;
	var x5_1 >= 0.0 ,  <= 0.0;
	var x6_1 >= 0.0 ,  <= 0.0;
	var x7_1 >= 0.0 ,  <= 0.0;
	var x8_1 >= 0.0 ,  <= 0.0;
	var x9_1 >= 0.0 ,  <= 0.0;
	var x10_1 >= 0.0 ,  <= 0.0;
	var x1_2 >= 0.0 ,  <= 0.0;
	var x2_2 >= 0.3937793366356831 ,  <= 0.5572403400857789 ,  := 
	0.3937793366356831;
	var x3_2 >= 0.44671816460760055 ,  <= 0.6043715642572578 ,  := 
	0.44671816460760055;
	var x4_2 >= 2.658723886528665e-4 ,  <= 0.02413474589705515 ,  := 
	2.658723886528665e-4;
	var x5_2 >= -0.3391611563540678 ,  <= 0.5063371045723885 ,  := 
	-0.3391611563540678;
	var x6_2 >= -0.4960928025216343 ,  <= 0.6466743955359259 ,  := 
	-0.4960928025216343;
	var x7_2 >= -0.0021091266848867365 ,  <= 0.036446308947150105 ,  := 
	-0.0021091266848867365;
	var x8_2 >= 0.2847312063379939 ,  <= 0.4528027837130198 ,  := 
	0.2847312063379939;
	var x9_2 >= 0.5400916195594984 ,  <= 0.6832006741551072 ,  := 
	0.5400916195594984;
	var x10_2 >= 0.0 ,  <= 0.0;
	var x1_3 >= 0.0 ,  <= 0.0;
	var x2_3 >= 0.4227141086543548 ,  <= 0.5832456273206106 ,  := 
	0.4227141086543548;
	var x3_3 >= 0.4795428637397414 ,  <= 0.632658253186744 ,  := 0.4795428637397414;
	var x4_3 >= 2.854086015416797e-4 ,  <= 0.024334889569585016 ,  := 
	2.854086015416797e-4;
	var x5_3 >= -0.36408260302147705 ,  <= 0.5298784047199946 ,  := 
	-0.36408260302147705;
	var x6_3 >= -0.5325455332913744 ,  <= 0.6770087662870579 ,  := 
	-0.5325455332913744;
	var x7_3 >= -0.0022641045979156157 ,  <= 0.0372423976921895 ,  := 
	-0.0022641045979156157;
	var x8_3 >= 0.30565315875017296 ,  <= 0.47375273826165754 ,  := 
	0.30565315875017296;
	var x9_3 >= 0.5797773684732547 ,  <= 0.7153031108838603 ,  := 
	0.5797773684732547;
	var x10_3 >= 0.0 ,  <= 0.0;
	var x1_4 >= 0.0 ,  <= 0.0;
	var x2_4 >= 4.466137010418048e-5 ,  <= 0.021258794088429997 ,  := 
	4.466137010418048e-5;
	var x3_4 >= 5.0665546476499324e-5 ,  <= 0.021369226053308238 ,  := 
	5.0665546476499324e-5;
	var x4_4 >= 3.0154515601447075e-8 ,  <= 0.020009688017269035 ,  := 
	3.0154515601447075e-8;
	var x5_4 >= -3.846672620840164e-5 ,  <= 0.021139524020333502 ,  := 
	-3.846672620840164e-5;
	var x6_4 >= -5.626548220821779e-5 ,  <= 0.021468344734397852 ,  := 
	-5.626548220821779e-5;
	var x7_4 >= -2.3921135190869225e-7 ,  <= 0.020038534925496957 ,  := 
	-2.3921135190869225e-7;
	var x8_4 >= 3.229343087201135e-5 ,  <= 0.021014089123514084 ,  := 
	3.229343087201135e-5;
	var x9_4 >= 6.125570711098406e-5 ,  <= 0.021553928522820797 ,  := 
	6.125570711098406e-5;
	var x10_4 >= 0.0 ,  <= 0.0;
	var x1_5 >= 0.0 ,  <= 0.0;
	var x2_5 >= -0.3642526902031173 ,  <= 0.5300371910853469 ,  := 
	-0.3642526902031173;
	var x3_5 >= -0.41322202076708053 ,  <= 0.5747819270912036 ,  := 
	-0.41322202076708053;
	var x4_5 >= -2.4593655331166914e-4 ,  <= 0.023925383158772025 ,  := 
	-2.4593655331166914e-4;
	var x5_5 >= 0.3137299297364258 ,  <= 0.4817114394222081 ,  := 
	0.3137299297364258;
	var x6_5 >= 0.4588944139445591 ,  <= 0.6149427557379955 ,  := 
	0.4588944139445591;
	var x7_5 >= 0.0019509786255238442 ,  <= 0.035613550571773775 ,  := 
	0.0019509786255238442;
	var x8_5 >= -0.2633812855176486 ,  <= 0.4308878273430881 ,  := 
	-0.2633812855176486;
	var x9_5 >= -0.49959407992684074 ,  <= 0.6496195273012655 ,  := 
	-0.49959407992684074;
	var x10_5 >= 0.0 ,  <= 0.0;
	var x1_6 >= 0.0 ,  <= 0.0;
	var x2_6 >= -0.4507393756992777 ,  <= 0.6078732052695588 ,  := 
	-0.4507393756992777;
	var x3_6 >= -0.5113357860497522 ,  <= 0.6594463686279571 ,  := 
	-0.5113357860497522;
	var x4_6 >= -3.043307338087716e-4 ,  <= 0.024524430021559566 ,  := 
	-3.043307338087716e-4;
	var x5_6 >= 0.3882206953330132 ,  <= 0.5521725328013108 ,  := 
	0.3882206953330132;
	var x6_6 >= 0.5678524475355717 ,  <= 0.705736081369553 ,  := 0.5678524475355717;
	var x7_6 >= 0.002414211099390602 ,  <= 0.03799631121160941 ,  := 
	0.002414211099390602;
	var x8_6 >= -0.3259174726723327 ,  <= 0.49359280516860704 ,  := 
	-0.3259174726723327;
	var x9_6 >= -0.618215677593785 ,  <= 0.7457048232644721 ,  := 
	-0.618215677593785;
	var x10_6 >= 0.0 ,  <= 0.0;
	var x1_7 >= 0.0 ,  <= 0.0;
	var x2_7 >= -3.5636475335626487e-4 ,  <= 0.02502647077806891 ,  := 
	-3.5636475335626487e-4;
	var x3_7 >= -4.0427364703860696e-4 ,  <= 0.025467434911541704 ,  := 
	-4.0427364703860696e-4;
	var x4_7 >= -2.4061076697424153e-7 ,  <= 0.02003868506862863 ,  := 
	-2.4061076697424153e-7;
	var x5_7 >= 3.0693606948696984e-4 ,  <= 0.024550215354329948 ,  := 
	3.0693606948696984e-4;
	var x6_7 >= 4.489569989194305e-4 ,  <= 0.025863224150335377 ,  := 
	4.489569989194305e-4;
	var x7_7 >= 1.9087299432173126e-6 ,  <= 0.02015387320192066 ,  := 
	1.9087299432173126e-6;
	var x8_7 >= -2.576777313568063e-4 ,  <= 0.02404934325045849 ,  := 
	-2.576777313568063e-4;
	var x9_7 >= -4.887753086246255e-4 ,  <= 0.026204967423153654 ,  := 
	-4.887753086246255e-4;
	var x10_7 >= 0.0 ,  <= 0.0;
	var x1_8 >= 0.0 ,  <= 0.0;
	var x2_8 >= 0.3344514359720908 ,  <= 0.5018243120191268 ,  := 
	0.3344514359720908;
	var x3_8 >= 0.37941435145962443 ,  <= 0.544093977877458 ,  := 
	0.37941435145962443;
	var x4_8 >= 2.2581530795900886e-4 ,  <= 0.023708249266807507 ,  := 
	2.2581530795900886e-4;
	var x5_8 >= -0.28806218410977386 ,  <= 0.4561717155911093 ,  := 
	-0.28806218410977386;
	var x6_8 >= -0.4213500677723075 ,  <= 0.5820332967566972 ,  := 
	-0.4213500677723075;
	var x7_8 >= -0.001791359735719315 ,  <= 0.03474988176139078 ,  := 
	-0.001791359735719315;
	var x8_8 >= 0.24183280321260603 ,  <= 0.4081594287375977 ,  := 
	0.24183280321260603;
	var x9_8 >= 0.45871989947833597 ,  <= 0.6147919110176742 ,  := 
	0.45871989947833597;
	var x10_8 >= 0.0 ,  <= 0.0;
	var x1_9 >= 0.0 ,  <= 0.0;
	var x2_9 >= 0.4775418533990749 ,  <= 0.6309527543824225 ,  := 
	0.4775418533990749;
	var x3_9 >= 0.5417415299043793 ,  <= 0.684550649172644 ,  := 0.5417415299043793;
	var x4_9 >= 3.224272617493759e-4 ,  <= 0.024702056427992596 ,  := 
	3.224272617493759e-4;
	var x5_9 >= -0.41130560224428553 ,  <= 0.573065306952623 ,  := 
	-0.41130560224428553;
	var x6_9 >= -0.6016188619701556 ,  <= 0.732657668246734 ,  := 
	-0.6016188619701556;
	var x7_9 >= -0.0025577682027690973 ,  <= 0.038702835585803785 ,  := 
	-0.0025577682027690973;
	var x8_9 >= 0.3452976206341617 ,  <= 0.5121857743810341 ,  := 
	0.3452976206341617;
	var x9_9 >= 0.6549768589009787 ,  <= 0.7741955589534621 ,  := 
	0.6549768589009787;
	var x10_9 >= 0.0 ,  <= 0.0;
	var x1_10 >= 0.0 ,  <= 0.0;
	var x2_10 >= 0.0 ,  <= 0.0;
	var x3_10 >= 0.0 ,  <= 0.0;
	var x4_10 >= 0.0 ,  <= 0.0;
	var x5_10 >= 0.0 ,  <= 0.0;
	var x6_10 >= 0.0 ,  <= 0.0;
	var x7_10 >= 0.0 ,  <= 0.0;
	var x8_10 >= 0.0 ,  <= 0.0;
	var x9_10 >= 0.0 ,  <= 0.0;
	var x10_10 >= 0.0 ,  <= 0.0;

minimize obj:
	0.25*(x3_2-x2_2) * (x3_2-x2_2) + 0.25*(x2_3-x2_2) * (x2_3-x2_2) + 
	0.25*(x1_2-x2_2) * (x1_2-x2_2) + 0.25*(x2_1-x2_2) * (x2_1-x2_2) - 
	0.012345679012345678*x2_2 + 0.25*(x3_3-x2_3) * (x3_3-x2_3) + 0.25*(x2_4-x2_3) * 
	(x2_4-x2_3) + 0.25*(x1_3-x2_3) * (x1_3-x2_3) + 0.25*(x2_2-x2_3) * (x2_2-x2_3) - 
	0.012345679012345678*x2_3 + 0.25*(x3_4-x2_4) * (x3_4-x2_4) + 0.25*(x2_5-x2_4) * 
	(x2_5-x2_4) + 0.25*(x1_4-x2_4) * (x1_4-x2_4) + 0.25*(x2_3-x2_4) * (x2_3-x2_4) - 
	0.012345679012345678*x2_4 + 0.25*(x3_5-x2_5) * (x3_5-x2_5) + 0.25*(x2_6-x2_5) * 
	(x2_6-x2_5) + 0.25*(x1_5-x2_5) * (x1_5-x2_5) + 0.25*(x2_4-x2_5) * (x2_4-x2_5) - 
	0.012345679012345678*x2_5 + 0.25*(x3_6-x2_6) * (x3_6-x2_6) + 0.25*(x2_7-x2_6) * 
	(x2_7-x2_6) + 0.25*(x1_6-x2_6) * (x1_6-x2_6) + 0.25*(x2_5-x2_6) * (x2_5-x2_6) - 
	0.012345679012345678*x2_6 + 0.25*(x3_7-x2_7) * (x3_7-x2_7) + 0.25*(x2_8-x2_7) * 
	(x2_8-x2_7) + 0.25*(x1_7-x2_7) * (x1_7-x2_7) + 0.25*(x2_6-x2_7) * (x2_6-x2_7) - 
	0.012345679012345678*x2_7 + 0.25*(x3_8-x2_8) * (x3_8-x2_8) + 0.25*(x2_9-x2_8) * 
	(x2_9-x2_8) + 0.25*(x1_8-x2_8) * (x1_8-x2_8) + 0.25*(x2_7-x2_8) * (x2_7-x2_8) - 
	0.012345679012345678*x2_8 + 0.25*(x3_9-x2_9) * (x3_9-x2_9) + 0.25*(x2_10-x2_9) 
	* (x2_10-x2_9) + 0.25*(x1_9-x2_9) * (x1_9-x2_9) + 0.25*(x2_8-x2_9) * 
	(x2_8-x2_9) - 0.012345679012345678*x2_9 + 0.25*(x4_2-x3_2) * (x4_2-x3_2) + 
	0.25*(x3_3-x3_2) * (x3_3-x3_2) + 0.25*(x2_2-x3_2) * (x2_2-x3_2) + 
	0.25*(x3_1-x3_2) * (x3_1-x3_2) - 0.012345679012345678*x3_2 + 0.25*(x4_3-x3_3) * 
	(x4_3-x3_3) + 0.25*(x3_4-x3_3) * (x3_4-x3_3) + 0.25*(x2_3-x3_3) * (x2_3-x3_3) + 
	0.25*(x3_2-x3_3) * (x3_2-x3_3) - 0.012345679012345678*x3_3 + 0.25*(x4_4-x3_4) * 
	(x4_4-x3_4) + 0.25*(x3_5-x3_4) * (x3_5-x3_4) + 0.25*(x2_4-x3_4) * (x2_4-x3_4) + 
	0.25*(x3_3-x3_4) * (x3_3-x3_4) - 0.012345679012345678*x3_4 + 0.25*(x4_5-x3_5) * 
	(x4_5-x3_5) + 0.25*(x3_6-x3_5) * (x3_6-x3_5) + 0.25*(x2_5-x3_5) * (x2_5-x3_5) + 
	0.25*(x3_4-x3_5) * (x3_4-x3_5) - 0.012345679012345678*x3_5 + 0.25*(x4_6-x3_6) * 
	(x4_6-x3_6) + 0.25*(x3_7-x3_6) * (x3_7-x3_6) + 0.25*(x2_6-x3_6) * (x2_6-x3_6) + 
	0.25*(x3_5-x3_6) * (x3_5-x3_6) - 0.012345679012345678*x3_6 + 0.25*(x4_7-x3_7) * 
	(x4_7-x3_7) + 0.25*(x3_8-x3_7) * (x3_8-x3_7) + 0.25*(x2_7-x3_7) * (x2_7-x3_7) + 
	0.25*(x3_6-x3_7) * (x3_6-x3_7) - 0.012345679012345678*x3_7 + 0.25*(x4_8-x3_8) * 
	(x4_8-x3_8) + 0.25*(x3_9-x3_8) * (x3_9-x3_8) + 0.25*(x2_8-x3_8) * (x2_8-x3_8) + 
	0.25*(x3_7-x3_8) * (x3_7-x3_8) - 0.012345679012345678*x3_8 + 0.25*(x4_9-x3_9) * 
	(x4_9-x3_9) + 0.25*(x3_10-x3_9) * (x3_10-x3_9) + 0.25*(x2_9-x3_9) * (x2_9-x3_9) 
	+ 0.25*(x3_8-x3_9) * (x3_8-x3_9) - 0.012345679012345678*x3_9 + 0.25*(x5_2-x4_2) 
	* (x5_2-x4_2) + 0.25*(x4_3-x4_2) * (x4_3-x4_2) + 0.25*(x3_2-x4_2) * (x3_2-x4_2) 
	+ 0.25*(x4_1-x4_2) * (x4_1-x4_2) - 0.012345679012345678*x4_2 + 0.25*(x5_3-x4_3) 
	* (x5_3-x4_3) + 0.25*(x4_4-x4_3) * (x4_4-x4_3) + 0.25*(x3_3-x4_3) * (x3_3-x4_3) 
	+ 0.25*(x4_2-x4_3) * (x4_2-x4_3) - 0.012345679012345678*x4_3 + 0.25*(x5_4-x4_4) 
	* (x5_4-x4_4) + 0.25*(x4_5-x4_4) * (x4_5-x4_4) + 0.25*(x3_4-x4_4) * (x3_4-x4_4) 
	+ 0.25*(x4_3-x4_4) * (x4_3-x4_4) - 0.012345679012345678*x4_4 + 0.25*(x5_5-x4_5) 
	* (x5_5-x4_5) + 0.25*(x4_6-x4_5) * (x4_6-x4_5) + 0.25*(x3_5-x4_5) * (x3_5-x4_5) 
	+ 0.25*(x4_4-x4_5) * (x4_4-x4_5) - 0.012345679012345678*x4_5 + 0.25*(x5_6-x4_6) 
	* (x5_6-x4_6) + 0.25*(x4_7-x4_6) * (x4_7-x4_6) + 0.25*(x3_6-x4_6) * (x3_6-x4_6) 
	+ 0.25*(x4_5-x4_6) * (x4_5-x4_6) - 0.012345679012345678*x4_6 + 0.25*(x5_7-x4_7) 
	* (x5_7-x4_7) + 0.25*(x4_8-x4_7) * (x4_8-x4_7) + 0.25*(x3_7-x4_7) * (x3_7-x4_7) 
	+ 0.25*(x4_6-x4_7) * (x4_6-x4_7) - 0.012345679012345678*x4_7 + 0.25*(x5_8-x4_8) 
	* (x5_8-x4_8) + 0.25*(x4_9-x4_8) * (x4_9-x4_8) + 0.25*(x3_8-x4_8) * (x3_8-x4_8) 
	+ 0.25*(x4_7-x4_8) * (x4_7-x4_8) - 0.012345679012345678*x4_8 + 0.25*(x5_9-x4_9) 
	* (x5_9-x4_9) + 0.25*(x4_10-x4_9) * (x4_10-x4_9) + 0.25*(x3_9-x4_9) * 
	(x3_9-x4_9) + 0.25*(x4_8-x4_9) * (x4_8-x4_9) - 0.012345679012345678*x4_9 + 
	0.25*(x6_2-x5_2) * (x6_2-x5_2) + 0.25*(x5_3-x5_2) * (x5_3-x5_2) + 
	0.25*(x4_2-x5_2) * (x4_2-x5_2) + 0.25*(x5_1-x5_2) * (x5_1-x5_2) - 
	0.012345679012345678*x5_2 + 0.25*(x6_3-x5_3) * (x6_3-x5_3) + 0.25*(x5_4-x5_3) * 
	(x5_4-x5_3) + 0.25*(x4_3-x5_3) * (x4_3-x5_3) + 0.25*(x5_2-x5_3) * (x5_2-x5_3) - 
	0.012345679012345678*x5_3 + 0.25*(x6_4-x5_4) * (x6_4-x5_4) + 0.25*(x5_5-x5_4) * 
	(x5_5-x5_4) + 0.25*(x4_4-x5_4) * (x4_4-x5_4) + 0.25*(x5_3-x5_4) * (x5_3-x5_4) - 
	0.012345679012345678*x5_4 + 0.25*(x6_5-x5_5) * (x6_5-x5_5) + 0.25*(x5_6-x5_5) * 
	(x5_6-x5_5) + 0.25*(x4_5-x5_5) * (x4_5-x5_5) + 0.25*(x5_4-x5_5) * (x5_4-x5_5) - 
	0.012345679012345678*x5_5 + 0.25*(x6_6-x5_6) * (x6_6-x5_6) + 0.25*(x5_7-x5_6) * 
	(x5_7-x5_6) + 0.25*(x4_6-x5_6) * (x4_6-x5_6) + 0.25*(x5_5-x5_6) * (x5_5-x5_6) - 
	0.012345679012345678*x5_6 + 0.25*(x6_7-x5_7) * (x6_7-x5_7) + 0.25*(x5_8-x5_7) * 
	(x5_8-x5_7) + 0.25*(x4_7-x5_7) * (x4_7-x5_7) + 0.25*(x5_6-x5_7) * (x5_6-x5_7) - 
	0.012345679012345678*x5_7 + 0.25*(x6_8-x5_8) * (x6_8-x5_8) + 0.25*(x5_9-x5_8) * 
	(x5_9-x5_8) + 0.25*(x4_8-x5_8) * (x4_8-x5_8) + 0.25*(x5_7-x5_8) * (x5_7-x5_8) - 
	0.012345679012345678*x5_8 + 0.25*(x6_9-x5_9) * (x6_9-x5_9) + 0.25*(x5_10-x5_9) 
	* (x5_10-x5_9) + 0.25*(x4_9-x5_9) * (x4_9-x5_9) + 0.25*(x5_8-x5_9) * 
	(x5_8-x5_9) - 0.012345679012345678*x5_9 + 0.25*(x7_2-x6_2) * (x7_2-x6_2) + 
	0.25*(x6_3-x6_2) * (x6_3-x6_2) + 0.25*(x5_2-x6_2) * (x5_2-x6_2) + 
	0.25*(x6_1-x6_2) * (x6_1-x6_2) - 0.012345679012345678*x6_2 + 0.25*(x7_3-x6_3) * 
	(x7_3-x6_3) + 0.25*(x6_4-x6_3) * (x6_4-x6_3) + 0.25*(x5_3-x6_3) * (x5_3-x6_3) + 
	0.25*(x6_2-x6_3) * (x6_2-x6_3) - 0.012345679012345678*x6_3 + 0.25*(x7_4-x6_4) * 
	(x7_4-x6_4) + 0.25*(x6_5-x6_4) * (x6_5-x6_4) + 0.25*(x5_4-x6_4) * (x5_4-x6_4) + 
	0.25*(x6_3-x6_4) * (x6_3-x6_4) - 0.012345679012345678*x6_4 + 0.25*(x7_5-x6_5) * 
	(x7_5-x6_5) + 0.25*(x6_6-x6_5) * (x6_6-x6_5) + 0.25*(x5_5-x6_5) * (x5_5-x6_5) + 
	0.25*(x6_4-x6_5) * (x6_4-x6_5) - 0.012345679012345678*x6_5 + 0.25*(x7_6-x6_6) * 
	(x7_6-x6_6) + 0.25*(x6_7-x6_6) * (x6_7-x6_6) + 0.25*(x5_6-x6_6) * (x5_6-x6_6) + 
	0.25*(x6_5-x6_6) * (x6_5-x6_6) - 0.012345679012345678*x6_6 + 0.25*(x7_7-x6_7) * 
	(x7_7-x6_7) + 0.25*(x6_8-x6_7) * (x6_8-x6_7) + 0.25*(x5_7-x6_7) * (x5_7-x6_7) + 
	0.25*(x6_6-x6_7) * (x6_6-x6_7) - 0.012345679012345678*x6_7 + 0.25*(x7_8-x6_8) * 
	(x7_8-x6_8) + 0.25*(x6_9-x6_8) * (x6_9-x6_8) + 0.25*(x5_8-x6_8) * (x5_8-x6_8) + 
	0.25*(x6_7-x6_8) * (x6_7-x6_8) - 0.012345679012345678*x6_8 + 0.25*(x7_9-x6_9) * 
	(x7_9-x6_9) + 0.25*(x6_10-x6_9) * (x6_10-x6_9) + 0.25*(x5_9-x6_9) * (x5_9-x6_9) 
	+ 0.25*(x6_8-x6_9) * (x6_8-x6_9) - 0.012345679012345678*x6_9 + 0.25*(x8_2-x7_2) 
	* (x8_2-x7_2) + 0.25*(x7_3-x7_2) * (x7_3-x7_2) + 0.25*(x6_2-x7_2) * (x6_2-x7_2) 
	+ 0.25*(x7_1-x7_2) * (x7_1-x7_2) - 0.012345679012345678*x7_2 + 0.25*(x8_3-x7_3) 
	* (x8_3-x7_3) + 0.25*(x7_4-x7_3) * (x7_4-x7_3) + 0.25*(x6_3-x7_3) * (x6_3-x7_3) 
	+ 0.25*(x7_2-x7_3) * (x7_2-x7_3) - 0.012345679012345678*x7_3 + 0.25*(x8_4-x7_4) 
	* (x8_4-x7_4) + 0.25*(x7_5-x7_4) * (x7_5-x7_4) + 0.25*(x6_4-x7_4) * (x6_4-x7_4) 
	+ 0.25*(x7_3-x7_4) * (x7_3-x7_4) - 0.012345679012345678*x7_4 + 0.25*(x8_5-x7_5) 
	* (x8_5-x7_5) + 0.25*(x7_6-x7_5) * (x7_6-x7_5) + 0.25*(x6_5-x7_5) * (x6_5-x7_5) 
	+ 0.25*(x7_4-x7_5) * (x7_4-x7_5) - 0.012345679012345678*x7_5 + 0.25*(x8_6-x7_6) 
	* (x8_6-x7_6) + 0.25*(x7_7-x7_6) * (x7_7-x7_6) + 0.25*(x6_6-x7_6) * (x6_6-x7_6) 
	+ 0.25*(x7_5-x7_6) * (x7_5-x7_6) - 0.012345679012345678*x7_6 + 0.25*(x8_7-x7_7) 
	* (x8_7-x7_7) + 0.25*(x7_8-x7_7) * (x7_8-x7_7) + 0.25*(x6_7-x7_7) * (x6_7-x7_7) 
	+ 0.25*(x7_6-x7_7) * (x7_6-x7_7) - 0.012345679012345678*x7_7 + 0.25*(x8_8-x7_8) 
	* (x8_8-x7_8) + 0.25*(x7_9-x7_8) * (x7_9-x7_8) + 0.25*(x6_8-x7_8) * (x6_8-x7_8) 
	+ 0.25*(x7_7-x7_8) * (x7_7-x7_8) - 0.012345679012345678*x7_8 + 0.25*(x8_9-x7_9) 
	* (x8_9-x7_9) + 0.25*(x7_10-x7_9) * (x7_10-x7_9) + 0.25*(x6_9-x7_9) * 
	(x6_9-x7_9) + 0.25*(x7_8-x7_9) * (x7_8-x7_9) - 0.012345679012345678*x7_9 + 
	0.25*(x9_2-x8_2) * (x9_2-x8_2) + 0.25*(x8_3-x8_2) * (x8_3-x8_2) + 
	0.25*(x7_2-x8_2) * (x7_2-x8_2) + 0.25*(x8_1-x8_2) * (x8_1-x8_2) - 
	0.012345679012345678*x8_2 + 0.25*(x9_3-x8_3) * (x9_3-x8_3) + 0.25*(x8_4-x8_3) * 
	(x8_4-x8_3) + 0.25*(x7_3-x8_3) * (x7_3-x8_3) + 0.25*(x8_2-x8_3) * (x8_2-x8_3) - 
	0.012345679012345678*x8_3 + 0.25*(x9_4-x8_4) * (x9_4-x8_4) + 0.25*(x8_5-x8_4) * 
	(x8_5-x8_4) + 0.25*(x7_4-x8_4) * (x7_4-x8_4) + 0.25*(x8_3-x8_4) * (x8_3-x8_4) - 
	0.012345679012345678*x8_4 + 0.25*(x9_5-x8_5) * (x9_5-x8_5) + 0.25*(x8_6-x8_5) * 
	(x8_6-x8_5) + 0.25*(x7_5-x8_5) * (x7_5-x8_5) + 0.25*(x8_4-x8_5) * (x8_4-x8_5) - 
	0.012345679012345678*x8_5 + 0.25*(x9_6-x8_6) * (x9_6-x8_6) + 0.25*(x8_7-x8_6) * 
	(x8_7-x8_6) + 0.25*(x7_6-x8_6) * (x7_6-x8_6) + 0.25*(x8_5-x8_6) * (x8_5-x8_6) - 
	0.012345679012345678*x8_6 + 0.25*(x9_7-x8_7) * (x9_7-x8_7) + 0.25*(x8_8-x8_7) * 
	(x8_8-x8_7) + 0.25*(x7_7-x8_7) * (x7_7-x8_7) + 0.25*(x8_6-x8_7) * (x8_6-x8_7) - 
	0.012345679012345678*x8_7 + 0.25*(x9_8-x8_8) * (x9_8-x8_8) + 0.25*(x8_9-x8_8) * 
	(x8_9-x8_8) + 0.25*(x7_8-x8_8) * (x7_8-x8_8) + 0.25*(x8_7-x8_8) * (x8_7-x8_8) - 
	0.012345679012345678*x8_8 + 0.25*(x9_9-x8_9) * (x9_9-x8_9) + 0.25*(x8_10-x8_9) 
	* (x8_10-x8_9) + 0.25*(x7_9-x8_9) * (x7_9-x8_9) + 0.25*(x8_8-x8_9) * 
	(x8_8-x8_9) - 0.012345679012345678*x8_9 + 0.25*(x10_2-x9_2) * (x10_2-x9_2) + 
	0.25*(x9_3-x9_2) * (x9_3-x9_2) + 0.25*(x8_2-x9_2) * (x8_2-x9_2) + 
	0.25*(x9_1-x9_2) * (x9_1-x9_2) - 0.012345679012345678*x9_2 + 0.25*(x10_3-x9_3) 
	* (x10_3-x9_3) + 0.25*(x9_4-x9_3) * (x9_4-x9_3) + 0.25*(x8_3-x9_3) * 
	(x8_3-x9_3) + 0.25*(x9_2-x9_3) * (x9_2-x9_3) - 0.012345679012345678*x9_3 + 
	0.25*(x10_4-x9_4) * (x10_4-x9_4) + 0.25*(x9_5-x9_4) * (x9_5-x9_4) + 
	0.25*(x8_4-x9_4) * (x8_4-x9_4) + 0.25*(x9_3-x9_4) * (x9_3-x9_4) - 
	0.012345679012345678*x9_4 + 0.25*(x10_5-x9_5) * (x10_5-x9_5) + 0.25*(x9_6-x9_5) 
	* (x9_6-x9_5) + 0.25*(x8_5-x9_5) * (x8_5-x9_5) + 0.25*(x9_4-x9_5) * (x9_4-x9_5) 
	- 0.012345679012345678*x9_5 + 0.25*(x10_6-x9_6) * (x10_6-x9_6) + 
	0.25*(x9_7-x9_6) * (x9_7-x9_6) + 0.25*(x8_6-x9_6) * (x8_6-x9_6) + 
	0.25*(x9_5-x9_6) * (x9_5-x9_6) - 0.012345679012345678*x9_6 + 0.25*(x10_7-x9_7) 
	* (x10_7-x9_7) + 0.25*(x9_8-x9_7) * (x9_8-x9_7) + 0.25*(x8_7-x9_7) * 
	(x8_7-x9_7) + 0.25*(x9_6-x9_7) * (x9_6-x9_7) - 0.012345679012345678*x9_7 + 
	0.25*(x10_8-x9_8) * (x10_8-x9_8) + 0.25*(x9_9-x9_8) * (x9_9-x9_8) + 
	0.25*(x8_8-x9_8) * (x8_8-x9_8) + 0.25*(x9_7-x9_8) * (x9_7-x9_8) - 
	0.012345679012345678*x9_8 + 0.25*(x10_9-x9_9) * (x10_9-x9_9) + 
	0.25*(x9_10-x9_9) * (x9_10-x9_9) + 0.25*(x8_9-x9_9) * (x8_9-x9_9) + 
	0.25*(x9_8-x9_9) * (x9_8-x9_9) - 0.012345679012345678*x9_9;



	display x1_1;
	display x2_1;
	display x3_1;
	display x4_1;
	display x5_1;
	display x6_1;
	display x7_1;
	display x8_1;
	display x9_1;
	display x10_1;
	display x1_2;
	display x2_2;
	display x3_2;
	display x4_2;
	display x5_2;
	display x6_2;
	display x7_2;
	display x8_2;
	display x9_2;
	display x10_2;
	display x1_3;
	display x2_3;
	display x3_3;
	display x4_3;
	display x5_3;
	display x6_3;
	display x7_3;
	display x8_3;
	display x9_3;
	display x10_3;
	display x1_4;
	display x2_4;
	display x3_4;
	display x4_4;
	display x5_4;
	display x6_4;
	display x7_4;
	display x8_4;
	display x9_4;
	display x10_4;
	display x1_5;
	display x2_5;
	display x3_5;
	display x4_5;
	display x5_5;
	display x6_5;
	display x7_5;
	display x8_5;
	display x9_5;
	display x10_5;
	display x1_6;
	display x2_6;
	display x3_6;
	display x4_6;
	display x5_6;
	display x6_6;
	display x7_6;
	display x8_6;
	display x9_6;
	display x10_6;
	display x1_7;
	display x2_7;
	display x3_7;
	display x4_7;
	display x5_7;
	display x6_7;
	display x7_7;
	display x8_7;
	display x9_7;
	display x10_7;
	display x1_8;
	display x2_8;
	display x3_8;
	display x4_8;
	display x5_8;
	display x6_8;
	display x7_8;
	display x8_8;
	display x9_8;
	display x10_8;
	display x1_9;
	display x2_9;
	display x3_9;
	display x4_9;
	display x5_9;
	display x6_9;
	display x7_9;
	display x8_9;
	display x9_9;
	display x10_9;
	display x1_10;
	display x2_10;
	display x3_10;
	display x4_10;
	display x5_10;
	display x6_10;
	display x7_10;
	display x8_10;
	display x9_10;
	display x10_10;
display obj;
