#
#**************************
# SET UP THE INITIAL DATA *
#**************************
#   Problem :
#   *********
#   The small Dallas water distribution problem
#   The problem is also named "W30" in some references.
#   This is a nonlinear network problem with conditioning of
#   the order of 10**4.
#   Source:
#   R. Dembo,
#   private communication, 1986.
#   SIF input: Ph. Toint, June 1990.
#   classification ONR2-MN-46-31
#   Number of arcs
#   Number of nodes
#   Constants
#   Linear elements
#   Network flow constraints
#   Solution
	param n := 46;
	param nodes := 31;

	var x1 >= 0.0 ,  <= 21.1673 ,  := 21.1673;
	var x2 >= 0.0 ,  <= 43.76350000000001 ,  := 43.76350000000001;
	var x3 >= 0.0 ,  <= 32.8255 ,  := 32.8255;
	var x4 >= -200.0 ,  <= 200.0 ,  := 1.42109e-14;
	var x5 >= -200.0 ,  <= 200.0 ,  := 168.82600000000002;
	var x6 >= -200.0 ,  <= 200.0 ,  := -200.0;
	var x7 >= -200.0 ,  <= 200.0 ,  := 28.174500000000002;
	var x8 >= -200.0 ,  <= 200.0 ,  := 87.56030000000001;
	var x9 >= -200.0 ,  <= 200.0 ,  := -59.3858;
	var x10 >= -200.0 ,  <= 200.0 ,  := -59.7888;
	var x11 >= -200.0 ,  <= 200.0 ,  := 183.383;
	var x12 >= -200.0 ,  <= 200.0 ,  := -200.0;
	var x13 >= -200.0 ,  <= 200.0 ,  := -168.33100000000002;
	var x14 >= -200.0 ,  <= 200.0 ,  := -200.0;
	var x15 >= -200.0 ,  <= 200.0 ,  := 200.0;
	var x16 >= -200.0 ,  <= 200.0 ,  := 0.2;
	var x17 >= -200.0 ,  <= 200.0 ,  := 200.0;
	var x18 >= -200.0 ,  <= 200.0 ,  := -76.7574;
	var x19 >= 0.0 ,  <= 22.012 ,  := 22.012;
	var x20 >= -200.0 ,  <= 200.0 ,  := 13.6703;
	var x21 >= 0.0 ,  <= 13.6703 ,  := 13.6703;
	var x22 >= -200.0 ,  <= 200.0 ,  := -198.461;
	var x23 >= -200.0 ,  <= 200.0 ,  := 181.531;
	var x24 >= -200.0 ,  <= 200.0 ,  := -19.313299999999998;
	var x25 >= -200.0 ,  <= 200.0 ,  := 200.0;
	var x26 >= -200.0 ,  <= 200.0 ,  := -198.792;
	var x27 >= -200.0 ,  <= 200.0 ,  := 1.155;
	var x28 >= -200.0 ,  <= 200.0 ,  := 1.0 ;
	var x29 >= -200.0 ,  <= 200.0 ,  := 200.0;
	var x30 >= -200.0 ,  <= 200.0 ,  := 0.272;
	var x31 >= -200.0 ,  <= 200.0 ,  := -200.0;
	var x32 >= -200.0 ,  <= 200.0 ,  := -19.8843;
	var x33 >= -200.0 ,  <= 200.0 ,  := 178.834;
	var x34 >= -200.0 ,  <= 200.0 ,  := -179.589;
	var x35 >= -200.0 ,  <= 200.0 ,  := -19.8843;
	var x36 >= -200.0 ,  <= 200.0 ,  := -200.0;
	var x37 >= -200.0 ,  <= 200.0 ,  := 179.589;
	var x38 >= -200.0 ,  <= 200.0 ,  := -200.0;
	var x39 >= -200.0 ,  <= 200.0 ,  := -200.0;
	var x40 >= -200.0 ,  <= 200.0 ,  := 200.0;
	var x41 >= -200.0 ,  <= 200.0 ,  := 200.0;
	var x42 >= -200.0 ,  <= 200.0 ,  := 98.76939999999999;
	var x43 >= -200.0 ,  <= 200.0 ,  := 13.6703;
	var x44 >= -200.0 ,  <= 200.0 ,  := 32.8255;
	var x45 >= -200.0 ,  <= 200.0 ,  := 43.76350000000001;
	var x46 >= -200.0 ,  <= 200.0 ,  := -178.833;

