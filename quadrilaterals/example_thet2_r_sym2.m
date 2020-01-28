clc
clear all
%
addpath map
%%
r1 = 1:50;
r2 = 1./r1(end:-1:1)
for k=1:length(r2)
    rpi = sym(r2(k))*sym(pi);
    thet2_2(k) =  2*acot(2*(invmu(rpi/2))^2-1);
    if double(thet2_2(k))<0
        thet2_2(k)=thet2_2(k)+sym(2*pi);
    end
    diff2(k)   =  double(thet2_2(k)-sym(pi/2))
end
diff2.'
%%
p    = polyfit(1./r2,log10(diff2),1);
pval = 10.^(polyval(p,1./r2));
sum((log10(diff2)-polyval(p,1./r2)).^2)
%%
y = pi/2+10.^(p(2)+p(1)./r2.');
[double(thet2_2).'-y]
c1=p(1)
c2=10^p(2)
c2*10^(c1*1/12)
%%
figure
plot(1./r2,log10(diff2),'-b','LineWidth',1.5)
xlabel('{$1/r$}','FontSize',18,'Interpreter','latex');
ylabel('$\log_{10}(\theta_2-\pi/2)$','FontSize',18,'Interpreter','latex');
set(gca,'XTick',[ 1,5,10:10:50],'FontSize',18);
set(gca,'YTick',[-70:10:0],'FontSize',18);
axis([1 50 -70 1])
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
set(gca,'LooseInset',get(gca,'TightInset'))
print -depsc fig_quad_thet2_r_sym2
%%