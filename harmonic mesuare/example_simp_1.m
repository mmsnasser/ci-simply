clear
format short g
%%
addpath bie fmm
%%
n         =   2^10;
ind1      =   5*n/8;
ind2      =   1*n/8;
%% 
t         =  (0:2*pi/n:2*pi-2*pi/n).';
p         =   0.5;
et        =   cos(t)+p*i.*sin(t);
etp       =  -sin(t)+p*i.*cos(t);
%%
alpha     =   0;
A         =   et-alpha;
gam       =  -log(abs(et-alpha));
[mu,h]    =   fbie(et,etp,A,gam,n,5,[],1e-14,100);
c         =   exp(-mean(h));
fet       =  (gam+h+i*mu)./A;
zet       =   c.*(et-alpha).*exp((et-alpha).*fet);
%%
ver1      =   et(ind1);
ver3      =   et(ind2);
ver       =   [ver1;ver3];
cver1     =   zet(ind1);
cver3     =   zet(ind2);
ang1      =   angle(cver1);
ang3      =   angle(cver3);
ang3(ang3<ang1)=ang3+2*pi;
ang2      =    (ang1+ang3)/2;
cver2     =    exp(i*ang2);
cver      =   [cver1;cver2;cver3];
%%
Hcir      =  @(z)((1/pi)*imag(log((i-z)./(1-i.*z))));
Mob       =  @(z,cver)(((z-cver(1)).*(cver(2)-cver(3))-i*(z-cver(3)).*(cver(2)-cver(1)))./...
                       ((z-cver(3)).*(cver(2)-cver(1))-i*(z-cver(1)).*(cver(2)-cver(3))));
%%



%%
[x,y] =  meshgrid([-1:0.01:1],[-1:0.01:1]);
z     =  x+i.*y;
z(real(z).^2+imag(z./p).^2>=1)=NaN+i*NaN;
[mx,nx] = size(z);
ind  = 1;
for k=1:mx
    for j=1:nx
        if abs(z(k,j))>=0
            zv(ind)=z(k,j);
            ind=ind+1;
        end
    end
end
fzv   =  fcau(et,etp,fet,zv);
czv   =  c.*(zv-alpha).*exp((zv-alpha).*fzv);
czv2  =  Mob(czv,cver);
Uzv   =  Hcir(czv2);
ind  = 1;
for k=1:mx
    for j=1:nx
        if abs(z(k,j))>=0
            Uz(k,j)=Uzv(ind);
            ind=ind+1;
        else
            Uz(k,j) = NaN;
        end
    end
end
%%
vcont = [0.02,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,0.98];
figure;
hold on
axis equal
[cnt1,cnt2] =  contour(x,y,Uz,vcont,'b','ShowText','on');
plot(real(et),imag(et),'-k','LineWidth',1.0);
plot(real(ver),imag(ver),'or','MarkerFaceColor','r');
%%
figure
hold on
axis equal
pcolor(x,y,Uz);
shading flat
colormap jet
colorbar
plot(real(et),imag(et),'-k','LineWidth',1.0);
plot(real(ver),imag(ver),'or','MarkerFaceColor','r');
%%