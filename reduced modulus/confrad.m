function [cr,m] = confrad (et,etp,n,alpha,type)
% This function computes the conformal radius cr=R(G,a) and the reduced
% modulus m=m(G,a) for a given simply connected domain G with respect to
% the point a=alpha for bounded G and a=inf for unbounded G where:
% et, etp:  the parametrization of the boundary of G and its derivative 
% n: the number of discretization points
% alpha: a given point in G for bounded G and alpha=beta (beta is an 
% auxiliary point in the exterior of G for unbounded G)
% type='b' for bounded G and type='u' for unbounded G
if type=='b' A = et-alpha; elseif type=='u' A = ones(size(et)); end
gam   = -log(abs(et-alpha));
[~,h] =  fbie(et,etp,A,gam,n,5,[],1e-14,200);
cr    =  exp(mean(h));
if type=='b' m = mean(h)/(2*pi); elseif type=='u' m = -mean(h)/(2*pi); end
end