minimize obj:
	0.5 * (-(min(x1,(sqrt(448.06))))
	 * (sqrt(max((251.2*(448.06-(min(x1,(sqrt(448.06))))*(min(x1,(sqrt(448.06))))))
	,(1.0d-14)))) - 448.06 * (sqrt(251.2)*asin((min(x1,(sqrt(448.06))))
	/(sqrt(448.06)))) )  + 0.5 * (-(min(x2,(sqrt(1915.26))))
	 * (sqrt(max((64.63*(1915.26-(min(x2,(sqrt(1915.26))))*(min(x2,(sqrt(1915.26))))
	)),(1.0d-14)))) - 1915.26 * (sqrt(64.63)*asin((min(x2,(sqrt(1915.26))))
	/(sqrt(1915.26)))) )  + 0.5 * (-(min(x3,(sqrt(1077.52))))
	 * (sqrt(max((48.14*(1077.52-(min(x3,(sqrt(1077.52))))*(min(x3,(sqrt(1077.52))))
	)),(1.0d-14)))) - 1077.52 * (sqrt(48.14)*asin((min(x3,(sqrt(1077.52))))
	/(sqrt(1077.52)))) )  + (((850559.0d0/2.85*6900.0)/(122.0^1.85))/(66.0^4.87))
	 * (abs(x4))^2 * ((abs(x4))^0.85) + (((850559.0d0/2.85*100.0)/(100.0^1.85))
	/(10.0^4.87)) * (abs(x5))^2 * ((abs(x5))^0.85) + (((850559.0d0/2.85*663.0)
	/(120.0^1.85))/(36.0^4.87)) * (abs(x6))^2 * ((abs(x6))^0.85)
	 + (((850559.0d0/2.85*5100.0)/(122.0^1.85))/(66.0^4.87)) * (abs(x7))
	^2 * ((abs(x7))^0.85) + (((850559.0d0/2.85*645.0)/(120.0^1.85))/(30.0^4.87))
	 * (abs(x8))^2 * ((abs(x8))^0.85) + (((850559.0d0/2.85*7400.0)/(122.0^1.85))
	/(66.0^4.87)) * (abs(x9))^2 * ((abs(x9))^0.85) + (((850559.0d0/2.85*5000.0)
	/(95.0^1.85))/(66.0^4.87)) * (abs(x10))^2 * ((abs(x10))^0.85)
	 + (((850559.0d0/2.85*800.0)/(107.0^1.85))/(54.0^4.87)) * (abs(x11))
	^2 * ((abs(x11))^0.85) + (((850559.0d0/2.85*5200.0)/(110.00000000000001^1.85))
	/(48.0^4.87)) * (abs(x12))^2 * ((abs(x12))^0.85) + (((850559.0d0/2.85*6000.0)
	/(110.00000000000001^1.85))/(48.0^4.87)) * (abs(x13))^2 * ((abs(x13))^0.85)
	 + (((850559.0d0/2.85*400.0)/(100.0^1.85))/(54.0^4.87)) * (abs(x14))
	^2 * ((abs(x14))^0.85) + (((850559.0d0/2.85*40.0)/(130.0^1.85))/(31.22^4.87))
	 * (abs(x15))^2 * ((abs(x15))^0.85) + (((850559.0d0/2.85*4500.0)/(122.0^1.85))
	/(66.0^4.87)) * (abs(x16))^2 * ((abs(x16))^0.85) + (((850559.0d0/2.85*5100.0)
	/(110.00000000000001^1.85))/(24.0^4.87)) * (abs(x17))^2 * ((abs(x17))^0.85)
	 + (((850559.0d0/2.85*30.0)/(118.0^1.85))/(48.0^4.87)) * (abs(x18))
	^2 * ((abs(x18))^0.85) + 0.5 * (-(min(x19,(sqrt(484.53))))
	 * (sqrt(max((112.97*(484.53-(min(x19,(sqrt(484.53))))*(min(x19,(sqrt(484.53))))
	)),(1.0d-14)))) - 484.53 * (sqrt(112.97)*asin((min(x19,(sqrt(484.53))))
	/(sqrt(484.53)))) )  + (((850559.0d0/2.85*26000.0)/(110.00000000000001^1.85))
	/(48.0^4.87)) * (abs(x20))^2 * ((abs(x20))^0.85)
	 + 0.5 * (-(min(x21,(sqrt(186.88))))
	 * (sqrt(max((160.61*(186.88-(min(x21,(sqrt(186.88))))*(min(x21,(sqrt(186.88))))
	)),(1.0d-14)))) - 186.88 * (sqrt(160.61)*asin((min(x21,(sqrt(186.88))))
	/(sqrt(186.88)))) )  + (((850559.0d0/2.85*520.0)/(130.0^1.85))/(33.61^4.87))
	 * (abs(x22))^2 * ((abs(x22))^0.85) + (((850559.0d0/2.85*4600.0)/(95.0^1.85))
	/(54.0^4.87)) * (abs(x23))^2 * ((abs(x23))^0.85) + (((850559.0d0/2.85*5400.0)
	/(95.0^1.85))/(54.0^4.87)) * (abs(x24))^2 * ((abs(x24))^0.85)
	 + (((850559.0d0/2.85*5600.0)/(110.00000000000001^1.85))/(12.0^4.87))
	 * (abs(x25))^2 * ((abs(x25))^0.85) + (((850559.0d0/2.85*3300.0)
	/(110.00000000000001^1.85))/(12.0^4.87)) * (abs(x26))^2 * ((abs(x26))^0.85)
	 + (((850559.0d0/2.85*2200.0)/(124.0^1.85))/(24.0^4.87)) * (abs(x27))
	^2 * ((abs(x27))^0.85) + (((850559.0d0/2.85*1000.0)/(110.00000000000001^1.85))
	/(24.0^4.87)) * (abs(x28))^2 * ((abs(x28))^0.85) + (((850559.0d0/2.85*5900.0)
	/(112.99999999999999^1.85))/(24.0^4.87)) * (abs(x29))^2 * ((abs(x29))^0.85)
	 + (((850559.0d0/2.85*2800.0)/(112.99999999999999^1.85))/(24.0^4.87))
	 * (abs(x30))^2 * ((abs(x30))^0.85) + (((850559.0d0/2.85*2700.0)
	/(110.00000000000001^1.85))/(12.0^4.87)) * (abs(x31))^2 * ((abs(x31))^0.85)
	 + (((850559.0d0/2.85*3100.0)/(95.0^1.85))/(54.0^4.87)) * (abs(x32))
	^2 * ((abs(x32))^0.85) + (((850559.0d0/2.85*100.0)/(100.0^1.85))/(10.0^4.87))
	 * (abs(x33))^2 * ((abs(x33))^0.85) + (((850559.0d0/2.85*4300.0)
	/(112.99999999999999^1.85))/(24.0^4.87)) * (abs(x34))^2 * ((abs(x34))^0.85)
	 + (((850559.0d0/2.85*2200.0)/(95.0^1.85))/(54.0^4.87)) * (abs(x35))
	^2 * ((abs(x35))^0.85) + (((850559.0d0/2.85*1800.0)/(110.00000000000001^1.85))
	/(54.0^4.87)) * (abs(x36))^2 * ((abs(x36))^0.85) + (((850559.0d0/2.85*100.0)
	/(110.00000000000001^1.85))/(24.0^4.87)) * (abs(x37))^2 * ((abs(x37))^0.85)
	 + (((850559.0d0/2.85*1310.0)/(100.0^1.85))/(30.0^4.87)) * (abs(x38))
	^2 * ((abs(x38))^0.85) + (((850559.0d0/2.85*665.0)/(120.0^1.85))/(36.0^4.87))
	 * (abs(x39))^2 * ((abs(x39))^0.85) + (((850559.0d0/2.85*1100.0)/(120.0^1.85))
	/(36.0^4.87)) * (abs(x40))^2 * ((abs(x40))^0.85) + (((850559.0d0/2.85*32.3)
	/(100.0^1.85))/(10.0^4.87)) * (abs(x41))^2 * ((abs(x41))^0.85)
	 - 638.4000000000001*x42 - 633.0*x43 - 554.5*x44 - 505.0*x45 - 436.9*x46;

