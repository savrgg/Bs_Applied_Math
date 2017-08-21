# Permission to use, copy, modify, and distribute this software and
# its documentation for any purpose and without fee is hereby
# granted, provided that the above copyright notice appear in all
# copies and that the copyright notice and this
# permission notice appear in all supporting documentation.                     

#   Source:  Problem 23 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

#   See also Buckley #181 (p. 45).   CHROSEN problem

#   SIF input: Ph. Toint, Dec 1989.

#   classification SUR2-AN-V-0

param N:=15;

var x{i in 1..N} := -1;

minimize f:
       sum {i in 1..N-1} ( 4*( x[i] - x[i+1]^2 )^2 + ( 1 - x[i+1] )^2  );

display f;
display x;
