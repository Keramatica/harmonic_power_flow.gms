
           set i index for bus of DN /1*31/  ;
         Alias(i,j) ;
         set  k index for harmonics/1*11/
sets
         slack(i) index for couped bus -upstream /1/
        nl index for nonlinear load  /sp1,sp2,sp2-prim,sp3 ,pwm-asd1 ,pwm-asd2,vfd /
*h index for harmonic orders/1/
h index for harmonic orders/1,5,7,11,13,17,19,23,25,29,31/
          LLoad(i)/2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31/

nl_bus(i,nl)   nonlinear load and corresponding bus /12.sp1,8.sp2,30.sp2-prim ,21.sp3,8.pwm-asd1,6.pwm-asd2,25.vfd/

line(i,j)  Dist_line/1.2,2.3,2.29,3.4,4.23,4.5,5.6,6.7,7.22,7.8,7.19,8.9,9.16,9.10,16.17,10.11,11.12,12.13,13.14,14.15,17.18,23.24,24.25,25.26,26.27,27.28
                             ,29.30,30.31,19.20,20.21/
         s index for season of year /B-P,T,Z/
         ti index for time of day /1*24/
r         /1-3,1-4,2-3,2-4/
        ;



parameters


pg(i) generation of active power from power flow pu /1 0,2 0,3 0,4 0,5 0,6 0,7 0,8 0,9 0,10 0,11 0,12 0,13 0,14 0,15 0,16 0,17 0,18 0,19 0,20 0,21 0,22 0,23 0,24 0,
                                                 25 0,26 0,27 0,28 0,29 0,30 0,31 0/

qg(i) generation of reactive power from power flow pu /1 0,2 0.015,3 0,4 0,5 0,6 0,7 0,8 0,9 0,10 0,11 0,12 0,13 0,14 0.006,15 0,16 0.006,17 0,18 0,19 0,20 0.003,
                                                       21 0,22 0,23 0,24 0.009,25 0,26 0.009,27 0,28 0,29 0,30 0,31 0/

pdo(i) active power for nomrmal load pu /1 0,2 0.00522,3 0,4 0,5 0.00936,6 0,7 0,8 0,9 0,10 0.00189,11 0,12 0.00336,13 0.00657,14 0.00783,15 0.00729,16 0.00477,
                                      17 0.00549,18 0.00477,19 0.00432,20 0.00672,21 0.00495,22 0.00207,23 0.00522,24 0.01917,25 0,26 0.01116,27 0.00549,28 0.00792
                                      ,29 0.00882,30 0,31 0.00884/

qdo(i) active power for nomrmal load pu /1 0,2 0.00174,3 0,4 0,5 0.00312,6 0,7 0,8 0,9 0,10 0.00063,11 0,12 0.00112,13 0.00219
                                       ,14 0.00261,15 0.0143,16 0.00159,17 0.00183
                                      ,18 0.00159,19 0.00144,20 0.00224,21 0.00165,22 0.00069,23 0.00174,24 0.00639,25 0,26 0.00372,27 0.00183,28 0.00264,29 0.00294
                                      ,30 0,31 0.00294/

pnl(nl) active power for nomrmal load   /sp1 0.00447,sp2 0.00536,sp2-prim 0.00527,sp3 0.00315,pwm-asd1 0.00247,pwm-asd2 0.00575,vfd 0.00454/
qnl(nl) active power for nomrmal load /sp1 0.00276,sp2 0.00331,sp2-prim 0.00242,sp3 0.00156,pwm-asd1 0.00158,pwm-asd2 0.00326,vfd 0.00229/


cp  cost of active power duringg 24 hours $.pu(mva)  /125/
cq  cost of active power duringg 24 hours $.pu(mva)  /18.75/
D(r) /1-3 2,1-4 2,2-3 2,2-4 1/

         scalar THDmax /0.05/
         scalar IHDmax /0.03/
         SCALAR ILMAX/1.05/
         scalar Sbase MVA /100/
         scalar vbase KV/23/

         scalar vrmsmin lowerest voltage /0.95/
         scalar vrmsmax   highest volrage /1.05/
