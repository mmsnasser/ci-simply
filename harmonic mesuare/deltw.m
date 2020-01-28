function [s , sp , spp] = deltw (t , pj , p)
% To calculate the values of the function s=delta_j(t), its first
% derivative sp=delta'_j(t) and its second derivative spp=delta''_j(t), 
% where 0<=t<=2pi, pj is the number of corners and p is the grading  
% parameter where n=length(t) must be is a multiplier of pj. The function
% delta is defined in page 697 in: J. Liesen, O. Sète, & M.M.S. Nasser, 
% Fast and accurate computation of the logarithmic capacity of compact 
% sets, Comput. Methods Funct. Theory, 17(4) (2017) 689-713.
%
% The vector "s" is graded mesh points on the interval [0,2pi] to be used
% to soleve the bounday integral equation with the generalized Neumann 
% kernel in domains with corners. 
%
% The method used in the function is based on the method presented in
% R. Kress, A Nystrom method for boundary integral equations in domains
% with corners, Numer. Math. 58 (1990) 145-161.
%
n  = length(t);
for k=1:pj
    [w , wp , wpp] = fnw(pj.*t(1+(k-1)*n/pj:k*n/pj,1)-2*pi*(k-1),p);
    s(1+(k-1)*n/pj:k*n/pj,1)  = w./pj+2*pi*(k-1)/pj;
    sp(1+(k-1)*n/pj:k*n/pj,1) = wp;
    spp(1+(k-1)*n/pj:k*n/pj,1)= wpp;
end
%   
function [w , wp , wpp] = fnw (t , p)
[v , vp , vpp ] =  fnv(t , p);
[vm, vmp, vmpp] =  fnv(2*pi-t , p);
u   =   v.^p; 
z   = u+vm.^p;
up  =    p*v.^(p-1).*vp;
zp  = up-p.*vm.^(p-1).*vmp;
upp =     p*(p-1)*v.^(p-1).*vp.^2+p*v.^(p-1).*vpp;
zpp = upp+p*(p-1)*vm.^(p-1).*vmp.^2+p*vm.^(p-1).*vmpp;
w   = 2*pi*u./z;
wp  = 2*pi*(up.*z-u.*zp)./(z.^2);
wpp = 2*pi*(z.*(upp.*z-u.*zpp)+2*zp.*(up.*z-u.*zp))./(z.^3);
end
%   
function [v , vp , vpp] =  fnv(t , p)
v   =  (1/p-0.5).*(((pi-t)./pi).^3)+(t-pi)./(p.*pi)+0.5;
vp  = -(3/pi)*(1/p-0.5).*(((pi-t)./pi).^2)+1/(p*pi);
vpp =  (6/pi)*(1/p-0.5).*((pi-t)./pi);
end
%
end