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

#   Source: 
#   DATASTREAM   Period: 15.1.91 to 15.3.96 (62 observations),
#   collected by D. Baudoux, July 1996.

#   SIF input: Ph. Toint, July 1996.

#   classification SLR2-MN-12-1

param NS := 12;
param NR := 62;

param F{1..NS,1..NR};
param R{1..NR};

var s{1..NS} >= 0.0, <= 1.0, := 1/NS;

minimize f:
	sum {i in 1..NR} (sum {j in 1..NS} s[j]*F[j,i] - R[i])^2;
subject to cons1:
	sum {i in 1..NS} s[i] - 1= 0;

data;

param F:=
 1	1                0.02802144
 1	2                -0.000237
 1	3                0.01635846
 1	4                0.01119664
 1	5                -0.0063052
 1	6                0.00162501
 1	7                0.01506489
 1	8                0.01248192
 1	9                0.00819364
 1	10               0.00469729
 1	11               0.0141744
 1	12               0.02114737
 1	13               0.00566105
 1	14               -0.0045603
 1	15               0.01052255
 1	16               0.00701282
 1	17               0.00499437
 1	18               0.0
 1	19               0.00524953
 1	20               0.02764239
 1	21               0.0328613
 1	22               0.01121753
 1	23               0.01998054
 1	24               0.01507346
 1	25               0.00545113
 1	26               0.01265034
 1	27               0.00086154
 1	28               0.01629365
 1	29               0.02674088
 1	30               -0.0028283
 1	31               0.00608639
 1	32               -0.0120404
 1	33               0.0242554
 1	34               0.02048871
 1	35               0.02713002
 1	36               0.00382081
 1	37               -0.0174316
 1	38               -0.0057826
 1	39               -0.0075103
 1	40               -0.0137687
 1	41               0.00490366
 1	42               0.00430564
 1	43               -0.015834
 1	44               -0.0020909
 1	45               0.01344508
 1	46               0.01659775
 1	47               -0.0014688
 1	48               0.0115983
 1	49               0.01107383
 1	50               0.01687134
 1	51               0.01485068
 1	52               0.03430532
 1	53               -0.0043532
 1	54               0.0195711
 1	55               0.01179293
 1	56               0.00847671
 1	57               0.0146095
 1	58               0.01750579
 1	59               0.00833576
 1	60               0.02196482
 1	61               -0.0148144
 1	62               0.00907008

 2	1                0.06839808
 2	2                0.11464542
 2	3                0.02391108
 2	4                0.01730916
 2	5                0.03985465
 2	6                -0.0284541
 2	7                0.03014387
 2	8                -0.0043781
 2	9                0.04352908
 2	10               -0.0313116
 2	11               -0.0604625
 2	12               0.03727582
 2	13               0.01361736
 2	14               -0.0138246
 2	15               0.00565259
 2	16               -0.004328
 2	17               -0.0246133
 2	18               0.02714435
 2	19               -0.0513326
 2	20               -0.0578522
 2	21               0.11776573
 2	22               -0.0294416
 2	23               0.04846583
 2	24               0.0021062
 2	25               0.07112832
 2	26               -0.0261799
 2	27               -0.0217402
 2	28               0.01046127
 2	29               0.08218002
 2	30               0.06404283
 2	31               -0.0309792
 2	32               -0.03096
 2	33               0.06890906
 2	34               -0.0099322
 2	35               0.02470467
 2	36               0.01070497
 2	37               -0.0648169
 2	38               -0.0867818
 2	39               -0.0118189
 2	40               -0.0292303
 2	41               -0.0474585
 2	42               0.01299229
 2	43               0.02902949
 2	44               0.00934787
 2	45               -0.0394707
 2	46               0.02680211
 2	47               -0.0302386
 2	48               -0.0227665
 2	49               0.02188145
 2	50               -0.0726653
 2	51               0.06472895
 2	52               0.04080201
 2	53               -0.0176916
 2	54               -0.0174385
 2	55               0.11707885
 2	56               -0.0196384
 2	57               0.00977683
 2	58               0.04120185
 2	59               -0.0051549
 2	60               0.04551689
 2	61               -0.0252174
 2	62               0.01001894

 3	1                0.03009985
 3	2                0.00113202
 3	3                0.02014134
 3	4                0.00609629
 3	5                0.00041314
 3	6                -0.0022713
 3	7                0.01628035
 3	8                0.01568015
 3	9                0.00915592
 3	10               -0.0006622
 3	11               0.01722995
 3	12               0.01700326
 3	13               0.00634168
 3	14               -0.0091024
 3	15               0.0141967
 3	16               0.01805168
 3	17               -0.0075903
 3	18               -0.0169895
 3	19               -0.0010204
 3	20               0.0119382
 3	21               0.04706328
 3	22               -0.0065674
 3	23               0.00533721
 3	24               0.0316723
 3	25               -0.0015788
 3	26               0.04234509
 3	27               0.02123953
 3	28               0.02167813
 3	29               0.02929614
 3	30               -0.0015172
 3	31               -0.0125235
 3	32               0.03889626
 3	33               0.02053325
 3	34               -0.0012012
 3	35               0.01257767
 3	36               0.00841293
 3	37               -0.0258624
 3	38               -0.0102267
 3	39               -0.004479
 3	40               -0.0310854
 3	41               -0.0043269
 3	42               0.0192379
 3	43               -0.030522
 3	44               0.00311075
 3	45               0.0101588
 3	46               0.02429471
 3	47               -0.0176725
 3	48               0.01294056
 3	49               0.00420648
 3	50               0.00449915
 3	51               0.0
 3	52               0.06800865
 3	53               -0.0112316
 3	54               0.02515601
 3	55               0.02306449
 3	56               0.0073444
 3	57               0.01564303
 3	58               0.03084961
 3	59               0.01560227
 3	60               0.01436445
 3	61               -0.0139043
 3	62               0.01262528

 4	1                0.02765259
 4	2                0.00825095
 4	3                0.02300206
 4	4                -0.0109541
 4	5                0.0075051
 4	6                -0.0013018
 4	7                0.02042146
 4	8                0.01036122
 4	9                0.00786683
 4	10               -0.0013241
 4	11               0.02267969
 4	12               0.01487547
 4	13               0.00531164
 4	14               -0.0015382
 4	15               0.01232501
 4	16               0.021637
 4	17               -0.0068652
 4	18               -0.0156514
 4	19               -0.0011925
 4	20               0.03608384
 4	21               0.03060179
 4	22               -0.0001242
 4	23               0.01261183
 4	24               0.01822198
 4	25               0.0208484
 4	26               0.02921733
 4	27               0.01559901
 4	28               0.00265402
 4	29               0.03300293
 4	30               0.01390252
 4	31               0.02618702
 4	32               0.02305596
 4	33               0.00676091
 4	34               -0.0050875
 4	35               0.02495398
 4	36               -0.0082318
 4	37               -0.0199205
 4	38               -0.0122157
 4	39               -0.0138737
 4	40               -0.0156497
 4	41               -0.0069589
 4	42               0.01854347
 4	43               -0.0196348
 4	44               -0.0026452
 4	45               -0.0041136
 4	46               0.02315343
 4	47               -0.0198672
 4	48               0.01392878
 4	49               -0.0044366
 4	50               0.00977181
 4	51               0.00212687
 4	52               0.0311986
 4	53               0.00308721
 4	54               0.03221339
 4	55               0.01610098
 4	56               -0.0060155
 4	57               0.01156268
 4	58               0.03117856
 4	59               0.02853774
 4	60               0.01889475
 4	61               -0.0084619
 4	62               0.01389078

 5	1                0.01934344
 5	2                -0.0001824
 5	3                0.01368738
 5	4                -0.0011702
 5	5                0.0063987
 5	6                -0.0012536
 5	7                0.01631848
 5	8                0.00855757
 5	9                0.00629811
 5	10               0.00756259
 5	11               0.01708222
 5	12               0.01891594
 5	13               0.00524476
 5	14               -0.0021532
 5	15               0.00431571
 5	16               0.0098339
 5	17               0.00196399
 5	18               0.00236851
 5	19               0.01417746
 5	20               0.02771752
 5	21               0.01993433
 5	22               0.00774124
 5	23               0.01201704
 5	24               0.01525628
 5	25               0.02701902
 5	26               0.00641488
 5	27               -0.0007161
 5	28               0.00121838
 5	29               0.01281317
 5	30               0.03569157
 5	31               0.03316501
 5	32               0.02476882
 5	33               0.01933613
 5	34               -0.0151122
 5	35               -0.0032742
 5	36               -0.0117874
 5	37               -0.0197497
 5	38               0.00079793
 5	39               -0.0090359
 5	40               -0.0077774
 5	41               0.0058112
 5	42               0.0069869
 5	43               -0.0068717
 5	44               -0.0115544
 5	45               0.00686421
 5	46               0.0161998
 5	47               -0.009432
 5	48               0.02105545
 5	49               0.00866881
 5	50               0.0170584
 5	51               0.01658024
 5	52               0.02052897
 5	53               -0.0102431
 5	54               0.01558603
 5	55               0.01086556
 5	56               0.01153823
 5	57               0.01518881
 5	58               0.02004731
 5	59               0.01107311
 5	60               0.01026376
 5	61               -0.0163459
 5	62               0.00490451

 6	1                0.02026545
 6	2                0.02412925
 6	3                0.02670218
 6	4                0.00685114
 6	5                0.00436018
 6	6                -0.0003288
 6	7                0.01644953
 6	8                0.01831952
 6	9                0.01716356
 6	10               -0.0061246
 6	11               0.01024964
 6	12               0.02626665
 6	13               0.00958273
 6	14               -0.001622
 6	15               0.0159456
 6	16               0.00527126
 6	17               -0.0166735
 6	18               -0.025704
 6	19               0.00830207
 6	20               -0.1286899
 6	21               0.06852863
 6	22               -0.0098919
 6	23               -0.0326849
 6	24               0.01682627
 6	25               -0.0275797
 6	26               -0.0260791
 6	27               0.08026138
 6	28               0.04569663
 6	29               0.06344316
 6	30               0.02979956
 6	31               0.04064994
 6	32               0.01009655
 6	33               0.01584007
 6	34               -0.0668351
 6	35               0.0445981
 6	36               0.00965304
 6	37               -0.0387893
 6	38               0.04251449
 6	39               0.00283502
 6	40               -0.0290312
 6	41               -0.0475923
 6	42               -0.0070546
 6	43               -0.0179988
 6	44               0.01344507
 6	45               -0.0137426
 6	46               0.00554952
 6	47               -0.0219556
 6	48               0.00705348
 6	49               -0.0832572
 6	50               -0.0902205
 6	51               0.04980283
 6	52               0.07888147
 6	53               -0.0188265
 6	54               0.05618347
 6	55               0.06146955
 6	56               -0.0185803
 6	57               0.01385571
 6	58               0.04288407
 6	59               0.0279033
 6	60               0.07149137
 6	61               0.00892353
 6	62               -0.0082346

 7	1                0.02575342
 7	2                0.04711538
 7	3                0.04213856
 7	4                0.00156648
 7	5                0.04701857
 7	6                -0.0128839
 7	7                0.02269933
 7	8                0.00268196
 7	9                0.02979155
 7	10               -0.0151365
 7	11               0.00081848
 7	12               0.06069968
 7	13               -0.0102801
 7	14               -0.0141954
 7	15               -0.0088682
 7	16               0.02879164
 7	17               -0.0216998
 7	18               -0.0183082
 7	19               -0.0087868
 7	20               0.04911805
 7	21               0.06639076
 7	22               0.03177555
 7	23               0.02006112
 7	24               0.00975647
 7	25               0.10423007
 7	26               -0.010197
 7	27               0.01517472
 7	28               0.040661
 7	29               0.09204718
 7	30               0.075359
 7	31               -0.0047691
 7	32               -0.0071033
 7	33               0.02237111
 7	34               0.01449517
 7	35               -0.0150544
 7	36               -0.0181191
 7	37               0.01805729
 7	38               -0.0015568
 7	39               0.0053461
 7	40               -0.0277516
 7	41               0.00586828
 7	42               -0.0188615
 7	43               -0.0192241
 7	44               0.009359
 7	45               -0.0105551
 7	46               0.02764189
 7	47               -0.0143381
 7	48               -0.0082625
 7	49               0.00481108
 7	50               0.08875394
 7	51               0.05749222
 7	52               0.05203367
 7	53               -0.0166313
 7	54               -0.0419138
 7	55               -0.0565902
 7	56               -0.0079726
 7	57               -0.0460882
 7	58               0.04327144
 7	59               -0.0362028
 7	60               -0.0009689
 7	61               -0.0056484
 7	62               0.00556576

 8	1                0.01944241
 8	2                -0.0001799
 8	3                0.01340651
 8	4                -0.0015981
 8	5                0.0084482
 8	6                -0.0003527
 8	7                0.01270289
 8	8                0.00749129
 8	9                0.00717621
 8	10               0.00429221
 8	11               0.01931789
 8	12               0.0208805
 8	13               0.0122392
 8	14               -0.0060861
 8	15               0.01232854
 8	16               0.00701669
 8	17               0.00448502
 8	18               0.00039866
 8	19               0.01235355
 8	20               0.0371595
 8	21               0.0224685
 8	22               0.00853749
 8	23               0.02164152
 8	24               0.01433821
 8	25               0.03395369
 8	26               0.0005496
 8	27               0.00205987
 8	28               0.00356311
 8	29               0.02239519
 8	30               0.02758114
 8	31               0.04185351
 8	32               0.02545069
 8	33               0.0194659
 8	34               -0.014977
 8	35               0.00411921
 8	36               -0.0118846
 8	37               -0.0260699
 8	38               -0.0097793
 8	39               -0.0127247
 8	40               -0.0138505
 8	41               0.00429157
 8	42               0.01786986
 8	43               -0.0171108
 8	44               -0.0081542
 8	45               0.00593762
 8	46               0.01381592
 8	47               -0.0106845
 8	48               0.01985384
 8	49               0.01020926
 8	50               0.01952169
 8	51               0.02056397
 8	52               0.02473456
 8	53               -0.0103614
 8	54               0.01671624
 8	55               0.01351589
 8	56               0.00889043
 8	57               0.01487755
 8	58               0.02683807
 8	59               0.01081704
 8	60               0.01298278
 8	61               -0.022308
 8	62               0.00526547

 9	1                0.03257355
 9	2                0.11882583
 9	3                0.0200098
 9	4                0.00994581
 9	5                0.04788101
 9	6                -0.023203
 9	7                0.02328976
 9	8                -0.0285306
 9	9                0.01515152
 9	10               -0.0187389
 9	11               -0.0351782
 9	12               0.04382249
 9	13               0.01976048
 9	14               0.0000652
 9	15               0.00978601
 9	16               -0.0084636
 9	17               -0.0374014
 9	18               -0.0066337
 9	19               -0.0414991
 9	20               0.02509598
 9	21               0.06727235
 9	22               0.03385535
 9	23               0.0318039
 9	24               0.01803119
 9	25               0.04092867
 9	26               -0.0186249
 9	27               -0.0076148
 9	28               -0.0016527
 9	29               0.09317725
 9	30               0.04970254
 9	31               -0.0021639
 9	32               -0.0077451
 9	33               0.03382422
 9	34               -0.0108723
 9	35               -0.0003053
 9	36               0.00463222
 9	37               -0.0396736
 9	38               -0.0400464
 9	39               -0.016379
 9	40               -0.0098904
 9	41               -0.0321688
 9	42               0.01481136
 9	43               -0.005114
 9	44               -0.0292249
 9	45               -0.0286768
 9	46               0.03834375
 9	47               -0.0092614
 9	48               -0.0008335
 9	49               -0.014421
 9	50               -0.0623375
 9	51               0.02637348
 9	52               0.05629201
 9	53               -0.0117171
 9	54               -0.0052961
 9	55               0.07478219
 9	56               -0.0229678
 9	57               0.00530076
 9	58               0.03977533
 9	59               0.00440966
 9	60               0.04653715
 9	61               -0.0302045
 9	62               -0.0035146

 10	1               0.02936247
 10	2               0.02728753
 10	3               0.01895524
 10	4               0.02426429
 10	5               -0.0079572
 10	6               -0.0007959
 10	7               0.03278387
 10	8               -0.0042126
 10	9               0.01608771
 10	10              -0.0134287
 10	11              0.01224441
 10	12              0.0277158
 10	13              0.01154154
 10	14              -0.0000565
 10	15              0.01739818
 10	16              0.01421354
 10	17              -0.0241966
 10	18              -0.0285554
 10	19              -0.0282975
 10	20              -0.083264
 10	21              0.03474878
 10	22              -0.0091473
 10	23              0.02921277
 10	24              0.03329852
 10	25              0.00214044
 10	26              0.02699496
 10	27              -0.021606
 10	28              -0.0312352
 10	29              0.07112818
 10	30              -0.0417093
 10	31              0.09619381
 10	32              0.00996696
 10	33              0.04349692
 10	34              -0.0438425
 10	35              0.00419287
 10	36              0.02622986
 10	37              -0.0362526
 10	38              -0.003085
 10	39              -0.0045062
 10	40              -0.0205606
 10	41              -0.0288991
 10	42              0.02540138
 10	43              -0.0243807
 10	44              0.0041841
 10	45              0.00393836
 10	46              0.01091591
 10	47              -0.0323941
 10	48              -0.0103458
 10	49              0.00099841
 10	50              -0.0562074
 10	51              0.0586224
 10	52              0.03905103
 10	53              -0.0012433
 10	54              0.04589181
 10	55              0.02250717
 10	56              -0.0007407
 10	57              0.0114906
 10	58              0.0482672
 10	59              0.02911506
 10	60              0.02470034
 10	61              0.00525668
 10	62              0.00579451

 11	1               0.0142632
 11	2               0.02913527
 11	3               0.00045297
 11	4               -0.0110172
 11	5               0.00610407
 11	6               0.02745336
 11	7               0.01660762
 11	8               0.01974878
 11	9               0.0011392
 11	10              -0.0152905
 11	11              0.00137224
 11	12              0.04046159
 11	13              0.01122972
 11	14              -0.0300932
 11	15              0.07110043
 11	16              0.02401848
 11	17              -0.0161092
 11	18              -0.0216779
 11	19              -0.0265765
 11	20              -0.0605873
 11	21              0.00856515
 11	22              -0.0087101
 11	23              0.03675771
 11	24              -0.0057913
 11	25              0.00028415
 11	26              0.04552234
 11	27              0.0116832
 11	28              -0.002417
 11	29              0.06218872
 11	30              0.0644405
 11	31              0.01547711
 11	32              -0.0056861
 11	33              0.03572692
 11	34              0.01895492
 11	35              0.02731691
 11	36              0.00391517
 11	37              -0.0623984
 11	38              -0.0530907
 11	39              0.00024404
 11	40              -0.0496492
 11	41              -0.0034015
 11	42              0.00772798
 11	43              0.00134202
 11	44              -0.0003191
 11	45              0.01589632
 11	46              0.02193175
 11	47              -0.0211536
 11	48              0.00986305
 11	49              -0.0356454
 11	50              -0.0262546
 11	51              0.01305068
 11	52              0.04276746
 11	53              -0.04001
 11	54              0.02436634
 11	55              0.04495887
 11	56              -0.0062248
 11	57              0.00411447
 11	58              0.02287322
 11	59              0.0187145
 11	60              0.01414485
 11	61              -0.0208345
 11	62              -0.0014776

 12	1               0.04961332
 12	2               0.10977209
 12	3               0.04399932
 12	4               -0.0011856
 12	5               0.04759078
 12	6               -0.0030388
 12	7               0.02769167
 12	8               -0.0027146
 12	9               0.02207884
 12	10              -0.0142039
 12	11              -0.0637882
 12	12              0.01581788
 12	13              0.0276185
 12	14              0.03916249
 12	15              0.01596138
 12	16              -0.006546
 12	17              -0.0384127
 12	18              0.00045683
 12	19              -0.121106
 12	20              0.01876118
 12	21              0.06550317
 12	22              0.01441183
 12	23              0.04188729
 12	24              0.00322029
 12	25              0.08396028
 12	26              0.00564501
 12	27              0.00358885
 12	28              -0.041766
 12	29              0.07382422
 12	30              0.10782392
 12	31              -0.0317326
 12	32              -0.055244
 12	33              0.08599692
 12	34              -0.0217804
 12	35              0.03927492
 12	36              0.05519274
 12	37              -0.0400785
 12	38              -0.0666771
 12	39              -0.005139
 12	40              0.0202388
 12	41              -0.0702606
 12	42              0.02115788
 12	43              0.01612974
 12	44              -0.0542889
 12	45              -0.0285207
 12	46              0.08278316
 12	47              0.01565405
 12	48              -0.0458125
 12	49              -0.0263263
 12	50              -0.0636084
 12	51              0.02148485
 12	52              0.05500192
 12	53              -0.0387375
 12	54              0.03604668
 12	55              0.1128135
 12	56              -0.0066382
 12	57              -0.0038363
 12	58              0.03565365
 12	59              -0.0019992
 12	60              0.05372596
 12	61              -0.0050188
 12	62              0.02036761