parameters
ratio
x_h
bb_h
b_h
g_h
y_h;
Table GenD(i,*) 'generating units characteristics'
        Pg      Qg      Pmax    Pmin    Qmax      Qmin
1       0        0      1       0       1         -1;
                                                                                                                                                                                                                                         ;
table chr(nl,k) harmonic current factor
               1       2        3       4        5       6        7       8       9       10      11

sp1            1      0.2      0.143   0.091    0.077   0.059    0.053   0.043   0.04    0.034   0.032
sp2            1      0.19     0.13    0.072    0.056   0.033    0.024   0.012   0.008   0.002    0.002
sp2-prim       1      0.19     0.13    0.072    0.056   0.033    0.024   0.012   0.008   0.002    0.002
sp3            1      0.42     0.143   0.079    0.032   0.037    0.023   0.023   0.014     0       0
pwm-asd1       1      0.02     0.012   0.055    0.037   0.002      0     0.002   0.004     0       0

pwm-asd2       1     -0.58     0.27    0.217   -0.31    0.14    -0.087  -0.013  -0.003     0       0
vfd            1     -0.084   -0.019  -0.042   -0.041  -0.00125 -0.0004  0.0025  0.0019   0.004  0.005
;

table chim(nl,k) harmonic current factor

               1       2        3       4        5       6       7       8       9       10      11

sp1            0       0        0       0        0       0       0       0       0       0       0
sp2            0       0        0       0        0       0       0       0       0       0       0
sp2-prim       0       0        0       0        0       0       0       0       0       0       0
sp3            0       0        0       0        0       0       0       0       0       0       0
pwm-asd1       0       0        0       0        0       0       0       0       0       0       0

pwm-asd2       0      -0.58     0.72   -0.4     0.27     0.02   -0.04   -0.005   0.024   0       0
vfd            0       0.21     0.057  -0.017  -0.14    -0.17   -0.13   -0.007  -0.005  -0.0016  0.0065
;


Table   bbranch(i,j,*)  not in pu so invide zbase

                 r            x            b       rateA    rateB   rateC     tap      an        st        min         max


1.2            0.002116      0.036501      0        0        0        0        0        0        1        -360        360
2.3            0.2788        0.0148        0        0        0        0        0        0        1        -360        360
2.29           0.2788        0.0148        0        0        0        0        0        0        1        -360        360
3.4            0.4438        0.4391        0        0        0        0        0        0        1        -360        360
4.23           0.4438        0.4391        0        0        0        0        0        0        1        -360        360
4.5            0.8639        0.7512        0        0        0        0        0        0        1        -360        360
5.6            0.8639        0.7512        0        0        0        0        0        0        1        -360        360
6.7            1.3738        0.7739        0        0        0        0        0        0        1        -360        360
7.22           0.8639        0.7512        0        0        0        0        0        0        1        -360        360
7.8            1.3738        0.7739        0        0        0        0        0        0        1        -360        360
7.19           0.8639        0.7512        0        0        0        0        0        0        1        -360        360
8.9            1.3738        0.7739        0        0        0        0        0        0        1        -360        360
9.16           0.8639        0.7512        0        0        0        0        0        0        1        -360        360
9.10           1.3738        0.7739        0        0        0        0        0        0        1        -360        360
16.17          1.3738        0.7739        0        0        0        0        0        0        1        -360        360
10.11          1.3738        0.7739        0        0        0        0        0        0        1        -360        360
11.12          1.3738        0.7739        0        0        0        0        0        0        1        -360        360
12.13          1.3738        0.7739        0        0        0        0        0        0        1        -360        360
13.14          1.3738        0.7739        0        0        0        0        0        0        1        -360        360
14.15          1.3738        0.7739        0        0        0        0        0        0        1        -360        360
17.18          1.3738        0.7739        0        0        0        0        0        0        1        -360        360
23.24          0.4438        0.4391        0        0        0        0        0        0        1        -360        360
24.25          0.8639        0.7512        0        0        0        0        0        0        1        -360        360
25.26          0.8639        0.7512        0        0        0        0        0        0        1        -360        360
26.27          0.8639        0.7512        0        0        0        0        0        0        1        -360        360
27.28          1.3728        0.7739        0        0        0        0        0        0        1        -360        360
29.30          0.2788        0.0148        0        0        0        0        0        0        1        -360        360
30.31          1.3738        0.7739        0        0        0        0        0        0        1        -360        360
19.20          0.8639        0.7512        0        0        0        0        0        0        1        -360        360
20.21          1.3738        0.7739        0        0        0        0        0        0        1        -360        360;

