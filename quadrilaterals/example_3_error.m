clc
clear all
%%
addpath map
%%
for k=1:7
n    =  2^(k+6);
%%
verc1 =  exp(i*pi.*[-0.5005 ; -0.4995 ;  0.4995 ; 0.5005]);
f1    =  quadmap(verc1,n,100,0.5e-13);
r1    =  f1.r;
%%
verc2 =  [verc1(2);verc1(3);verc1(4);verc1(1)];
f2    =  quadmap(verc2,n,100,0.5e-13);
r2    =  f2.r;
%%
error(k,1) = abs(r1*r2-1)
end
%%
% error =
%    7.2797e-13
%    4.5008e-13
%    5.7176e-13
%    3.5927e-13
%    2.9532e-13
%     6.346e-13
%    9.5213e-13
   %    