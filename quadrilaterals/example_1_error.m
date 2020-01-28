clc
clear all
%%
addpath map
%%
for k=1:7
n    =  2^(k+6);
%%
verc1 =  exp(i*pi.*[-1 ; -0.5 ; -0.0 ; 0.5]);
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
%             0
%    4.4409e-16
%    4.4409e-16
%    4.4409e-16
%             0
%    4.4409e-16
%    2.6645e-15   %    