table co_p(s,ti) coeffiecent for active power
       1       2       3       4       5       6       7       8       9       10      11      12      13      14     15       16      17      18        19      20      21      22      23      24
B-P    0.45    0.45    0.45    0.45    0.45    0.45    0.45    0.55    0.55    0.55    0.55    0.6     0.6     0.6    0.6      0.6     0.6     0.6      0.6     0.6     0.6     0.6     0.6     0.6
T      0.6     0.6     0.6     0.6     0.6     0.6     0.6     0.8     0.8     0.8     0.8     0.8     1       1       1        1       1      0.9      0.9     0.9     0.9     0.8     0.8     0.8
Z      0.7     0.7    0.7      0.7     0.7     0.7     0.7     0.82    0.82    0.82    0.82    0.82    0.73    0.73   0.73     0.7     0.73    0.73     0.73    0.8     0.8     0.75    0.75    0.75
;

table co_price(s,ti) coeffiecent for price of electricity
       1       2       3       4       5       6       7       8       9        10      11      12      13      14      15      16      17      18       19      20      21      22      23      24
B-P    40      40      40      40      40      60      60      60      60       60      50      50      50      50      50      40      40      40       40      40      30      30      30      30
T      60      60      60      60      60      90      90      90      90       90      120     120     120     120     120     80      80      80       80      80      70      70      70      70
Z      20      20      20      20      20      30      30      30      30       30      20      20      20      20      20      10      10      10       10      10      12      12      12      12
  ;
parameter branch;
branch(i,j,'r')=bbranch(i,j,'r')/5.3;
branch(i,j,'x')=bbranch(i,j,'x')/5.3;
branch(i,j,'b')=bbranch(i,j,'b');
branch(i,j,'rateA')=bbranch(i,j,'rateA');
branch(i,j,'rateB')=bbranch(i,j,'rateB');
branch(i,j,'rateC')=bbranch(i,j,'rateC');
branch(i,j,'tap')=bbranch(i,j,'tap');
branch(i,j,'an')=bbranch(i,j,'an');
branch(i,j,'st')=bbranch(i,j,'st');
branch(i,j,'min')=bbranch(i,j,'min');
branch(i,j,'max')=bbranch(i,j,'max');

parameter
co_tr(ti)/1 0.01,2 0.01,3 0.01,4 0.01,5 0.01,6 0.06,7 0.06,8 0.06,9 0.06,10 0.06,11 0.07,12 0.07,13 0.07,14 0.07,15 0.07,16 0.09,17 0.09,18 0.09,19 0.03,20 0.03,21 0.03,22 0.03,23 0.03,24 0.03/  ;


parameters cp_,cq_,pg_,qg_,pdo_,qdo_,pnl_,qnl_,Tr_,d_,dd;
dd(r)=round(0.13*d(r));
loop((ti),
*Tr_(z,r,ti)=Tr(r,z);
D_(r,ti)=ceil(dd(r)*co_tr(ti));
);

loop((s,ti),
cp_(s,ti)=co_price(s,ti);
cq_(s,ti)=co_price(s,ti)*0.15;
);
loop((i,s,ti),
pg_(i,s,ti)=co_p(s,ti)*pg(i);
qg_(i,s,ti)=co_p(s,ti)*qg(i);
pdo_(i,s,ti)=co_p(s,ti)*pdo(i);
qdo_(i,s,ti)=co_p(s,ti)*qdo(i);
);
loop((nl,s,ti),
pnl_(nl,s,ti)=co_p(s,ti)*pnl(nl);
qnl_(nl,s,ti)=co_p(s,ti)*qnl(nl);

);
parameters cp__,cq__,pg__,qg__,pdo__,qdo__,pnl__,qnl__;
loop(ti,
cp__(ti)=cp_('B-P',ti);
cq__(ti)=cq_('B-P',ti);
pg__(i,ti)=pg_(i,'B-P',ti);
qg__(i,ti)=qg_(i,'B-P',ti);
pdo__(i,ti)=pdo_(i,'B-P',ti);
qdo__(i,ti)=qdo_(i,'B-P',ti);
pnl__(nl,ti)=pnl_(nl,'B-P',ti);
qnl__(nl,ti)=qnl_(nl,'B-P',ti);
);

