# AMPL Model by Hande Y. Benson
#
# Copyright (C) 2001 Princeton University
# All Rights Reserved
#
# Permission to use, copy, modify, and distribute this software and
# its documentation for any purpose and without fee is hereby
# granted, provided that the above copyright notice appear in all
# copies and that the copyright notice and this
# permission notice appear in all supporting documentation.                     

#   Source: problem 10 in
#   P.T. Boggs and J.W. Tolle,
#   "A strategy for global convergence in a sequential 
#    quadratic programming algorithm",
#   SINUM 26(3), pp. 600-623, 1989.

#   The problem as stated in the paper seems to contain a typo.
#   In order to make the second constraint feasible at the proposed 
#   solution, the sign of x2 in the second constraint has been set 
#   to - instead of +.

#   The problem is not convex.

#   SIF input: Ph. Toint, June 1993.

#   classification LOR2-AN-2-2

param xinit{1..5};
var x{1..5};
minimize f:
	exp( x[1]*x[2]*x[3]*x[4]*x[5] ) - 0.5*( x[1]^3 + x[2]^3 + 1)^2  ;
subject to cons1:
        x[1]^2 + x[2]^2 + x[3]^2 + x[4]^2 + x[5]^2 = 10;
subject to cons2:
	x[2]+x[3] - 5*x[4]*x[5] =0;
subject to cons3:
        x[1]^3 + x[2]^3 + 1   = 0;
data;
param xinit:= 1 -1.71  2 1.59 3 1.82  4 -0.763 5 -0.763;

display f;
solve;
display x;
