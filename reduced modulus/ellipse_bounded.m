clear
%%
addpath bie fmm
%%
n         =  2^12;
t         = (0:2*pi/n:2*pi-2*pi/n).';
%%
rv        =  [0.2,0.3,0.5,linspace(1,20,20)];
for k=1:length(rv)
    r         =  rv(k);
    alpha     =  0.0i;
    et        =  cosh(r).*cos(t)+i*sinh(r).*sin(t);
    etp       = -cosh(r).*sin(t)+i*sinh(r).*cos(t);
    [~,rm(k)] =  confrad (et,etp,n,alpha,'b');
    s         =  jacinvmu(2*r);
    exrm(k)   =  log(pi/(2*sqrt(s)*ellipk(s)))/(2*pi);
    aerror(k) =  abs((rm(k)-exrm(k)));
end
% The exact reduced modulus is log(2/(1+r))/(2*pi)
%%
figure
hold on
box on
plot(rv,rm,'-b','LineWidth',1);
hold on
plot(rv,exrm,'or','LineWidth',1);

xlabel('{$r$}','FontSize',18,'Interpreter','latex');
ylabel('$m(G_r,\infty)$','FontSize',18,'Interpreter','latex');

legend({'Numerical','Exact'},'FontSize',15,'Interpreter','latex','Location','northeast');

set(gca,'XTick',[0:5:20],'FontSize',18);
set(gca,'YTick',[-0.5:1:3.5]);
% axis([0 0.85 -11 -8])
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
set(gca,'LooseInset',get(gca,'TightInset'))

print -depsc fig_rm_be
%%
figure
plot(rv,log10(aerror),'-b','LineWidth',1)

xlabel('{$r$}','FontSize',18,'Interpreter','latex');
ylabel('$\log_{10}$(Absolute error)','FontSize',18,'Interpreter','latex');
set(gca,'XTick',[0:5:20],'FontSize',18);
set(gca,'YTick',[-15:1:-12]);
axis([0 20 -15 -12])
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
set(gca,'LooseInset',get(gca,'TightInset'))
print -depsc fig_rm_be_r
%%