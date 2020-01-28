clear
format short g
%%
addpath bie fmm
%%
Hcir      =  @(z)((1/pi)*imag(log((i-z)./(1-i.*z))));
%%
n         =   2^10
t         =  (0:2*pi/n:2*pi-2*pi/n).';
%% 
et        =   exp(i.*t);
etp       =   i.*exp(i.*t);
%%


%%
[x,y] =  meshgrid([-1:0.01:1],[-1:0.01:1]);
z     =  x+i.*y;
z(abs(z)>=1)=NaN+i*NaN;
Uz    =  Hcir(z);
%%
vcont = [0.02,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,0.98];
figure;
hold on
axis equal
[cnt1,cnt2] =  contour(x,y,Uz,vcont,'b');
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
%%