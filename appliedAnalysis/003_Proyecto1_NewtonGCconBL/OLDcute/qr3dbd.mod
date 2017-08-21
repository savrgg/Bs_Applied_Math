#
#**************************
# SET UP THE INITIAL DATA *
#**************************
#   Problem :
#   *********
#   Find the QR factorization of a tridiagonal matrix A.
#   The problem is formulated as a system of quadratic equations
#   whose unknowns are the elements of the orthogonal matrix Q and of
#   the upper triangular matrix R.  In this version of the problem,
#   the banded structure of R is imposed. As a consequence, there are
#   less variables than equations.
#   See problem QR3D for the case where this structure is ignored.
#   The problem is non-convex.
#   Source:
#   Ph. Toint, private communication.
#   SIF input: Ph. Toint, Nov 1993
#   classification  NQR2-AN-V-V
#   Define the matrix order M ( M >= 3 ).
#   There are n = M * M + 3 * ( M - 1 ) variables 
#   and       m = M * ( 3 * M + 1 )     equations.
#IE M                   5              $ n =  37, m =  40
#IE M                   20             $ n = 457, m = 610
#   Define useful parameters
#   Define the matrix A to factorize
#   a(i,i-1)=a(i,i+1)= (1-i)/m, a(i,i) = 2i/m
#   The orthogonal matrix Q
#   The upper triangular matrix R
#    Orthogonality of the Q matrix
#   Factorization equations A= QR
#   Orthogonality constraints
#   Factorization constraints
#   All variables are free, except the diagonals of R 
#   which are nonnegative
#   Initialize Q to the identity
#   Initialize R to the upper triangular part of A
#   Orthogonality constraints
#   Factorization constraints
#   Solution
	param m := 10;
	param mm1 := -1 + (10);
	param mm2 := -2 + (10);
	param rm := 10.0;
	param a1_1 := 2.0 / (10.0);
	param a1_2 := 0.0;
	param ip1 := 1 + (9);
	param im1 := -1 + (9);
	param r1mi := -8.0;
	param r2i := 18.0;
	param a2_1 := (-1.0) / (10.0);
	param a2_2 := (4.0) / (10.0);
	param a2_3 := (-1.0) / (10.0);
	param a3_2 := (-2.0) / (10.0);
	param a3_3 := (6.0) / (10.0);
	param a3_4 := (-2.0) / (10.0);
	param a4_3 := (-3.0) / (10.0);
	param a4_4 := (8.0) / (10.0);
	param a4_5 := (-3.0) / (10.0);
	param a5_4 := (-4.0) / (10.0);
	param a5_5 := (10.0) / (10.0);
	param a5_6 := (-4.0) / (10.0);
	param a6_5 := (-5.0) / (10.0);
	param a6_6 := (12.0) / (10.0);
	param a6_7 := (-5.0) / (10.0);
	param a7_6 := (-6.0) / (10.0);
	param a7_7 := (14.0) / (10.0);
	param a7_8 := (-6.0) / (10.0);
	param a8_7 := (-7.0) / (10.0);
	param a8_8 := (16.0) / (10.0);
	param a8_9 := (-7.0) / (10.0);
	param a9_8 := (-8.0) / (10.0);
	param a9_9 := (18.0) / (10.0);
	param a9_10 := (-8.0) / (10.0);
	param rmm1 := 9.0;
	param a10_9 := (-1.0 * (9.0)) / (10.0);
	param a10_10 := 2.0 * (10.0);
	param ip2 := 2 + (8);
	param jm2 := -2 + (10);

	var q1_1 := 1.0;
	var q1_2;
	var q1_3;
	var q1_4;
	var q1_5;
	var q1_6;
	var q1_7;
	var q1_8;
	var q1_9;
	var q1_10;
	var q2_1;
	var q2_2 := 1.0;
	var q2_3;
	var q2_4;
	var q2_5;
	var q2_6;
	var q2_7;
	var q2_8;
	var q2_9;
	var q2_10;
	var q3_1;
	var q3_2;
	var q3_3 := 1.0;
	var q3_4;
	var q3_5;
	var q3_6;
	var q3_7;
	var q3_8;
	var q3_9;
	var q3_10;
	var q4_1;
	var q4_2;
	var q4_3;
	var q4_4 := 1.0;
	var q4_5;
	var q4_6;
	var q4_7;
	var q4_8;
	var q4_9;
	var q4_10;
	var q5_1;
	var q5_2;
	var q5_3;
	var q5_4;
	var q5_5 := 1.0;
	var q5_6;
	var q5_7;
	var q5_8;
	var q5_9;
	var q5_10;
	var q6_1;
	var q6_2;
	var q6_3;
	var q6_4;
	var q6_5;
	var q6_6 := 1.0;
	var q6_7;
	var q6_8;
	var q6_9;
	var q6_10;
	var q7_1;
	var q7_2;
	var q7_3;
	var q7_4;
	var q7_5;
	var q7_6;
	var q7_7 := 1.0;
	var q7_8;
	var q7_9;
	var q7_10;
	var q8_1;
	var q8_2;
	var q8_3;
	var q8_4;
	var q8_5;
	var q8_6;
	var q8_7;
	var q8_8 := 1.0;
	var q8_9;
	var q8_10;
	var q9_1;
	var q9_2;
	var q9_3;
	var q9_4;
	var q9_5;
	var q9_6;
	var q9_7;
	var q9_8;
	var q9_9 := 1.0;
	var q9_10;
	var q10_1;
	var q10_2;
	var q10_3;
	var q10_4;
	var q10_5;
	var q10_6;
	var q10_7;
	var q10_8;
	var q10_9;
	var q10_10 := 1.0;
	var r1_1 >= 0.0 ,  := 0.2;
	var r1_2;
	var r1_3;
	var r2_2 >= 0.0 ,  := 0.4;
	var r2_3 := -0.1;
	var r2_4;
	var r3_3 >= 0.0 ,  := 0.6;
	var r3_4 := -0.2;
	var r3_5;
	var r4_4 >= 0.0 ,  := 0.8;
	var r4_5 := -0.3;
	var r4_6;
	var r5_5 >= 0.0 ,  := 1.0;
	var r5_6 := -0.4;
	var r5_7;
	var r6_6 >= 0.0 ,  := 1.2;
	var r6_7 := -0.5;
	var r6_8;
	var r7_7 >= 0.0 ,  := 1.4;
	var r7_8 := -0.6;
	var r7_9;
	var r8_8 >= 0.0 ,  := 1.6;
	var r8_9 := -0.7;
	var r8_10;
	var r9_9 >= 0.0 ,  := 1.8;
	var r9_10 := -0.8;
	var r10_10 >= 0.0 ,  := 20.0;

