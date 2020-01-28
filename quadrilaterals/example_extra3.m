% clc
clear all
%%
addpath map
%
verc =  exp(i*pi.*[-1 ; -0.001 ;  0 ; 0.5]);
n    =  2^10;
f    =  quadmap(verc,n,200,1e-14);
r    =  f.r;
%%
et   =  f.et;
etp  =  f.etp;
zet  =  f.zet;
verr = [0 ; 1 ; 1+r*i ; r*i ];
%%
no_cir = 9;
no_rad = 16;
for k=1:no_cir
    zc(k,:) = (k/(no_cir+1)).*exp(2i*pi.*linspace(0,1,201));
    wc(k,:) = fcau(et,etp,zet,zc(k,:));
end    
for k=1:no_rad
    zr(k,:) = [linspace(0,0.9,200),linspace(0.9,0.999,100),linspace(0.999,0.999999,100)].*exp(2i*pi*(k/(no_rad)));
    wr(k,:) = fcau(et,etp,zet,zr(k,:));
end    
%%
figure
hold on
box on
for k=1:no_cir
    plot(real(zc(k,:)),imag(zc(k,:)),'-r','LineWidth',1);
end
for k=1:no_rad
    plot(real(zr(k,:)),imag(zr(k,:)),'-b','LineWidth',1);
end
plot(real(et),imag(et),'-k','LineWidth',2);
colormap prism;
cmap=colormap;
for k=1:length(verc)
    plot(real(verc(k)),imag(verc(k)),'sk','MarkerFaceColor',cmap(1*k,:));
end
axis equal
axis([-1.01 1.01 -1.11 1.01])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc fig_qd_c_1
%%
figure
hold on
box on
for k=1:no_cir
    plot(real(wc(k,:)),imag(wc(k,:)),'-r','LineWidth',1);
end
for k=1:no_rad
    plot(real(wr(k,:)),imag(wr(k,:)),'-b','LineWidth',1);
end
plot(real(zet),imag(zet),'-k','LineWidth',2);
colormap prism;
cmap=colormap;
for k=1:length(verc)
    plot(real(verr(k)),imag(verr(k)),'sk','MarkerFaceColor',cmap(1*k,:));
end
axis equal
axis([-0.01 max(1.01,r+0.01) -0.01 max(1.01,r+0.01)])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc fig_qd_s_1
%%