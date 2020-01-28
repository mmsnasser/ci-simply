clc
clear all
%%
addpath bie fmm
%%
alpha   =  0;
rho   =  2;
ver   = [ rho+1i; -rho+1i; -rho-1i; rho-1i];
for k=1:length(ver)-1
    L{k}=[ver(k);ver(k+1)];
end
L{length(ver)}=[ver(length(ver));ver(1)];
%%
ns =  2^10; 
n  = length(ver)*ns; 
[et,etp]=polygonp(ver,ns);
[x,y] =  meshgrid(linspace(-rho,rho,200),linspace(-1,1,100));
[in on] = inpolygon(x,y,real(ver),imag(ver));
z     =  x+i.*y;
z(~in)=NaN+i*NaN; 
z(on)=NaN+i*NaN;
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
%%
kk=1
% 
Uzv=hm(ver,L{kk},alpha,zv,ns);
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
vcont = [0.02,0.1,0.2,0.3,0.4,0.5,0.65,0.8,0.95];
fig=figure;
hold on
box on
axis equal
plot(real(et),imag(et),'-k','LineWidth',1.0);
plot(real(L{kk}),imag(L{kk}),'-or','LineWidth',2.0,'MarkerFaceColor','r');
[cnt1,cnt2] =  contour(x,y,Uz,vcont,'b');
clabel(cnt1,cnt2,'FontSize',15,'Color','k')
set(gca,'XTick',[-2:1:3],'FontSize',18);
set(gca,'YTick',[-3:1:2]);
% axis([-2.1 2.1 -3.1 2.1])
set(gca,'LooseInset',get(gca,'TightInset'))
drawnow
% saveas(fig,sprintf('hm_5s_%d.eps',kk));
% print(fig,'-depsc',sprintf('hm_5s_%d.eps', kk)) 
%%
