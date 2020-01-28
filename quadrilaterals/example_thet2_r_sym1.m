clc
clear all
%
addpath map
%%
r1 = 1:50;
for k=1:length(r1)
    rpi = sym(r1(k))*sym(pi);
    thet2_1(k) =  2*acot(2*(invmu(rpi/2))^2-1);
    if double(thet2_1(k))<0
        thet2_1(k)=thet2_1(k)+sym(2*pi);
    end
    diff1(k)   =  double(sym(3*pi/2)-thet2_1(k));
end
diff1.'
%%
p    = polyfit(r1,log10(diff1),1);
pval = 10.^(polyval(p,r1));

sum((log10(diff1)-polyval(p,r1)).^2)
y = 3*pi/2-10^(p(2)).*10.^(p(1).*r1.');
% [double(thet2_1).'-y]
c1=p(1)
c0=10^p(2)
c0*10^(c1*12)
%%
figure
plot(r1,log10(diff1),'-b','LineWidth',1.5)
xlabel('{$r$}','FontSize',18,'Interpreter','latex');
ylabel('$\log_{10}(3\pi/2-\theta_2)$','FontSize',18,'Interpreter','latex');
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
print -depsc fig_quad_thet2_r_sym1
% print -dpdf fig_BC_E2c_err
%%

