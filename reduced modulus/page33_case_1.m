clear; 
%%
addpath bie fmm
%%
rv        =  [0.01,0.025,0.05,linspace(0.1,0.9,10),0.95,0.975,0.99];
for kk=1:length(rv)
r        =   rv(kk);
%%
Map      =   @(z)(2*sqrta(r,-pi)*sqrta(z,-pi));
Mapp     =   @(z)(sqrta(r,-pi)./sqrta(z,-pi));
alpha    =   Map(r);
%%
n        =   2^12;
t        =  (0:2*pi/n:2*pi-2*pi/n).';
%% The parametization of the boundary
p        =  3;
[s,sp]   =  deltw (t , 2 , p);

et (1:n/2,1)        =    Map(exp(i*(2.*s(1:n/2)-pi)));
etp(1:n/2,1)        =    Mapp(exp(i*(2.*s(1:n/2)-pi))).*exp(i*(2.*s(1:n/2)-pi)).*2i.*sp(1:n/2);

et (n/2+1:n,1)      =    Map(-1).*((2/pi).*s(n/2+1:n)-3);
etp(n/2+1:n,1)      =    Map(-1).*((2/pi).*sp(n/2+1:n));
%%

%%
% I first used the map w=sqrta(z,-pi) to map the domain on page 33 case 1 to the
% domain shown below. I compute the reduced modulus of the new domain using 
% my method then I used the formula in Corollary 2.2.1 in page 16 to 
% compute the reduced modulus of the given domain.     
[~,rm(kk)]  =  confrad (et,etp,n,alpha,'b');
exrm(kk)    =  log(4*r*(1-r)/(1+r))/(2*pi);
%%
end

%%
figure
hold on
box on
plot(rv,rm,'-k','LineWidth',1);
hold on
plot(rv,exrm,'or','LineWidth',1);

xlabel('{$r$}','FontSize',18,'Interpreter','latex');
ylabel('$m(G_1,r)$','FontSize',18,'Interpreter','latex');

legend({'Numerical','Exact'},'FontSize',15,'Interpreter','latex','Location','southeast');

set(gca,'XTick',[0:0.2:1],'FontSize',18);
set(gca,'YTick',[-0.8:0.2:0.0]);
% axis([0 0.85 -11 -8])
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
set(gca,'LooseInset',get(gca,'TightInset'))

print -depsc fig_rm_c1
%%
figure
semilogy(rv,abs(rm-exrm),'-b','LineWidth',1);
hold on
box on

xlabel('{$r$}','FontSize',18,'Interpreter','latex');
ylabel('$\log_{10}$(Absolute error)','FontSize',18,'Interpreter','latex');

set(gca,'XTick',[0:0.2:1],'FontSize',18);
% set(gca,'YTick',[1e-16,1e-15,1e-14,1e-13]);

grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
axis([0 1 1e-20 1e0])
set(gca,'LooseInset',get(gca,'TightInset'))
% 
print -depsc fig_rm_c1_r
%%