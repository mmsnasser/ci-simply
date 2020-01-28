clc
clear
%%
% Example 1
x1   = load('x_quad_arc_1_pt.mat','-ascii');
dis1 = load('d_quad_arc_1_pt.mat','-ascii');
%%
% Example 1
x2   = load('x_quad_arc_2_pt.mat','-ascii');
dis2 = load('d_quad_arc_2_pt.mat','-ascii');
%%
%%
figure
hold on
box on
plot(x1,dis1,'-b','LineWidth',1.5);
plot(x2,dis2,'-r','LineWidth',1.5);
set(gca,'XTick',[-2:0.5:2],'FontSize',18);
% set(gca,'YTick',[-13:2:1]);
% axis([1 40 -13 1])
xlabel('$x$','FontSize',18,'Interpreter','latex');
ylabel('$u(x,0)$','FontSize',18,'Interpreter','latex');
legend({'$z_1=1.5$','$z_1=0$'},'FontSize',18,'Interpreter','latex','Location','northeast');
% axis off
grid on
set(gca,'LooseInset',get(gca,'TightInset'))
print -depsc fig_qd_x
print -dpdf  fig_qd_x
%%
