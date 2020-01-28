clc
clear all
%%
addpath fmm bie
%%
alpha   =  0;
rho     =  5;
ver     = [ rho+0.5i; -rho+0.5i; -rho-0.5i; rho-0.5i];
for k=1:length(ver)-1
    L{k}=[ver(k);ver(k+1)];
end
L{length(ver)}=[ver(length(ver));ver(1)];
%%
ns =  2^13; 
n  = length(ver)*ns; 
[et,etp]=polygonp(ver,ns);
% 
Uzv=hm(ver,L{4},alpha,0,ns)
p_exact = 3.8375879792512261034e-7
abs_error = abs(Uzv-p_exact)
%%
% p = poisson([0,0],[10,1],0,[1,1,0,0],'Cholesky',1/128)
%%