parameter ha(k)/1  1,2  5,3   7,4 11,5 13,6 17,7 19,8 23,9 25,10 29,11 31/;
*parameter ha(k)/1  1/;
loop(k,
x_h(k,i,j)=ha(k)*branch(i,j,'x');
bb_h(k,i,j)=ha(k)*branch(i,j,'b');
)
variables
F
positive variables ast,bst,zst,f1,f2,gama ;
positive variable fr
positive variable landa
binary variable x
integer variable y
variables
*landa
istr
istim
inlrl
inliml
ir
iim
inlr
inlim
ilr
ilim
ilmg
ilrms
pst
qst
sst
*pd(i)
*qd(i)
p
q
*THDv
vr
vim
istmg
istrms
vmg
vrms
Pgg
qgg
v
theta;
equations
         obj_fun
         co1
         co2
         co3
         co4
         co5
         co6
         co7
         co8
         co9
         co10
         co11
         co12
         co13
        co14
*        co15
*         co16
         co17
         co18
         co19
         co20

       co21

         ;

     Parameter c_instal,c_operation,c_travel,c_p,c_q,ploss_t,snl,thdv;

 snl(nl )=sqrt(sqr(pnl(nl ))+sqr(qnl(nl ))) ;

****************************************G+BJ**********************************************
b_h(k,i,j)$line(i,j) = -x_h(k,i,j)/(sqr(branch(i,j,'r'))+sqr(x_h(k,i,j)));
g_h(k,i,j)$line(i,j) = branch(i,j,'r')/(sqr(branch(i,j,'r'))+sqr(x_h(k,i,j)));
ratio(line)=1;
************************************Ybus-Formulation***************************************************

y_h(k,i,j,'real')$(not sameas(i,j))=sum(Line(i,j)$branch(i,j,'st'), -1/ratio(i,j) * (g_h(k,i,j)*cos(branch(i,j,'an')) - b_h(k,i,j)*sin(branch(i,j,'an'))))
+ sum(Line(j,i)$branch(j,i,'st'), -1/ratio(j,i)* (g_h(k,j,i)*cos(-branch(j,i,'an')) - b_h(k,j,i)*sin(-branch(j,i,'an'))));


y_h(k,i,j,'imag')$(not sameas(i,j))=sum(Line(i,j)$branch(i,j,'st'), -1/ratio(i,j) * (b_h(k,i,j)*cos(branch(i,j,'an')) + g_h(k,i,j)*sin(branch(i,j,'an'))))
+ sum(Line(j,i)$branch(j,i,'st'), -1/ratio(j,i)* (b_h(k,j,i)*cos(-branch(j,i,'an')) + g_h(k,j,i)*sin(-branch(j,i,'an'))));


y_h(k,i,i,'real')= sum(j$branch(i,j,'st'), g_h(k,i,j)/sqr(ratio(i,j))) + sum(j$branch(j,i,'st'), g_h(k,j,i));



y_h(k,i,i,'imag')= sum(j$branch(i,j,'st'), 1/sqr(ratio(i,j)) * (b_h(k,i,j)+bb_h(k,i,j)/2)) + sum(j$branch(j,i,'st'),(b_h(k,j,i)+bb_h(k,j,i)/2));

***************************************objective_function***********************************************
obj_fun   ..F=e=0;
**************************************************************************************

co1(k,i,ti)                   ..ir(k,i,ti)=e=sum(j,y_h(k,i,j,'real')*vr(k,j,ti)-y_h(k,i,j,'imag')*vim(k,j,ti));
co2(k,i,ti)                   ..iim(k,i,ti)=e=sum(j,y_h(k,i,j,'real')*vim(k,j,ti)+y_h(k,i,j,'imag')*vr(k,j,ti));

