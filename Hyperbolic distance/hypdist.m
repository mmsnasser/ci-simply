function dis = hypdist (et,etp,n,alpha,zo,z)
% This function computes the hyperbolic distance dis between a point zo
% and a row vector of points z, in a simply connected domain G where:
% et, etp:  the parametrization of the boundary of G and its derivative 
% n: the number of discretization points
% alpha: a given point in G 
A      = et-alpha;
gam    =-log(abs(et-alpha));
[mun,h]= fbie(et,etp,A,gam,n,5,[],1e-14,200);
fet    =(gam+h+i*mun)./A;
c      = exp(-mean(h(1:n)));
Phi    = c.*(et-alpha).*exp(gam+h+i.*mun);
Phio   = fcau(et,etp,Phi,zo);
Phiz   = fcau(et,etp,Phi,z);
dis    = 2*asinh(abs(Phiz-Phio)./sqrt((1-abs(Phiz).^2).*(1-abs(Phio).^2)));
end