clear
%%
% First, choose the vertices of the polygon and a point alpha inside the
% ploygon. 
% Then, you run 
% >> PolgDomain(vert,alpha);
% Then, you compute the hyperpolic distance between any two points inside
% the polygon.
% Please note that you need to run >> PolgDomain(vert,alpha); only once,
% then you can run HypDistance(0,4) for any two points in the polygon as
% many times as you wish without runing >> PolgDomain(vert,alpha); Only if
% you change the polygon, then you need to run >> PolgDomain(vert,alpha);
% again
z1        =  0;  %choose the point z_1 inside the polygon
alpha     =  0;
%%
n      =   2^12;
t      =  (0:2*pi/n:2*pi-2*pi/n).';
[s,sp] =   deltw(t,4,3);
cent   =  [1;i;-1;-i];
for j=1:4
    sv{j}  =  s((j-1)*n/4+1:j*n/4);
end
eto = []; etopo = [];
for j=1:4
    et((j-1)*n/4+1:j*n/4,1)  = cent(j)+exp(2i.*(sv{j}-j*pi/4));
    etp((j-1)*n/4+1:j*n/4,1) = exp(2i.*(sv{j}-j*pi/4)).*(2i.*sp((j-1)*n/4+1:j*n/4));
end
%%


%%
x     = linspace(-1.9999,1.9999,10000);
%%
dis_x = hypdist (et,etp,n,alpha,z1,x);
%%
save('x_quad_arc_2_pt.mat', 'x', '-ascii', '-double')
save('d_quad_arc_2_pt.mat', 'dis_x', '-ascii', '-double')
%%
figure
hold on
box on
plot(x,dis_x,'b');
% axis equal
% axis([0 2 0 2.0])
set(gca,'LooseInset',get(gca,'TightInset'))
% set(gca,'XTick',[-2:1:2],'FontSize',18);
% set(gca,'YTick',[-2:1:2]);
set(gca,'LooseInset',get(gca,'TightInset'))
% print -depsc -r500  hyp_dist_quad1.eps
% print -dpdf  -r500  hyp_dist_quad1.pdf
%%