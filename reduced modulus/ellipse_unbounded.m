clear
%%
addpath bie fmm
%%
n         =  2^12;
t         = (0:2*pi/n:2*pi-2*pi/n).';
%%
rv        =  linspace(0.005,0.999,20);
for k=1:length(rv)
    r         =  rv(k);
    alpha     =  0.0i;
    et        =  cos(t)-r.*i.*sin(t);
    etp       = -sin(t)-r.*i.*cos(t);
    [~,rm(k)] =  confrad (et,etp,n,alpha,'u');
    exrm(k)   =  log(2./(1+r))/(2*pi);
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

set(gca,'XTick',[0:0.2:1],'FontSize',18);
set(gca,'YTick',[0:0.04:0.12]);
% axis([0 0.85 -11 -8])
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
set(gca,'LooseInset',get(gca,'TightInset'))

print -depsc fig_rm_ue
%%
figure
plot(rv,log10(aerror),'-b','LineWidth',1)

xlabel('{$r$}','FontSize',18,'Interpreter','latex');
ylabel('$\log_{10}$(Absolute error)','FontSize',18,'Interpreter','latex');
set(gca,'XTick',[0:0.2:1],'FontSize',18);
set(gca,'YTick',[-18:2:-12]);
axis([0 1 -18 -12])
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
set(gca,'LooseInset',get(gca,'TightInset'))
print -depsc fig_rm_ue_r
%%