co3(k,i,ti)$(ord(k)=1).. Pgg(k,i,ti)$slack(i)+pg__(i,ti)-(pdo__(i,ti)  +sum(nl$nl_bus(i,nl),pnl__(nl,ti)))=e= sum(j,(V(k,i,ti)*V(k,j,ti)*y_h(k,i,j,'real')*cos(theta(i,ti)-theta(j,ti))+V(k,i,ti)*V(k,j,ti)*y_h(k,i,j,'imag')*sin(theta(i,ti)-theta(j,ti))));
co4(k,i,ti)$(ord(k)=1).. Qgg(k,i,ti)$slack(i)+qg__(i,ti) -(qdo__(i,ti) +sum(nl$nl_bus(i,nl),qnl__(nl,ti)))=e= sum(j,(V(k,i,ti)*V(k,j,ti)*y_h(k,i,j,'real')*sin(theta(i,ti)-theta(j,ti))-V(k,i,ti)*V(k,j,ti)*y_h(k,i,j,'imag')*cos(theta(i,ti)-theta(j,ti))));

co5(k,i,ti)$(ord(k)=1)                    ..vr(k,i,ti)=e=v(k,i,ti)*cos(theta(i,ti));
co6(k,i,ti)$(ord(k)=1)                    ..vim(k,i,ti)=e=v(k,i,ti)*sin(theta(i,ti));

*co3 (i,ti)                        ..p(i,ti)=e=vr('1',i,ti)*ir('1',i,ti)+vim('1',i,ti)*iim('1',i,ti);
*co4(i,ti)                         ..q(i,ti)=e=-vr('1',i,ti)*iim('1',i,ti)+vim('1',i,ti)*ir('1',i,ti);
*co5(i,ti)$LLoad(i)                ..p(i,ti)=e=pg__(i,ti) -(pdo__(i,ti) +sum(nl$ nl_bus(i,nl),pnl__(nl,ti)));
*co6(i,ti)$LLoad(i)                ..q(i,ti)=e=qg__(i,ti) -(qdo__(i,ti) +sum(nl$ nl_bus(i,nl),qnl__(nl,ti)));

co7(k,i,ti)$(ord(k)<>1and LLoad(i))           ..ir(k,i,ti)=e=-inlr(k,i,ti);
co8(k,i,ti)$(ord(k)<>1and LLoad(i))           ..iim(k,i,ti)=e=-inlim(k,i,ti) ;

co9(i,nl,ti)$(nl_bus(i,nl))       ..pnl__(nl,ti)=e=inlrl(i,nl,ti)*vr('1',i,ti)+inliml(i,nl,ti)*vim('1',i,ti);
co10(i,nl,ti)$(nl_bus(i,nl))       ..qnl__(nl,ti)=e=inlrl(i,nl,ti)*vim('1',i,ti)-inliml(i,nl,ti)*vr('1',i,ti);
co11(k,i,ti)$(ord(k)<>1)           ..inlr(k,i,ti)=e=sum(nl,chr(nl,k)*inlrl(i,nl,ti)$nl_bus(i,nl)-(chim(nl,k)*inliml(i,nl,ti)$nl_bus(i,nl)));
co12(k,i,ti)$(ord(k)<>1)           ..inlim(k,i,ti)=e=sum(nl,chr(nl,k)*inliml(i,nl,ti)$nl_bus(i,nl)+(chim(nl,k)*inlrl(i,nl,ti)$nl_bus(i,nl)));
**********************************************security_constraints****************************************
co13(k,i,ti)                  ..(vmg(k,i,ti))=e=sqrt(sqr(vr(k,i,ti))+sqr(vim(k,i,ti))) ;
co14(i,ti)                    ..(vrms(i,ti))=e= sqrt(sum(k,sqr(vmg(k,i,ti))));
*co15(i,ti)                    ..THDv(i,ti)=e=(sqrt(sum(k$(ord(k)<> 1),sqr(vmg(k,i,ti)))))/(vmg('1',i,ti)+0.00001);
*co16(i,ti)                    ..THDv(i,ti)=l=THDmax ;
co17(k,i,ti)$(ord(k)<> 1)     ..(vmg(k,i,ti)$(ord(k)<> 1))/(vmg('1',i,ti)+0.0000000001) =l=0.04;
**************************************************************************************
co18(k,i,j,ti)$ line(i,j)   ..ilr(k,i,j,ti)=e=y_h(k,i,j,'real')*(Vr(k,i,ti)-Vr(k,j,ti))-y_h(k,i,j,'imag')*(Vim(k,i,ti)-Vim(k,j,ti));
co19(k,i,j,ti)$ line(i,j)   ..ilim(k,i,j,ti)=e=y_h(k,i,j,'real')*(Vim(k,i,ti)-Vim(k,j,ti))+y_h(k,i,j,'imag')*(Vr(k,i,ti)-Vr(k,j,ti));
co20(k,i,j,ti)$ line(i,j)   ..ilmg(k,i,j,ti)=e=sqrt(sqr(ilr(k,i,j,ti))+sqr(ilim(k,i,j,ti)));
co21(i,j,ti)$ line(i,j)     ..sqrt(sum(k,sqr(ilmg(k,i,j,ti))))=l=ilmax ;


