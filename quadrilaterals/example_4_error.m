clc
clear all
%%
addpath map
%%
for k=1:7
n    =  2^(k+6);
%%
verc1 =  exp(i*pi.*[-1 ; -0.0001 ;  0 ; 0.5]);
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
%    1.9984e-15
%    1.4322e-14
%    2.6201e-14
%    2.4425e-15
%    1.5543e-14
%     4.019e-14
%    4.6185e-14
   %    