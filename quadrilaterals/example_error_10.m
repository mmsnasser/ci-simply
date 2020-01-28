clc
clear all
%
addpath map bie fmm
%%
thet2vc = [0.5001,0.501,0.51,linspace(0.52,1.48,25),1.49,1.499,1.4999]*pi;
thet1 =  0.5*pi;
thet3 =  1.5*pi;
n     =  2^10;
%
for k=1:length(thet2vc)
thet2 =  thet2vc(k);
thet  =  [0 ; thet1 ; thet2 ; thet3];
verc  =  exp(i*thet);
tic
f       =  quadmap(verc,n,50,0.5e-13);
timm(k) = toc;
r(k)    = f.r;
itr(k)  = f.itr;
error{k}(1:itr(k))= f.err;
%
taup1       = (sin(thet2/2)/sin(thet1/2))*(sin((thet3-thet1)/2)/sin((thet3-thet2)/2));
exac_r(k)   =  pi/(2*mu(1/sqrt(taup1)));
rerror_r(k) =  abs(r(k)-1/exac_r(k))/(1/exac_r(k))
%
end
%%
figure
plot(thet2vc,log10(rerror_r),'-b','LineWidth',1.5)
xlabel('{$\theta_2$}','FontSize',18,'Interpreter','latex');
ylabel('$\log_{10}$(Relative error)','FontSize',18,'Interpreter','latex');
set(gca,'XTick',[pi/2 pi 3*pi/2],'XTickLabel',{'\pi/2','\pi','3\pi/2'},'FontSize',18)
set(gca,'YTick',[-16:2:-8]);
axis([pi/2 3*pi/2 -16 -8])
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
set(gca,'LooseInset',get(gca,'TightInset'))
print -depsc fig_quad_err_thet2_10
% print -dpdf fig_BC_E2c_err
%%
figure
hold on
box on
k=1;plot(1:itr(k),log10(error{k}(1:itr(k))),'-r','LineWidth',1.0)
for k=2:length(thet2vc)
    plot(1:itr(k),log10(error{k}(1:itr(k))),'-b','LineWidth',1.0)
end
xlabel('{k: the iteration number}','FontSize',18,'Interpreter','latex');
ylabel('$\log_{10}$(Successive error)','FontSize',18,'Interpreter','latex');
set(gca,'XTick',[0:10:50],'FontSize',18);
set(gca,'YTick',[-13:2:1]);
axis([0 40 -13 1])
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
set(gca,'LooseInset',get(gca,'TightInset'))
print -depsc fig_quad_err_itr_10
% print -dpdf fig_BC_E2c_err
%%
figure
plot(thet2vc,timm,'-b','LineWidth',1.5)
xlabel('{$\theta_2$}','FontSize',18,'Interpreter','latex');
ylabel('CPU time (sec)','FontSize',18,'Interpreter','latex');
set(gca,'XTick',[pi/2 pi 3*pi/2],'XTickLabel',{'\pi/2','\pi','3\pi/2'},'FontSize',18)
set(gca,'YTick',[0:5:30]);
axis([pi/2 3*pi/2 0 10])
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
set(gca,'LooseInset',get(gca,'TightInset'))
print -depsc fig_quad_time_thet2_10
% print -dpdf fig_BC_E2c_err
%%
figure
plot(thet2vc,r,'-b','LineWidth',1.5)
xlabel('{$\theta_2$}','FontSize',18,'Interpreter','latex');
ylabel('{$r$}','FontSize',18,'Interpreter','latex');
set(gca,'XTick',[pi/2 pi 3*pi/2],'XTickLabel',{'\pi/2','\pi','3\pi/2'},'FontSize',18)
set(gca,'YTick',[0:0.5:4]);
axis([pi/2 3*pi/2 0 4])
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
set(gca,'LooseInset',get(gca,'TightInset'))
print -depsc fig_quad_r_thet2_10
% print -dpdf fig_BC_E2c_err
%%

