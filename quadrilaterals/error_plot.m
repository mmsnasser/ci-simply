clc
clear
%%
% Example 1
r_1       = 1;
itr_1     = 1;
time_1    = 0.6;
error_1   = [1.6081e-16];
%%
% Example 2
r_2     = 1.41421356237738;
itr_2   = 23;
time_2  = 6.5;
error_2   = [       
       2.0164
      0.89297
      0.53221
      0.18626
    0.0023936
   0.00022112
   2.0116e-05
   1.6462e-05
   1.3471e-05
   1.2237e-06
   1.1114e-07
   9.0955e-08
   7.4432e-08
   6.7605e-09
   6.1403e-10
   5.0248e-10
   4.1121e-10
   3.7346e-11
   3.3845e-12
   2.7662e-12
     2.26e-12
   2.0655e-13
    2.392e-14
    ];
%%
% Example 3
r_3     = 4.99266938932358;
itr_3   = 36;
time_3  = 10.4;
error_3   = [       
       3.1353
       3.1314
       3.1219
       3.1005
        3.026
       2.7378
       1.7884
      0.40843
      0.18077
     0.086292
     0.041723
     0.019875
    0.0090438
    0.0036892
    0.0011182
   5.7801e-05
   3.5495e-05
   2.1469e-05
   4.1324e-06
   8.0631e-07
    4.907e-07
   2.9856e-07
   5.8431e-08
   1.1437e-08
   6.9597e-09
   4.2349e-09
   8.2898e-10
   1.6226e-10
   9.8731e-11
   6.0072e-11
   1.1765e-11
    2.309e-12
   1.4047e-12
   8.5443e-13
   1.5743e-13
   4.2632e-14
   ];
%%
% Example 4
r_4     = 0.272437506734334;
itr_4   = 40;
time_4  = 12.1;
error_4   = [       
       1.5705
       1.5699
       1.5689
       1.5644
       1.5427
       1.3974
      0.16894
      0.90015
      0.89357
      0.36096
     0.053872
    0.0082859
    0.0056728
    0.0038802
   0.00061129
   9.6472e-05
   6.6013e-05
    4.517e-05
   7.1307e-06
   1.1257e-06
   7.7028e-07
   5.2707e-07
   8.3208e-08
   1.3136e-08
   8.9878e-09
   6.1491e-09
   9.7173e-10
   1.5222e-10
   1.0386e-10
   7.1537e-11
   1.0742e-11
   1.6301e-12
   8.7046e-13
    5.756e-13
   8.8535e-14
   2.8117e-13
   1.3938e-13
   2.9892e-13
   6.8685e-13
   2.2266e-14
   ];
%%
figure
hold on
box on
plot(1:length(error_2),log10(error_2),'-b','LineWidth',1);
plot(1:length(error_3),log10(error_3),'-r','LineWidth',1);
plot(1:length(error_4),log10(error_4),'-k','LineWidth',1);
set(gca,'XTick',[0:5:40],'FontSize',18);
set(gca,'YTick',[-13:2:1]);
axis([1 40 -13 1])
xlabel('$k$: the iteration number','FontSize',18,'Interpreter','latex');
ylabel('$\log_{10}$(Successive error)','FontSize',18,'Interpreter','latex');
legend({'$Q_2$','$Q_3$','$Q_4$'},'FontSize',18,'Interpreter','latex','Location','northeast');
% axis off
grid on
set(gca,'LooseInset',get(gca,'TightInset'))
print -depsc fig_qd_error
%%