vrms.lo(i,ti)=0.88;
vrms.up(i,ti)=1.05;

Pgg.lo(k,i,ti)$slack(i) = GenD(i,'Pmin');
Pgg.up(k,i,ti)$slack(i) = GenD(i,'Pmax');

Qgg.lo(k,i,ti)$(slack(i))= GenD(i,'Qmin');
Qgg.up(k,i,ti)$(slack(i)) = GenD(i,'Qmax');

V.lo('1',i,ti)=0.88;
V.up('1',i,ti)=1.05;

*Vmg.up(k,i,ti)$(ord(k)=1)=0.95;
*Vmg.up(k,i,ti)$(ord(k)<>1)=0.1;
Vmg.lo(k,i,ti)=0;
Vmg.lo(k,i,ti)$(ord(k)<>1)=0.001;

theta.lo(i,ti)=-pi/4;
theta.up(i,ti)=pi/4;

        model dntnrecent /all/;
*obj_fun,co1,co2,co3,co4,co5,co6,co7,co8,co9,co10,co11,co12,co13,co14,co18,co19,co20,co21/;

option NLP=conopt4;
*option optcr=0.1;
*option optca=0.1;
         option Reslim=1000000000;
           solve dntnrecent using  NLP minimizing F;


THDv(i,ti)=(sqrt(sum(k$(ord(k)<> 1),sqr(vmg.l(k,i,ti)))))/(vmg.l('1',i,ti));

ploss_t(ti)=sum((k,i,j)$line(i,j),branch(i,j,'r')*( sqr(ilr.l(k,i,j,ti))+sqr(ilim.l(k,i,j,ti ))));

display y_h,branch,pgg.l,qgg.l,v.l,vrms.l,snl,ilr.l,ilim.l,thdv,inlr.l,inlim.l,iim.l,ir.l;

  execute_unload "results_31mx_hpf_B-P.gdx" VRMS
    execute 'gdxxrw.exe results_31mx_hpf_B-P.gdx Var=VRMS rng=classic1!'
   execute_unload "results_31mx_hpf_B-P.gdx" Pgg
   execute 'gdxxrw.exe results_31mx_hpf_B-P.gdx Var=Pgg rng=classic2!'
   execute_unload "results_31mx_hpf_B-P.gdx" Qgg
   execute 'gdxxrw.exe results_31mx_hpf_B-P.gdx Var=Qgg rng=classic3!'
   execute_unload "results_31mx_hpf_B-P.gdx" THDv
   execute 'gdxxrw.exe results_31mx_hpf_B-P.gdx par=THDv rng=classic4!'
    execute_unload "results_31mx_hpf_B-P.gdx" ploss_t
   execute 'gdxxrw.exe results_31mx_hpf_B-P.gdx par=ploss_t rng=classic5!'




