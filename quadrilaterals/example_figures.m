clc
clear all
%%
format short g
addpath map
%
% verc =  exp(i*pi.*[-1 ; -0.5 ;  0 ; 0.5]); a0=1
% verc =  exp(i*pi.*[-1 ; -0.4 ;  0 ; 0.5]); a0=0.8
% verc =  exp(i*pi.*[-1 ; -0.3 ;  0 ; 0.5]); a0=1
% verc =  exp(i*pi.*[-1 ; -0.2 ;  0 ; 0.5]); a0=1
% verc =  exp(i*pi.*[-1 ; -0.1 ;  0 ; 0.5]); a0=1
% verc =  exp(i*pi.*[-1 ; -0.05 ;  0 ; 0.5]); a0=0.4
% verc =  exp(i*pi.*[-1 ; -0.01 ;  0 ; 0.5]); a0=0.4
% verc =  exp(i*pi.*[-1 ; -0.001 ;  0 ; 0.5]); a0=0.25

% verc =  exp(i*pi.*[-0.5 ; -0.35 ; -0.15 ; 0]); a0=1.4;
verc =  exp(i*pi.*[-0.75 ; -0.5 ; -0.25 ; 0]); 
% verc =  exp(i*pi.*[-1 ; -0.5 ; -0.00 ; 0.6]); a0=0.75
% verc =  exp(i*pi.*[-0.501 ; -0.499 ;  0.499 ; 0.501]); a0=2.5
% verc =  exp(i*pi.*[-0.5005 ; -0.4995 ;  0.4995 ; 0.5005]); a0=2.5;

% Ex1
% verc =  exp(i*pi.*[-0.99 ; -0.5 ; -0.0 ; 0.49]); a0=1
% Ex2
% verc =  exp(i*pi.*[-0.5 ; -0.25 ;  0.25 ; 0.5]); 
% Ex3
% verc =  exp(i*pi.*[-1 ; -0.25 ;  0.25 ; 0.5]);a0=1
% Ex4
% verc =  exp(i*pi.*[-1 ; -0.75 ;  0.25 ; 0.5]);a0=1
% Ex5
% verc =  exp(i*pi.*[-0.501 ; -0.499 ;  0.499 ; 0.501]);a0=1;
% Ex6
% verc =  exp(i*pi.*[-0.5005 ; -0.4995 ;  0.4995 ; 0.5005]);
% Ex7
% verc =  exp(i*pi.*[-1 ; -0.0001 ;  0 ; 0.5]); 

n    =  2^10;
%
disver = [];
for k=1:4
    for j=k+1:4
        disver = [disver,angle(verc(j)/verc(k))];
    end
end
d12    =  angle(verc(2)/verc(1)); d12(d12<0)=d12+2*pi;
d23    =  angle(verc(3)/verc(2)); d23(d23<0)=d23+2*pi;
d34    =  angle(verc(4)/verc(3)); d34(d34<0)=d34+2*pi;
d41    =  angle(verc(1)/verc(4)); d41(d41<0)=d41+2*pi;
wd     =  d12+d34;
hd     =  d23+d41;
mind   =  min([d12;d23;d34;d41]);
maxd   =  max([d12;d23;d34;d41]);
rd     =  hd/wd
% maxd/mind
r      =  1; a0=1; 
%%
for itr = 1:2
    verr = [ 0 ; 1 ; 1+r*i ; r*i ];
    f    =  cirmap3p(verr,verc,n);
    zet  =  f.zet;
    et   =  f.et;
    %%
    vercn = [et(1) ;  et(n/4+1) ; et(2*n/4+1) ; et(3*n/4+1) ];
    error = abs(angle(vercn(4)/verc(4)));
    verce{itr}=vercn;
    vercs{itr}=verr;
    sdr(itr) = angle(vercn(4)/verc(4));
    if itr>2 & sdr(itr)*sdr(itr-1)<0 & sdr(itr-1)*sdr(itr-2)<0
        a0=a0/2;
    end
    if itr>2 & sdr(itr)*sdr(itr-1)>0 & sdr(itr-1)*sdr(itr-2)>0
        a0=2*a0;
    end
    dr=(angle(vercn(4)/verc(4))/(2*pi))*a0;
    if dr>0.5
        dr = 0.5; a0=a0/2;
    end
    if dr<-0.1
        dr=-0.1; a0=a0/2;
    end
    %
    vernL(itr,1) = vercn(4);
    r = r+dr;
    [itr a0 r dr error]
    %%
%     figure(1)
%     plot(real(et),imag(et),'-k','LineWidth',1.2)
%     hold on
%     plot(real(verc),imag(verc),'sb','LineWidth',1.2)
%     plot(real(vercn(end)),imag(vercn(end)),'+r','LineWidth',1.2)
%     axis equal
%     drawnow        
end
%%


%%
figure
hold on
box on
plot(real(et),imag(et),'-k','LineWidth',2);
plot(real(verc),imag(verc),'sk','MarkerFaceColor','k','Markersize',8);
text(real(verc(1))-0.1,imag(verc(1))-0.1,'{$z_1$}','FontSize',18,'Interpreter','latex')
text(real(verc(2))-0.05,imag(verc(2))-0.1,'{$z_2$}','FontSize',18,'Interpreter','latex')
text(real(verc(3))+0.05,imag(verc(3))-0.05,'{$z_3$}','FontSize',18,'Interpreter','latex')
text(real(verc(4))+0.04,imag(verc(4))+0.03,'{$z_4$}','FontSize',18,'Interpreter','latex')

plot(real(vernL(1)),imag(vernL(1)),'db','MarkerFaceColor','b','Markersize',8);
plot(real(vernL(2)),imag(vernL(2)),'dr','MarkerFaceColor','r','Markersize',8);
text(real(vernL(1))+0.00,imag(vernL(1))+0.1,'{$z_{4,0}$}','FontSize',18,'Interpreter','latex')
text(real(vernL(2))+0.03,imag(vernL(2))-0.05,'{$z_{4,1}$}','FontSize',18,'Interpreter','latex')

axis equal
axis([-1.15 1.25 -1.20 1.20])
% axis off
set(gca,'LooseInset',get(gca,'TightInset'))
print -depsc fig_quad_D0
%%
figure
hold on
box on
ver1 = [0;1;1+i;i;0];
plot(real(ver1),imag(ver1),'-b','LineWidth',2);
ver2 = [0;1;1+r*i;r*i;0];
plot(real(ver2),imag(ver2),'--r','LineWidth',2);
plot(real(ver1),imag(ver1),'sk','MarkerFaceColor','k','Markersize',8);
plot(real(ver2),imag(ver2),'sk','MarkerFaceColor','k','Markersize',8);
plot(real(ver1(4)),imag(ver1(4)),'sb','MarkerFaceColor','b','Markersize',8);
plot(real(ver2(4)),imag(ver2(4)),'sr','MarkerFaceColor','r','Markersize',8);
text(-0.13,1,'{$r_0{\rm i}$}','FontSize',18,'Interpreter','latex')
text(-0.13,r,'{$r_1{\rm i}$}','FontSize',18,'Interpreter','latex')

axis equal
axis([-0.2 1.1 -0.1 1.3])
% axis off
set(gca,'LooseInset',get(gca,'TightInset'))
print -depsc fig_quad_Q0
%%
%%
