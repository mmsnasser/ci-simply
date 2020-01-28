clear; 
%%
addpath bie fmm
%%
av       =   [0,0.25,0.5,0.75];
for ka=1:length(av)
a         =   av(ka);  % choose a in the interval [0,1)
rv(ka,:)  =  linspace(a+0.01,0.99,20);
for kr=1:length(rv(ka,:))
r        =   rv(ka,kr);
%%
Map      =   @(z)(2*sqrta(r-a,-pi).*sqrta(z-a,-pi));
Mapp     =   @(z)(  sqrta(r-a,-pi)./sqrta(z-a,-pi));
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
% I first used the map w=sqrt(a-z) to map the domain on page 33 case 2 to the
% domain shown below. I compute the reduced modulus of the new domain using 
% my method then I used the formula in Corollary 2.2.1 in page 16 to 
% compute the reduced modulus of the given domain. 
% I used (my) MATLAB function sqrtr for which the branch cut is on the +ve
% real line.
[~,rm(ka,kr)]=  confrad (et,etp,n,alpha,'b');
exrm(ka,kr)  =  log(4*(r-a)*(1-r*a)*(1-r)/((1+r)*(1-a)^2))/(2*pi);
%%
end
end

%%
figure
hold on
box on
for k=1:length(av)
plot(rv(k,:),rm(k,:),'-k','LineWidth',1);
hold on
plot(rv(k,:),exrm(k,:),'or','LineWidth',1);
end

xlabel('{$r$}','FontSize',18,'Interpreter','latex');
ylabel('$m(G_2,r)$','FontSize',18,'Interpreter','latex');

% legend({'Numerical','Exact'},'FontSize',15,'Interpreter','latex','Location','southeast');

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

print -depsc fig_rm_c3
%%
figure

semilogy(rv(1,:),abs(rm(1,:)-exrm(1,:)),'-r','LineWidth',1);
hold on
box on
semilogy(rv(2,:),abs(rm(2,:)-exrm(2,:)),'-m','LineWidth',1);
semilogy(rv(3,:),abs(rm(3,:)-exrm(3,:)),'-k','LineWidth',1);
semilogy(rv(4,:),abs(rm(4,:)-exrm(4,:)),'-b','LineWidth',1);

legend({'$a=0$','$a=0.25$','$a=0.5$','$a=0.75$'},'FontSize',15,'Interpreter','latex','Location','northwest');

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
print -depsc fig_rm_c3_r
%%