;
param R:=
 1                  0.02750755
 2                  0.02579171
 3                  0.02196053
 4                  0.00373715
 5                  0.02916537
 6                  0.00241182
 7                  -0.0069172
 8                  0.00090854
 9                  0.01089259
 10                 -0.0062855
 11                 -0.0153614
 12                 -0.0100948
 13                 0.04171817
 14                 0.00978938
 15                 0.00235018
 16                 -0.0058616
 17                 -0.007665
 18                 -0.0178253
 19                 -0.015124
 20                 0.01719902
 21                 -0.0147946
 22                 0.0447441
 23                 -0.0052801
 24                 0.02713064
 25                 0.01780075
 26                 0.02849083
 27                 -0.0093252
 28                 0.01245847
 29                 0.01914137
 30                 0.04695466
 31                 0.02870323
 32                 -0.0079721
 33                 0.030889
 34                 0.01900122
 35                 -0.0016734
 36                 0.0316092
 37                 -0.0164809
 38                 -0.0457871
 39                 -0.0165718
 40                 -0.0316901
 41                 -0.0454545
 42                 -0.0231292
 43                 0.00612813
 44                 -0.0213178
 45                 0.01471004
 46                 0.00696961
 47                 -0.0060908
 48                 -0.0142061
 49                 0.01215032
 50                 -0.03378
 51                 0.02455938
 52                 0.03722504
 53                 0.00435019
 54                 0.01082837
 55                 0.01660418
 56                 0.03082192
 57                 -0.0168668
 58                 0.01481674
 59                 0.01997951
 60                 0.01883476
 61                 0.0059157
 62                 -0.012987
;


display f;
display s;
