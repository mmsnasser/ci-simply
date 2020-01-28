function   Map = cirmap3p(ver,w,n)
%
%
%
m              =  length(ver);
iprec          =  5;
gmresmaxit     =  100;
gmresrestart   =  [];
gmrestol       =  0.5e-14;
%
alpha = mean(ver);
% 
Map.alpha      =  alpha;
%
[zet,zetp]=polygonp(ver,n/4);
%
Map.zet    =  zet;
Map.zetp   =  zetp;
% 
t          =  (0:2*pi/n:2*pi-2*pi/n).';
A          =  zet-alpha;
Ap         =  zetp;
gam        = -log(abs(zet-alpha));
muh        = -imag(clog(zet-alpha));
[phi , h ] =  fbie(zet,zetp,A,gam,n,iprec,gmresrestart,gmrestol,gmresmaxit);
S          =  phi-muh;
Sp         =  derfft(S-t)+1;
etm        =  exp(i*S);
etmp       =  i.*Sp.*etm;
% 
for j=1:4
    z(j) =  etm((j-1)*n/4+1);
end
% 
p  = @(x)((w(3)-w(1))*(w(2)-w(3))*(z(2)-z(1))*(x-z(3)));
pp = @(x)((w(3)-w(1))*(w(2)-w(3))*(z(2)-z(1))*(x-x+1));
q  = @(x)((w(2)-w(1))*(z(2)-z(3))*(x-z(1)));
qp = @(x)((w(2)-w(1))*(z(2)-z(3))*(x-x+1));
r  = @(x)((w(2)-w(3))*(z(2)-z(1))*(x-z(3)));
rp = @(x)((w(2)-w(3))*(z(2)-z(1))*(x-x+1));
f  = @(x)(w(3)+p(x)./(q(x)-r(x)));
fp = @(x)((pp(x).*(q(x)-r(x))-p(x).*(qp(x)-rp(x)))./((q(x)-r(x)).^2));
%
et   =  f(etm);
etp  =  fp(etm).*etmp;
% 
Map.et      =  et;
Map.etp     =  etp;
%
%
end  