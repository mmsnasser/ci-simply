clc
clear all
%%
format short g
addpath map
%
verc =  exp(i*pi.*[0 ; 0.35 ; 0.7 ; 1.25]); 
%
n    =  2^10;
%
tic
f    =  quadmap(verc,n,100,1e-13);
toc
r     =  f.r
error = f.err
itr   = f.itr
%%
et   =  f.et;
etp  =  f.etp;
zet  =  f.zet;
verr = [0 ; 1 ; 1+r*i ; r*i ];
%%


%%
tt = linspace(0,2*pi,1000);
wd = et(n/8)+(et(5.125*n/8)-et(n/8)).*(tt./(2*pi)+0.005i.*tt.*(2*pi-tt).*sin(6.*tt));
figure
hold on
box on
plot(real(wd),imag(wd),'-k','LineWidth',1);
plot(real(et(1:n/4)),imag(et(1:n/4)),'-r','LineWidth',2);
plot(real(et(n/4+1:2*n/4)),imag(et(n/4+1:2*n/4)),'-k','LineWidth',1);
plot(real(et(2*n/4+1:3*n/4)),imag(et(2*n/4+1:3*n/4)),'-b','LineWidth',2);
plot(real(et(3*n/4+1:4*n/4)),imag(et(3*n/4+1:4*n/4)),'-k','LineWidth',1);
plot(real(verc(1)),imag(verc(1)),'dk','MarkerFaceColor','k','Markersize',9);
plot(real(verc(2)),imag(verc(2)),'sk','MarkerFaceColor','k','Markersize',10);
plot(real(verc(3)),imag(verc(3)),'pk','MarkerFaceColor','k','Markersize',10);
plot(real(verc(4)),imag(verc(4)),'ok','MarkerFaceColor','k','Markersize',9);
text(real(verc(1))+0.05,imag(verc(1))-0.0,'{$1$}','FontSize',18,'Interpreter','latex')
text(real(verc(2))+0.02,imag(verc(2))+0.1,'{$e^{{\rm i}\theta_1}$}','FontSize',18,'Interpreter','latex')
text(real(verc(3))-0.12,imag(verc(3))+0.08,'{$e^{{\rm i}\theta_2}$}','FontSize',18,'Interpreter','latex')
text(real(verc(4))-0.25,imag(verc(4))-0.08,'{$e^{{\rm i}\theta_3}$}','FontSize',18,'Interpreter','latex')
text(-0.08,+0.1,'{$\Omega_1$}','FontSize',18,'Interpreter','latex')
axis equal
axis([-1.15 1.15 -1.15 1.15])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
print -depsc fig_quad_ex_D
%%
wr = 0.6+(0.4+r*i-0.6).*(tt./(2*pi)+0.005i.*tt.*(2*pi-tt).*sin(9.*tt));
figure
hold on
box on
plot(real(wr),imag(wr),'-k','LineWidth',1);
plot([0 1],[0 0],'-r','LineWidth',2);
plot([1 1],[0 r],'-k','LineWidth',1);
plot([1 0],[r r],'-b','LineWidth',2);
plot([0 0],[r 0],'-k','LineWidth',1);
plot(real(verr(1)),imag(verr(1)),'dk','MarkerFaceColor','k','Markersize',9);
plot(real(verr(2)),imag(verr(2)),'sk','MarkerFaceColor','k','Markersize',10);
plot(real(verr(3)),imag(verr(3)),'pk','MarkerFaceColor','k','Markersize',10);
plot(real(verr(4)),imag(verr(4)),'ok','MarkerFaceColor','k','Markersize',9);
text(-0.06,r+0.06,'{${\rm i}r$}','FontSize',18,'Interpreter','latex')
text(1-0.01,r+0.05,'{$1+{\rm i}r$}','FontSize',18,'Interpreter','latex')
text(1.025,-0.05,'{$1$}','FontSize',18,'Interpreter','latex')
text(-0.075,-0.05,'{$0$}','FontSize',18,'Interpreter','latex')
text(0.55,+0.5,'{$\Omega_2$}','FontSize',18,'Interpreter','latex')
axis equal
axis([-0.1 1.2 -0.1 1.2])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
print -depsc fig_quad_ex_R
%%
wh = -0.6+(2.4).*(tt./(2*pi)-0.6.*sin(tt)+0.1i.*(tt.*(2*pi-tt)+0.2.*sin(11.*tt)+0.2.*sin(8.*tt)));
figure
hold on
box on
plot(real(wh),imag(wh),'-k','LineWidth',1);
plot([-2 3],[0 0],'-k','LineWidth',1);
plot([-1 0],[0 0],'-r','LineWidth',2);
plot([0.8 3],[0 0],'-b','LineWidth',2);
plot(-1,0,'dk','MarkerFaceColor','k','Markersize',9);
plot(0,0,'sk','MarkerFaceColor','k','Markersize',10);
plot(0.8,0,'pk','MarkerFaceColor','k','Markersize',10);
% plot(real(verr(4)),imag(verr(4)),'ok','MarkerFaceColor','k','Markersize',9);
text(-1.3,-0.3,'{$-1$}','FontSize',18,'Interpreter','latex')
text(-0.075,-0.25,'{$0$}','FontSize',18,'Interpreter','latex')
text(0.725,-0.25,'{$s$}','FontSize',18,'Interpreter','latex')
text(0.55,+2.15,'{$\Omega_3$}','FontSize',18,'Interpreter','latex')
axis equal
axis([-1.9 2.9 -1 3.8])
axis off
set(gca,'LooseInset',get(gca,'TightInset'))
print -depsc fig_quad_ex_H
%%