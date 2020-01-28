function   Uz=hm(ver,L,alpha,z,ns)
% Compute the harmonic measure w(z,L) of a side L with respect to the 
% polygon domain G with the vertices ver
% 
% Input:
% ver=[z1,z2,...,zm] (the vertices of the polygon)
% L=[z_k,z_{k+1}] (a side of the polygon)
% alpha (a given point in the domain G)
% z (a vector of points z in G)
% ns (the number of graded points on each side of the polygon)
% 
% Output:
% Uz (the values of the harmonic measure w(z,L) at the points z).
% 
% compute the the parametrization of the polygon
[et,etp]=polygonp(ver,ns); 
%
% Compute the values of the mapping function \Phi(z)
A     =  et-alpha;  
gam   = -log(abs(et-alpha));
[mu,h]=  fbie(et,etp,A,gam,length(ver)*ns,5,[],0.5e-14,100);
fet   = (gam+h+i*mu)./A;   c = exp(-mean(h)); 
f_z   =  fcau(et,etp,fet,z(:).');
Phi_z = c.*(z-alpha).*exp((z-alpha).*f_z); 
%
% Compute the arc \hat L
zet   = c.*(et-alpha).*exp((et-alpha).*fet);
for k=1:length(ver), iver(L(1)==ver(k)) = k; end
ver1 = et((iver-1)*ns+1); cver1 = zet((iver-1)*ns+1);
if iver==length(ver) ver3 = et(1); else ver3 = et(iver*ns+1); end
if iver==length(ver) cver3 = zet(1); else cver3 = zet(iver*ns+1); end
ang1 = angle(cver1); ang3 = angle(cver3); ang3(ang3<ang1)=ang3+2*pi;
ang2 = (ang1+ang3)/2; cver2 = exp(i*ang2); hL = [cver1;cver2;cver3];
% 
% Compute the values of the Mobius transform \Psi(\Phi(z))
Psi = @(z,v)(((z-v(1)).*(v(2)-v(3))-i*(z-v(3)).*(v(2)-v(1)))./...
             ((z-v(3)).*(v(2)-v(1))-i*(z-v(1)).*(v(2)-v(3))));
Psi_Phi_z = Psi(Phi_z,hL); 
% 
% compute Uz=w(z,L)
H = @(z)((1/pi)*imag(log((i-z)./(1-i.*z))));
Uz = H(Psi_Phi_z);
end