%FILE: example_13s.m
%2018-12-15
clc
clear all
%%
addpath bie fmm
%%
alpha   =  0;
ver=[4 ; 4+2i ; 2+4i ; 4i ; -1+3i ; -2+3i; -3+i ; -3; -2-2i; -1-3i; 0-3i; 1-2i; 3-2i];
m=length(ver);
%%
for k=1:length(ver)-1
    L{k}=[ver(k);ver(k+1)];
end
L{length(ver)}=[ver(length(ver));ver(1)];
%%
ns =  2^9; n = length(ver)*ns; [et,etp]=polygonp(ver,ns);
xx    =  min(real(ver)):(max(real(ver))-min(real(ver)))/1000:max(real(ver));
yy    =  min(imag(ver)):(max(imag(ver))-min(imag(ver)))/1000:max(imag(ver));
[x,y] =  meshgrid(xx,yy);
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
for kk=1:length(ver)
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
%
vcont = [0,0.01,0.05,0.1,0.2,0.3,0.4,0.5,0.7,0.9];
fig=figure;
hold on
box on
axis equal
% contourf(x,y,Uz,vcont)
% colormap jet
% map = 0.8.*colormap+0.2.*ones(size(colormap));
% brighten(map,0.4)
% caxis([0 1])
% colorbar 
[cnt1,cnt2] =  contour(x,y,Uz,vcont,'b');
% clabel(cnt1,cnt2,'FontSize',15,'Color','k')
clabel(cnt1, 'manual','FontSize',15,'Color','k')
plot(real(et),imag(et),'-k','LineWidth',1.0);
plot(real(L{kk}),imag(L{kk}),'-or','LineWidth',2.0,'MarkerFaceColor','r');
set(gca,'XTick',[-3:1:4],'FontSize',18);
set(gca,'YTick',[-3:1:4]);
% axis([-1.12 1.16 -1.05 1.05])
set(gca,'LooseInset',get(gca,'TightInset'))
drawnow
set(gcf,'Renderer','zbuffer')
% print -depsc -r500  hyp_dist_hyp2.eps
% saveas(fig,sprintf('hm_5s_%d.eps',kk));
print(fig,'-depsc','-r500',sprintf('hm_13s_%d.eps', kk)) 
%%
end

