clear
format short g
%%
addpath bie fmm
%%
n         =   2^10
itr_total =   50
%%
t         =   (0:2*pi/n:2*pi-2*pi/n).';
%% 
zo   =   -2;
alp  =  [-0.0];
m    =    length(alp);
rad  =  [ 1.0];
%%
Mob  =   @(z,zj)(((z-zj(3)).*(zj(2)-zj(1))-i*(z-zj(1)).*(zj(2)-zj(3)))./...
              ((z-zj(1)).*(zj(2)-zj(3))-i*(z-zj(3)).*(zj(2)-zj(1))));
%%
for k=1:m
    et(1+(k-1)*n:k*n,1)    =  alp(k)+rad(k).*exp(-1i.*t);
    etp(1+(k-1)*n:k*n,1)   =        -rad(k)*1i.*exp(-1i.*t);    
end
%%

%%
zj(2) =  alp(1)+rad(1);
x1    =  real(alp(1));   y1  =  imag(alp(1));
x2    =  real(zo);       y2  =  imag(zo);
R     =  abs(zo-alp(1));
r     =  1.5
r1    =  rad(1);   r2  =  r;
if r1+r2<=R
    U_of_zo = 0
elseif r1+r2>R & r2<r1+R
    z1 =  0.5*((x1+x2)+i*(y1+y2))+((r1^2-r2^2)/(2*R^2))*((x2-x1)+i*(y2-y1))+...
             0.5*sqrt(2*(r1^2+r2^2)/R^2-((r1^2-r2^2)^2)/R^4-1)*((y2-y1)+i*(x2-x1));
    z2 =  0.5*((x1+x2)+i*(y1+y2))+((r1^2-r2^2)/(2*R^2))*((x2-x1)+i*(y2-y1))-...
             0.5*sqrt(2*(r1^2+r2^2)/R^2-((r1^2-r2^2)^2)/R^4-1)*((y2-y1)+i*(x2-x1));
elseif r2>=r1+R
    U_of_zo = 1
end
if imag(z2)<imag(z1)
    zj(1)=z1;
    zj(3)=z2;
elseif imag(z1)<imag(z2)
    zj(1)=z2;
    zj(3)=z1;
end
zj
%%
% cir_r = zo+r*exp(i.*[0:2*pi/n:2*pi]);
% figure;
% hold on
% for k=1:m
%     c_cr    =  et((k-1)*n+1:k*n,1); c_cr(n+1)  =  c_cr(1);
%     plot(real(c_cr),imag(c_cr),'k','LineWidth',1)
%     plot(real(cir_r),imag(cir_r),':r','LineWidth',1)
% end
% plot(real(alp),imag(alp),'+b','LineWidth',2.5)
% axis equal
%%
met   =  Mob(et,zj);
Uet   =  (1/pi)*imag(log((1+i*met)./(met+i)));
%%
wzo   =  Mob(zo,zj);
U_of_zo = (1/pi)*imag(log((1+i*wzo)./(wzo+i)))
%%

% %%
% [x,y] =  meshgrid([-3:0.01:2],[-2:0.01:2]);
% z     =  x+i.*y;
% z(abs(z-alp(1))<=rad(1))=NaN+i*NaN;
% wz    =  Mob(z,zj);
% Uz    = (1/pi)*imag(log((1+i*wz)./(wz+i)));
% %%
% vcont = [0.02,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,0.98];
% figure;
% hold on
% axis equal
% [cnt1,cnt2] =  contour(x,y,Uz,vcont,'b');
% for k=1:m
%     plot(real(et(1+(k-1)*n:k*n)),imag(et(1+(k-1)*n:k*n)),'-k','LineWidth',1.0);
% end
% %%
% figure
% hold on
% axis equal
% pcolor(x,y,Uz);
% shading flat
% colormap jet
% colorbar
% for k=1:m
%     plot(real(et(1+(k-1)*n:k*n)),imag(et(1+(k-1)*n:k*n)),'-k','LineWidth',1.0);
% end
% plot(real(cir_r),imag(cir_r),':r','LineWidth',1)
% %%