subject to n1:
	x46 + x41 - x1 = 0;
subject to n2:
	x45 - x2 = 0;
subject to n3:
	x44 - x3 = 0;
subject to n4:
	-x4 = 0;
subject to n5:
	x16 - x7 - x6 - x5 - 2.8 = 0;
subject to n6:
	x7 - x9 - x8 = 0;
subject to n7:
	x9 - x10 - 0.403 = 0;
subject to n8:
	x10 + x2 - x12 - x11 - 0.592 = 0;
subject to n9:
	x12 + x3 - x13 - 1.156 = 0;
subject to n10:
	x4 - x16 - x15 - x14 - 0.2 = 0;
subject to n11:
	x15 + x13 + x5 - x17 - 0.49500000000000005 = 0;
subject to n12:
	x20 + x19 + x8 + x6 - x18 = 0;
subject to n13:
	x42 + x18 - x19 = 0;
subject to n14:
	x21 - x20 = 0;
subject to n15:
	x43 - x21 = 0;
subject to n16:
	x14 + x11 - x23 - x22 - 0.313 = 0;
subject to n17:
	x23 - x25 - x24 - 0.844 = 0;
subject to n18:
	x31 + x25 + x22 - x26 - 0.331 = 0;
subject to n19:
	x26 + x17 - x28 - x27 - 0.053 = 0;
