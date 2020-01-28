clear
format short g
%%
addpath bie fmm
%%
cver1     =    exp(-1.25i*pi);
cver3     =    exp(0.25i*pi);
ang1      =    angle(cver1);
ang3      =    angle(cver3);
ang3(ang3<ang1)=ang3+2*pi;
ang2      =    (ang1+ang3)/2;
cver2     =    exp(i*ang2);
cver      =   [cver1;cver2;cver3];
%%
Hcir      =  @(z)((1/pi)*imag(log((i-z)./(1-i.*z))));
Mob       =  @(z,cver)(((z-cver(1)).*(cver(2)-cver(3))-i*(z-cver(3)).*(cver(2)-cver(1)))./...
                       ((z-cver(3)).*(cver(2)-cver(1))-i*(z-cver(1)).*(cver(2)-cver(3))));
%%
n         =   2^10;
t         =  (0:2*pi/n:2*pi-2*pi/n).';
%% 
et        =   exp(i.*t);
etp       =   i.*exp(i.*t);
%%


%%
[x,y] =  meshgrid([-1:0.01:1],[-1:0.01:1]);
z     =  x+i.*y;
z(abs(z)>=1)=NaN+i*NaN;
cz    =  Mob(z,cver);
Uz    =  Hcir(cz);
%%
vcont = [0.02,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,0.98];
figure;
hold on
axis equal
[cnt1,cnt2] =  contour(x,y,Uz,vcont,'b','ShowText','on');
plot(real(et),imag(et),'-k','LineWidth',1.0);
%%
figure
hold on
axis equal
pcolor(x,y,Uz);
shading flat
colormap jet
colorbar
plot(real(et),imag(et),'-k','LineWidth',1.0);
plot(real(cver),imag(cver),'or','MarkerFaceColor','r');
%%