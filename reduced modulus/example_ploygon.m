clear
%%
addpath bie fmm
%%
ellv = 3:1:40;
for kk=1:length(ellv)
ell      =  ellv(kk); % the number of vertices of the polygon
%%
ver        =  exp(i.*[0:2*pi/ell:2*pi-2*pi/ell].'); % Vertices of the polygon
alpha      =  0;
ns         =  2^9;
n          =  length(ver)*ns;
[et,etp]   =  polygonp(ver,n/length(ver));


% [s,sp] =   deltw(t,length(ver),3);
% for j=1:length(ver)
%     sv{j}  =  s((j-1)*n/length(ver)+1:j*n/length(ver));
% end
% verts     =   ver; verts(length(ver)+1)=verts(1);
% for j=1:length(ver)
%     etv{j}   = verts(j)+(length(ver)/(2*pi))*(verts(j+1)-verts(j)).*(sv{j}-sv{j}(1));
%     etvp{j}  =          (length(ver)/(2*pi))*(verts(j+1)-verts(j)).*(ones(size(sv{j})));
% end
% eto = []; etopo = [];
% for j=1:length(ver)
%     eto((j-1)*n/length(ver)+1:j*n/length(ver),1)     =  etv{j};
%     etopo((j-1)*n/length(ver)+1:j*n/length(ver),1)   =  etvp{j};
% end
% etop       =  sp.*etopo;
% et(1:n,1)  =  eto;
% etp(1:n,1) =  etop;
%%
[~,rm(kk)] =  confrad (et,etp,n,alpha,'b');
area(kk)   =  pi-ell*cos(pi/ell)*sin(pi/ell);
ell
if ell==8
    figure
    t      =  (0:2*pi/n:2*pi-2*pi/n).';
    plot(real(et),imag(et),'-b','LineWidth',1);
    hold on
    plot(real(ver),imag(ver),'ok','MarkerFaceColor','k');
    plot(cos(t),sin(t),':k','LineWidth',1);
    set(gca,'XTick',[-1:1],'FontSize',18);
    set(gca,'YTick',[-1:1]);
    axis equal
    axis([-1.1 1.1 -1.05 1.05])
    set(gca,'LooseInset',get(gca,'TightInset'))
    print -depsc fig_rm_pg_d
end
end
%%
figure
plot(ellv,rm,'-b','LineWidth',1);
box on

xlabel('{$\ell$}','FontSize',18,'Interpreter','latex');
ylabel('$m(G_\ell,0)$','FontSize',18,'Interpreter','latex');

set(gca,'XTick',[0:5:40],'FontSize',18);
set(gca,'YTick',[-0.1:0.025:0]);
% axis([0 0.85 -11 -8])
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
set(gca,'LooseInset',get(gca,'TightInset'))

print -depsc fig_rm_pg
%%