subject to n20:
	x28 = 0;
subject to n21:
	-x31 - x30 - x29 - 0.272 = 0;
subject to n22:
	x30 + x27 - 0.883 = 0;
subject to n23:
	x24 - x32 - 0.5710000000000001 = 0;
subject to n24:
	x38 + x29 - x34 - x33 - 0.755 = 0;
subject to n25:
	x32 - x35 = 0;
subject to n26:
	x35 - x37 - x36 - 0.527 = 0;
subject to n27:
	x37 + x34 = 0;
subject to n28:
	x36 - x40 - x39 - x38 = 0;
subject to n29:
	x39 + x33 + x1 - 0.0010 = 0;
subject to n30:
	x40 - x41 = 0;
subject to n31:
	-x46 - x45 - x44 - x43 - x42 + 10.196000000000002 = 0;


	display x1;
	display x2;
	display x3;
	display x4;
	display x5;
	display x6;
	display x7;
	display x8;
	display x9;
	display x10;
	display x11;
	display x12;
	display x13;
	display x14;
	display x15;
	display x16;
	display x17;
	display x18;
	display x19;
	display x20;
	display x21;
	display x22;
	display x23;
	display x24;
	display x25;
	display x26;
	display x27;
	display x28;
	display x29;
	display x30;
	display x31;
	display x32;
	display x33;
	display x34;
	display x35;
	display x36;
	display x37;
	display x38;
	display x39;
	display x40;
	display x41;
	display x42;
	display x43;
	display x44;
	display x45;
	display x46;
display obj;
