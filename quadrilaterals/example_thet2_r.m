clc
clear all
%
addpath map
%%
thet2_1 =  [pi/2+1e-15,pi/2+1e-14,pi/2+1e-13,pi/2+1e-12,pi/2+1e-11,...
            pi/2+0.8e-10,pi/2+0.6e-10,pi/2+0.4e-10,pi/2+0.2e-10,...
            linspace(pi/2+1e-10,pi/2+0.009,50),...
            linspace(pi/2+0.01,3*pi/2-0.01,200),...
            linspace(3*pi/2-0.011,3*pi/2-1e-10,50),...
            3*pi/2-0.8e-10,3*pi/2-0.6e-10,3*pi/2-0.4e-10,3*pi/2-0.2e-10,...
            3*pi/2-1e-11,3*pi/2-1e-12,3*pi/2-1e-13,3*pi/2-1e-14,3*pi/2-1e-15];
for k=1:length(thet2_1)
    r_1(k) =  (2/pi)*mu(sqrt((1+cot(thet2_1(k)/2))/2));
end
%
%%
figure
plot(thet2_1,r_1,'-b','LineWidth',1.5)
xlabel('{$\theta_2$}','FontSize',18,'Interpreter','latex');
ylabel('$r$','FontSize',18,'Interpreter','latex');
set(gca,'XTick',[pi/2 pi 3*pi/2],'XTickLabel',{'\pi/2','\pi','3\pi/2'},'FontSize',18)
set(gca,'YTick',[0:5:100]);
axis([pi/2 3*pi/2 0 15])
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
set(gca,'LooseInset',get(gca,'TightInset'))
print -depsc fig_quad_thet2_r_1
% print -dpdf fig_BC_E2c_err
%%
r_2 = linspace(1/12,12,1000);
for k=1:length(r_2)
    tst(k) = 2*(invmu(r_2(k)*pi/2))^2-1;
    thet2_2(k) =  2*acot(2*(invmu(r_2(k)*pi/2))^2-1);
end
thet2_2(thet2_2<0)=thet2_2(thet2_2<0)+2*pi;
%
thet2_2(1)-pi/2
thet2_2(end)-3*pi/2
%
figure
plot(r_2,thet2_2,'-b','LineWidth',1.5)
xlabel('{$r$}','FontSize',18,'Interpreter','latex');
ylabel('$\theta_2$','FontSize',18,'Interpreter','latex');
set(gca,'XTick',[0:2:12]);
set(gca,'YTick',[pi/2 pi 3*pi/2],'YTickLabel',{'\pi/2','\pi','3\pi/2'},'FontSize',18)
axis([0 12 pi/2 3*pi/2])
grid(gca,'minor')
grid on
set(gca, 'XMinorTick','on')
set(gca, 'YMinorTick','on')
ax=gca;
ax.GridAlpha=0.75;
ax.MinorGridAlpha=0.75;
set(gca,'LooseInset',get(gca,'TightInset'))
print -depsc fig_quad_thet2_r_2
% print -dpdf fig_BC_E2c_err
%%