minimize obj:
	(q1_1 * q1_1 + q1_2 * q1_2 + q1_3 * q1_3 + q1_4 * q1_4 + q1_5 * q1_5 + q1_6 * 
	q1_6 + q1_7 * q1_7 + q1_8 * q1_8 + q1_9 * q1_9 + q1_10 * q1_10 - 1.0)^2 + (q1_1 
	* q2_1 + q1_2 * q2_2 + q1_3 * q2_3 + q1_4 * q2_4 + q1_5 * q2_5 + q1_6 * q2_6 + 
	q1_7 * q2_7 + q1_8 * q2_8 + q1_9 * q2_9 + q1_10 * q2_10)^2 + (q1_1 * q3_1 + 
	q1_2 * q3_2 + q1_3 * q3_3 + q1_4 * q3_4 + q1_5 * q3_5 + q1_6 * q3_6 + q1_7 * 
	q3_7 + q1_8 * q3_8 + q1_9 * q3_9 + q1_10 * q3_10)^2 + (q1_1 * q4_1 + q1_2 * 
	q4_2 + q1_3 * q4_3 + q1_4 * q4_4 + q1_5 * q4_5 + q1_6 * q4_6 + q1_7 * q4_7 + 
	q1_8 * q4_8 + q1_9 * q4_9 + q1_10 * q4_10)^2 + (q1_1 * q5_1 + q1_2 * q5_2 + 
	q1_3 * q5_3 + q1_4 * q5_4 + q1_5 * q5_5 + q1_6 * q5_6 + q1_7 * q5_7 + q1_8 * 
	q5_8 + q1_9 * q5_9 + q1_10 * q5_10)^2 + (q1_1 * q6_1 + q1_2 * q6_2 + q1_3 * 
	q6_3 + q1_4 * q6_4 + q1_5 * q6_5 + q1_6 * q6_6 + q1_7 * q6_7 + q1_8 * q6_8 + 
	q1_9 * q6_9 + q1_10 * q6_10)^2 + (q1_1 * q7_1 + q1_2 * q7_2 + q1_3 * q7_3 + 
	q1_4 * q7_4 + q1_5 * q7_5 + q1_6 * q7_6 + q1_7 * q7_7 + q1_8 * q7_8 + q1_9 * 
	q7_9 + q1_10 * q7_10)^2 + (q1_1 * q8_1 + q1_2 * q8_2 + q1_3 * q8_3 + q1_4 * 
	q8_4 + q1_5 * q8_5 + q1_6 * q8_6 + q1_7 * q8_7 + q1_8 * q8_8 + q1_9 * q8_9 + 
	q1_10 * q8_10)^2 + (q1_1 * q9_1 + q1_2 * q9_2 + q1_3 * q9_3 + q1_4 * q9_4 + 
	q1_5 * q9_5 + q1_6 * q9_6 + q1_7 * q9_7 + q1_8 * q9_8 + q1_9 * q9_9 + q1_10 * 
	q9_10)^2 + (q1_1 * q10_1 + q1_2 * q10_2 + q1_3 * q10_3 + q1_4 * q10_4 + q1_5 * 
	q10_5 + q1_6 * q10_6 + q1_7 * q10_7 + q1_8 * q10_8 + q1_9 * q10_9 + q1_10 * 
	q10_10)^2 + (q2_1 * q2_1 + q2_2 * q2_2 + q2_3 * q2_3 + q2_4 * q2_4 + q2_5 * 
	q2_5 + q2_6 * q2_6 + q2_7 * q2_7 + q2_8 * q2_8 + q2_9 * q2_9 + q2_10 * q2_10 - 
	1.0)^2 + (q2_1 * q3_1 + q2_2 * q3_2 + q2_3 * q3_3 + q2_4 * q3_4 + q2_5 * q3_5 + 
	q2_6 * q3_6 + q2_7 * q3_7 + q2_8 * q3_8 + q2_9 * q3_9 + q2_10 * q3_10)^2 + 
	(q2_1 * q4_1 + q2_2 * q4_2 + q2_3 * q4_3 + q2_4 * q4_4 + q2_5 * q4_5 + q2_6 * 
	q4_6 + q2_7 * q4_7 + q2_8 * q4_8 + q2_9 * q4_9 + q2_10 * q4_10)^2 + (q2_1 * 
	q5_1 + q2_2 * q5_2 + q2_3 * q5_3 + q2_4 * q5_4 + q2_5 * q5_5 + q2_6 * q5_6 + 
	q2_7 * q5_7 + q2_8 * q5_8 + q2_9 * q5_9 + q2_10 * q5_10)^2 + (q2_1 * q6_1 + 
	q2_2 * q6_2 + q2_3 * q6_3 + q2_4 * q6_4 + q2_5 * q6_5 + q2_6 * q6_6 + q2_7 * 
	q6_7 + q2_8 * q6_8 + q2_9 * q6_9 + q2_10 * q6_10)^2 + (q2_1 * q7_1 + q2_2 * 
	q7_2 + q2_3 * q7_3 + q2_4 * q7_4 + q2_5 * q7_5 + q2_6 * q7_6 + q2_7 * q7_7 + 
	q2_8 * q7_8 + q2_9 * q7_9 + q2_10 * q7_10)^2 + (q2_1 * q8_1 + q2_2 * q8_2 + 
	q2_3 * q8_3 + q2_4 * q8_4 + q2_5 * q8_5 + q2_6 * q8_6 + q2_7 * q8_7 + q2_8 * 
	q8_8 + q2_9 * q8_9 + q2_10 * q8_10)^2 + (q2_1 * q9_1 + q2_2 * q9_2 + q2_3 * 
	q9_3 + q2_4 * q9_4 + q2_5 * q9_5 + q2_6 * q9_6 + q2_7 * q9_7 + q2_8 * q9_8 + 
	q2_9 * q9_9 + q2_10 * q9_10)^2 + (q2_1 * q10_1 + q2_2 * q10_2 + q2_3 * q10_3 + 
	q2_4 * q10_4 + q2_5 * q10_5 + q2_6 * q10_6 + q2_7 * q10_7 + q2_8 * q10_8 + q2_9 
	* q10_9 + q2_10 * q10_10)^2 + (q3_1 * q3_1 + q3_2 * q3_2 + q3_3 * q3_3 + q3_4 * 
	q3_4 + q3_5 * q3_5 + q3_6 * q3_6 + q3_7 * q3_7 + q3_8 * q3_8 + q3_9 * q3_9 + 
	q3_10 * q3_10 - 1.0)^2 + (q3_1 * q4_1 + q3_2 * q4_2 + q3_3 * q4_3 + q3_4 * q4_4 
	+ q3_5 * q4_5 + q3_6 * q4_6 + q3_7 * q4_7 + q3_8 * q4_8 + q3_9 * q4_9 + q3_10 * 
	q4_10)^2 + (q3_1 * q5_1 + q3_2 * q5_2 + q3_3 * q5_3 + q3_4 * q5_4 + q3_5 * q5_5 
	+ q3_6 * q5_6 + q3_7 * q5_7 + q3_8 * q5_8 + q3_9 * q5_9 + q3_10 * q5_10)^2 + 
	(q3_1 * q6_1 + q3_2 * q6_2 + q3_3 * q6_3 + q3_4 * q6_4 + q3_5 * q6_5 + q3_6 * 
	q6_6 + q3_7 * q6_7 + q3_8 * q6_8 + q3_9 * q6_9 + q3_10 * q6_10)^2 + (q3_1 * 
	q7_1 + q3_2 * q7_2 + q3_3 * q7_3 + q3_4 * q7_4 + q3_5 * q7_5 + q3_6 * q7_6 + 
	q3_7 * q7_7 + q3_8 * q7_8 + q3_9 * q7_9 + q3_10 * q7_10)^2 + (q3_1 * q8_1 + 
	q3_2 * q8_2 + q3_3 * q8_3 + q3_4 * q8_4 + q3_5 * q8_5 + q3_6 * q8_6 + q3_7 * 
	q8_7 + q3_8 * q8_8 + q3_9 * q8_9 + q3_10 * q8_10)^2 + (q3_1 * q9_1 + q3_2 * 
	q9_2 + q3_3 * q9_3 + q3_4 * q9_4 + q3_5 * q9_5 + q3_6 * q9_6 + q3_7 * q9_7 + 
	q3_8 * q9_8 + q3_9 * q9_9 + q3_10 * q9_10)^2 + (q3_1 * q10_1 + q3_2 * q10_2 + 
	q3_3 * q10_3 + q3_4 * q10_4 + q3_5 * q10_5 + q3_6 * q10_6 + q3_7 * q10_7 + q3_8 
	* q10_8 + q3_9 * q10_9 + q3_10 * q10_10)^2 + (q4_1 * q4_1 + q4_2 * q4_2 + q4_3 
	* q4_3 + q4_4 * q4_4 + q4_5 * q4_5 + q4_6 * q4_6 + q4_7 * q4_7 + q4_8 * q4_8 + 
	q4_9 * q4_9 + q4_10 * q4_10 - 1.0)^2 + (q4_1 * q5_1 + q4_2 * q5_2 + q4_3 * q5_3 
	+ q4_4 * q5_4 + q4_5 * q5_5 + q4_6 * q5_6 + q4_7 * q5_7 + q4_8 * q5_8 + q4_9 * 
	q5_9 + q4_10 * q5_10)^2 + (q4_1 * q6_1 + q4_2 * q6_2 + q4_3 * q6_3 + q4_4 * 
	q6_4 + q4_5 * q6_5 + q4_6 * q6_6 + q4_7 * q6_7 + q4_8 * q6_8 + q4_9 * q6_9 + 
	q4_10 * q6_10)^2 + (q4_1 * q7_1 + q4_2 * q7_2 + q4_3 * q7_3 + q4_4 * q7_4 + 
	q4_5 * q7_5 + q4_6 * q7_6 + q4_7 * q7_7 + q4_8 * q7_8 + q4_9 * q7_9 + q4_10 * 
	q7_10)^2 + (q4_1 * q8_1 + q4_2 * q8_2 + q4_3 * q8_3 + q4_4 * q8_4 + q4_5 * q8_5 
	+ q4_6 * q8_6 + q4_7 * q8_7 + q4_8 * q8_8 + q4_9 * q8_9 + q4_10 * q8_10)^2 + 
	(q4_1 * q9_1 + q4_2 * q9_2 + q4_3 * q9_3 + q4_4 * q9_4 + q4_5 * q9_5 + q4_6 * 
	q9_6 + q4_7 * q9_7 + q4_8 * q9_8 + q4_9 * q9_9 + q4_10 * q9_10)^2 + (q4_1 * 
	q10_1 + q4_2 * q10_2 + q4_3 * q10_3 + q4_4 * q10_4 + q4_5 * q10_5 + q4_6 * 
	q10_6 + q4_7 * q10_7 + q4_8 * q10_8 + q4_9 * q10_9 + q4_10 * q10_10)^2 + (q5_1 
	* q5_1 + q5_2 * q5_2 + q5_3 * q5_3 + q5_4 * q5_4 + q5_5 * q5_5 + q5_6 * q5_6 + 
	q5_7 * q5_7 + q5_8 * q5_8 + q5_9 * q5_9 + q5_10 * q5_10 - 1.0)^2 + (q5_1 * q6_1 
	+ q5_2 * q6_2 + q5_3 * q6_3 + q5_4 * q6_4 + q5_5 * q6_5 + q5_6 * q6_6 + q5_7 * 
	q6_7 + q5_8 * q6_8 + q5_9 * q6_9 + q5_10 * q6_10)^2 + (q5_1 * q7_1 + q5_2 * 
	q7_2 + q5_3 * q7_3 + q5_4 * q7_4 + q5_5 * q7_5 + q5_6 * q7_6 + q5_7 * q7_7 + 
	q5_8 * q7_8 + q5_9 * q7_9 + q5_10 * q7_10)^2 + (q5_1 * q8_1 + q5_2 * q8_2 + 
	q5_3 * q8_3 + q5_4 * q8_4 + q5_5 * q8_5 + q5_6 * q8_6 + q5_7 * q8_7 + q5_8 * 
	q8_8 + q5_9 * q8_9 + q5_10 * q8_10)^2 + (q5_1 * q9_1 + q5_2 * q9_2 + q5_3 * 
	q9_3 + q5_4 * q9_4 + q5_5 * q9_5 + q5_6 * q9_6 + q5_7 * q9_7 + q5_8 * q9_8 + 
	q5_9 * q9_9 + q5_10 * q9_10)^2 + (q5_1 * q10_1 + q5_2 * q10_2 + q5_3 * q10_3 + 
	q5_4 * q10_4 + q5_5 * q10_5 + q5_6 * q10_6 + q5_7 * q10_7 + q5_8 * q10_8 + q5_9 
	* q10_9 + q5_10 * q10_10)^2 + (q6_1 * q6_1 + q6_2 * q6_2 + q6_3 * q6_3 + q6_4 * 
	q6_4 + q6_5 * q6_5 + q6_6 * q6_6 + q6_7 * q6_7 + q6_8 * q6_8 + q6_9 * q6_9 + 
	q6_10 * q6_10 - 1.0)^2 + (q6_1 * q7_1 + q6_2 * q7_2 + q6_3 * q7_3 + q6_4 * q7_4 
	+ q6_5 * q7_5 + q6_6 * q7_6 + q6_7 * q7_7 + q6_8 * q7_8 + q6_9 * q7_9 + q6_10 * 
	q7_10)^2 + (q6_1 * q8_1 + q6_2 * q8_2 + q6_3 * q8_3 + q6_4 * q8_4 + q6_5 * q8_5 
	+ q6_6 * q8_6 + q6_7 * q8_7 + q6_8 * q8_8 + q6_9 * q8_9 + q6_10 * q8_10)^2 + 
	(q6_1 * q9_1 + q6_2 * q9_2 + q6_3 * q9_3 + q6_4 * q9_4 + q6_5 * q9_5 + q6_6 * 
	q9_6 + q6_7 * q9_7 + q6_8 * q9_8 + q6_9 * q9_9 + q6_10 * q9_10)^2 + (q6_1 * 
	q10_1 + q6_2 * q10_2 + q6_3 * q10_3 + q6_4 * q10_4 + q6_5 * q10_5 + q6_6 * 
	q10_6 + q6_7 * q10_7 + q6_8 * q10_8 + q6_9 * q10_9 + q6_10 * q10_10)^2 + (q7_1 
	* q7_1 + q7_2 * q7_2 + q7_3 * q7_3 + q7_4 * q7_4 + q7_5 * q7_5 + q7_6 * q7_6 + 
	q7_7 * q7_7 + q7_8 * q7_8 + q7_9 * q7_9 + q7_10 * q7_10 - 1.0)^2 + (q7_1 * q8_1 
	+ q7_2 * q8_2 + q7_3 * q8_3 + q7_4 * q8_4 + q7_5 * q8_5 + q7_6 * q8_6 + q7_7 * 
	q8_7 + q7_8 * q8_8 + q7_9 * q8_9 + q7_10 * q8_10)^2 + (q7_1 * q9_1 + q7_2 * 
	q9_2 + q7_3 * q9_3 + q7_4 * q9_4 + q7_5 * q9_5 + q7_6 * q9_6 + q7_7 * q9_7 + 
	q7_8 * q9_8 + q7_9 * q9_9 + q7_10 * q9_10)^2 + (q7_1 * q10_1 + q7_2 * q10_2 + 
	q7_3 * q10_3 + q7_4 * q10_4 + q7_5 * q10_5 + q7_6 * q10_6 + q7_7 * q10_7 + q7_8 
	* q10_8 + q7_9 * q10_9 + q7_10 * q10_10)^2 + (q8_1 * q8_1 + q8_2 * q8_2 + q8_3 
	* q8_3 + q8_4 * q8_4 + q8_5 * q8_5 + q8_6 * q8_6 + q8_7 * q8_7 + q8_8 * q8_8 + 
	q8_9 * q8_9 + q8_10 * q8_10 - 1.0)^2 + (q8_1 * q9_1 + q8_2 * q9_2 + q8_3 * q9_3 
	+ q8_4 * q9_4 + q8_5 * q9_5 + q8_6 * q9_6 + q8_7 * q9_7 + q8_8 * q9_8 + q8_9 * 
	q9_9 + q8_10 * q9_10)^2 + (q8_1 * q10_1 + q8_2 * q10_2 + q8_3 * q10_3 + q8_4 * 
	q10_4 + q8_5 * q10_5 + q8_6 * q10_6 + q8_7 * q10_7 + q8_8 * q10_8 + q8_9 * 
	q10_9 + q8_10 * q10_10)^2 + (q9_1 * q9_1 + q9_2 * q9_2 + q9_3 * q9_3 + q9_4 * 
	q9_4 + q9_5 * q9_5 + q9_6 * q9_6 + q9_7 * q9_7 + q9_8 * q9_8 + q9_9 * q9_9 + 
	q9_10 * q9_10 - 1.0)^2 + (q9_1 * q10_1 + q9_2 * q10_2 + q9_3 * q10_3 + q9_4 * 
	q10_4 + q9_5 * q10_5 + q9_6 * q10_6 + q9_7 * q10_7 + q9_8 * q10_8 + q9_9 * 
	q10_9 + q9_10 * q10_10)^2 + (q10_1 * q10_1 + q10_2 * q10_2 + q10_3 * q10_3 + 
	q10_4 * q10_4 + q10_5 * q10_5 + q10_6 * q10_6 + q10_7 * q10_7 + q10_8 * q10_8 + 
	q10_9 * q10_9 + q10_10 * q10_10 - 1.0)^2 + (q1_1 * r1_1 - 0.2)^2 + (q1_1 * r1_2 
	+ q1_2 * r2_2)^2 + (q1_1 * r1_3 + q1_2 * r2_3 + q1_3 * r3_3)^2 + (q1_2 * r2_4 + 
	q1_3 * r3_4 + q1_4 * r4_4)^2 + (q1_3 * r3_5 + q1_4 * r4_5 + q1_5 * r5_5)^2 + 
	(q1_4 * r4_6 + q1_5 * r5_6 + q1_6 * r6_6)^2 + (q1_5 * r5_7 + q1_6 * r6_7 + q1_7 
	* r7_7)^2 + (q1_6 * r6_8 + q1_7 * r7_8 + q1_8 * r8_8)^2 + (q1_7 * r7_9 + q1_8 * 
	r8_9 + q1_9 * r9_9)^2 + (q1_8 * r8_10 + q1_9 * r9_10 + q1_10 * r10_10)^2 + 
	(q2_1 * r1_1 + 0.1)^2 + (q2_1 * r1_2 + q2_2 * r2_2 - 0.4)^2 + (q2_1 * r1_3 + 
	q2_2 * r2_3 + q2_3 * r3_3 + 0.1)^2 + (q2_2 * r2_4 + q2_3 * r3_4 + q2_4 * 
	r4_4)^2 + (q2_3 * r3_5 + q2_4 * r4_5 + q2_5 * r5_5)^2 + (q2_4 * r4_6 + q2_5 * 
	r5_6 + q2_6 * r6_6)^2 + (q2_5 * r5_7 + q2_6 * r6_7 + q2_7 * r7_7)^2 + (q2_6 * 
	r6_8 + q2_7 * r7_8 + q2_8 * r8_8)^2 + (q2_7 * r7_9 + q2_8 * r8_9 + q2_9 * 
	r9_9)^2 + (q2_8 * r8_10 + q2_9 * r9_10 + q2_10 * r10_10)^2 + (q3_1 * r1_1)^2 + 
	(q3_1 * r1_2 + q3_2 * r2_2 + 0.2)^2 + (q3_1 * r1_3 + q3_2 * r2_3 + q3_3 * r3_3 
	- 0.6)^2 + (q3_2 * r2_4 + q3_3 * r3_4 + q3_4 * r4_4 + 0.2)^2 + (q3_3 * r3_5 + 
	q3_4 * r4_5 + q3_5 * r5_5)^2 + (q3_4 * r4_6 + q3_5 * r5_6 + q3_6 * r6_6)^2 + 
	(q3_5 * r5_7 + q3_6 * r6_7 + q3_7 * r7_7)^2 + (q3_6 * r6_8 + q3_7 * r7_8 + q3_8 
	* r8_8)^2 + (q3_7 * r7_9 + q3_8 * r8_9 + q3_9 * r9_9)^2 + (q3_8 * r8_10 + q3_9 
	* r9_10 + q3_10 * r10_10)^2 + (q4_1 * r1_1)^2 + (q4_1 * r1_2 + q4_2 * r2_2)^2 + 
	(q4_1 * r1_3 + q4_2 * r2_3 + q4_3 * r3_3 + 0.3)^2 + (q4_2 * r2_4 + q4_3 * r3_4 
	+ q4_4 * r4_4 - 0.8)^2 + (q4_3 * r3_5 + q4_4 * r4_5 + q4_5 * r5_5 + 0.3)^2 + 
	(q4_4 * r4_6 + q4_5 * r5_6 + q4_6 * r6_6)^2 + (q4_5 * r5_7 + q4_6 * r6_7 + q4_7 
	* r7_7)^2 + (q4_6 * r6_8 + q4_7 * r7_8 + q4_8 * r8_8)^2 + (q4_7 * r7_9 + q4_8 * 
	r8_9 + q4_9 * r9_9)^2 + (q4_8 * r8_10 + q4_9 * r9_10 + q4_10 * r10_10)^2 + 
	(q5_1 * r1_1)^2 + (q5_1 * r1_2 + q5_2 * r2_2)^2 + (q5_1 * r1_3 + q5_2 * r2_3 + 
	q5_3 * r3_3)^2 + (q5_2 * r2_4 + q5_3 * r3_4 + q5_4 * r4_4 + 0.4)^2 + (q5_3 * 
	r3_5 + q5_4 * r4_5 + q5_5 * r5_5 - 1.0)^2 + (q5_4 * r4_6 + q5_5 * r5_6 + q5_6 * 
	r6_6 + 0.4)^2 + (q5_5 * r5_7 + q5_6 * r6_7 + q5_7 * r7_7)^2 + (q5_6 * r6_8 + 
	q5_7 * r7_8 + q5_8 * r8_8)^2 + (q5_7 * r7_9 + q5_8 * r8_9 + q5_9 * r9_9)^2 + 
	(q5_8 * r8_10 + q5_9 * r9_10 + q5_10 * r10_10)^2 + (q6_1 * r1_1)^2 + (q6_1 * 
	r1_2 + q6_2 * r2_2)^2 + (q6_1 * r1_3 + q6_2 * r2_3 + q6_3 * r3_3)^2 + (q6_2 * 
	r2_4 + q6_3 * r3_4 + q6_4 * r4_4)^2 + (q6_3 * r3_5 + q6_4 * r4_5 + q6_5 * r5_5 
	+ 0.5)^2 + (q6_4 * r4_6 + q6_5 * r5_6 + q6_6 * r6_6 - 1.2)^2 + (q6_5 * r5_7 + 
	q6_6 * r6_7 + q6_7 * r7_7 + 0.5)^2 + (q6_6 * r6_8 + q6_7 * r7_8 + q6_8 * 
	r8_8)^2 + (q6_7 * r7_9 + q6_8 * r8_9 + q6_9 * r9_9)^2 + (q6_8 * r8_10 + q6_9 * 
	r9_10 + q6_10 * r10_10)^2 + (q7_1 * r1_1)^2 + (q7_1 * r1_2 + q7_2 * r2_2)^2 + 
	(q7_1 * r1_3 + q7_2 * r2_3 + q7_3 * r3_3)^2 + (q7_2 * r2_4 + q7_3 * r3_4 + q7_4 
	* r4_4)^2 + (q7_3 * r3_5 + q7_4 * r4_5 + q7_5 * r5_5)^2 + (q7_4 * r4_6 + q7_5 * 
	r5_6 + q7_6 * r6_6 + 0.6)^2 + (q7_5 * r5_7 + q7_6 * r6_7 + q7_7 * r7_7 - 1.4)^2 
	+ (q7_6 * r6_8 + q7_7 * r7_8 + q7_8 * r8_8 + 0.6)^2 + (q7_7 * r7_9 + q7_8 * 
	r8_9 + q7_9 * r9_9)^2 + (q7_8 * r8_10 + q7_9 * r9_10 + q7_10 * r10_10)^2 + 
	(q8_1 * r1_1)^2 + (q8_1 * r1_2 + q8_2 * r2_2)^2 + (q8_1 * r1_3 + q8_2 * r2_3 + 
	q8_3 * r3_3)^2 + (q8_2 * r2_4 + q8_3 * r3_4 + q8_4 * r4_4)^2 + (q8_3 * r3_5 + 
	q8_4 * r4_5 + q8_5 * r5_5)^2 + (q8_4 * r4_6 + q8_5 * r5_6 + q8_6 * r6_6)^2 + 
	(q8_5 * r5_7 + q8_6 * r6_7 + q8_7 * r7_7 + 0.7)^2 + (q8_6 * r6_8 + q8_7 * r7_8 
	+ q8_8 * r8_8 - 1.6)^2 + (q8_7 * r7_9 + q8_8 * r8_9 + q8_9 * r9_9 + 0.7)^2 + 
	(q8_8 * r8_10 + q8_9 * r9_10 + q8_10 * r10_10)^2 + (q9_1 * r1_1)^2 + (q9_1 * 
	r1_2 + q9_2 * r2_2)^2 + (q9_1 * r1_3 + q9_2 * r2_3 + q9_3 * r3_3)^2 + (q9_2 * 
	r2_4 + q9_3 * r3_4 + q9_4 * r4_4)^2 + (q9_3 * r3_5 + q9_4 * r4_5 + q9_5 * 
	r5_5)^2 + (q9_4 * r4_6 + q9_5 * r5_6 + q9_6 * r6_6)^2 + (q9_5 * r5_7 + q9_6 * 
	r6_7 + q9_7 * r7_7)^2 + (q9_6 * r6_8 + q9_7 * r7_8 + q9_8 * r8_8 + 0.8)^2 + 
	(q9_7 * r7_9 + q9_8 * r8_9 + q9_9 * r9_9 - 1.8)^2 + (q9_8 * r8_10 + q9_9 * 
	r9_10 + q9_10 * r10_10 + 0.8)^2 + (q10_1 * r1_1)^2 + (q10_1 * r1_2 + q10_2 * 
	r2_2)^2 + (q10_1 * r1_3 + q10_2 * r2_3 + q10_3 * r3_3)^2 + (q10_2 * r2_4 + 
	q10_3 * r3_4 + q10_4 * r4_4)^2 + (q10_3 * r3_5 + q10_4 * r4_5 + q10_5 * r5_5)^2 
	+ (q10_4 * r4_6 + q10_5 * r5_6 + q10_6 * r6_6)^2 + (q10_5 * r5_7 + q10_6 * r6_7 
	+ q10_7 * r7_7)^2 + (q10_6 * r6_8 + q10_7 * r7_8 + q10_8 * r8_8)^2 + (q10_7 * 
	r7_9 + q10_8 * r8_9 + q10_9 * r9_9 + 0.9)^2 + (q10_8 * r8_10 + q10_9 * r9_10 + 
	q10_10 * r10_10 - 20.0)^2;



	display q1_1;
	display q1_2;
	display q1_3;
	display q1_4;
	display q1_5;
	display q1_6;
	display q1_7;
	display q1_8;
	display q1_9;
	display q1_10;
	display q2_1;
	display q2_2;
	display q2_3;
	display q2_4;
	display q2_5;
	display q2_6;
	display q2_7;
	display q2_8;
	display q2_9;
	display q2_10;
	display q3_1;
	display q3_2;
	display q3_3;
	display q3_4;
	display q3_5;
	display q3_6;
	display q3_7;
	display q3_8;
	display q3_9;
	display q3_10;
	display q4_1;
	display q4_2;
	display q4_3;
	display q4_4;
	display q4_5;
	display q4_6;
	display q4_7;
	display q4_8;
	display q4_9;
	display q4_10;
	display q5_1;
	display q5_2;
	display q5_3;
	display q5_4;
	display q5_5;
	display q5_6;
	display q5_7;
	display q5_8;
	display q5_9;
	display q5_10;
	display q6_1;
	display q6_2;
	display q6_3;
	display q6_4;
	display q6_5;
	display q6_6;
	display q6_7;
	display q6_8;
	display q6_9;
	display q6_10;
	display q7_1;
	display q7_2;
	display q7_3;
	display q7_4;
	display q7_5;
	display q7_6;
	display q7_7;
	display q7_8;
	display q7_9;
	display q7_10;
	display q8_1;
	display q8_2;
	display q8_3;
	display q8_4;
	display q8_5;
	display q8_6;
	display q8_7;
	display q8_8;
	display q8_9;
	display q8_10;
	display q9_1;
	display q9_2;
	display q9_3;
	display q9_4;
	display q9_5;
	display q9_6;
	display q9_7;
	display q9_8;
	display q9_9;
	display q9_10;
	display q10_1;
	display q10_2;
	display q10_3;
	display q10_4;
	display q10_5;
	display q10_6;
	display q10_7;
	display q10_8;
	display q10_9;
	display q10_10;
	display r1_1;
	display r1_2;
	display r1_3;
	display r2_2;
	display r2_3;
	display r2_4;
	display r3_3;
	display r3_4;
	display r3_5;
	display r4_4;
	display r4_5;
	display r4_6;
	display r5_5;
	display r5_6;
	display r5_7;
	display r6_6;
	display r6_7;
	display r6_8;
	display r7_7;
	display r7_8;
	display r7_9;
	display r8_8;
	display r8_9;
	display r8_10;
	display r9_9;
	display r9_10;
	display r10_10;
display obj;
