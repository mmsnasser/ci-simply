clc
clear all
%%
addpath map
%%
for k=1:7
n    =  2^(k+6);
%%
verc1 =  exp(i*pi.*[-0.5 ; -0.25 ;  0.25 ; 0.5]);
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
%    2.9976e-15
%    2.8866e-15
%    2.2204e-15
%    3.6637e-15
%    3.9968e-15
%    3.4417e-15
%    3.1086e-15
%    