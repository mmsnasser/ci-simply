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
z1        =  2i;  %choose the point z_1 inside the polygon
% z1        =  2;  %choose the point z_1 inside the polygon
vert      = [6+i,1+i,1+4i,-1+4i,-1-i,6-i]; % Vertices of the polygon
alpha     =  0;
%%
nvert     =  length(vert);
ns        =  2^9;
n         =  nvert*ns;
[et,etp]  =  polygonp(vert,ns); 
%%


%%
[x , y ] =   meshgrid(linspace(-0.999,5.999,1000),linspace(-0.999,3.999,1000));
z        =   x+i.*y;
[mz,nz]  =   size(z);
z(real(z)>=1 & imag(z)>=1) = NaN+i*NaN;
z_ind    =   1;
for k=1:mz
    for j=1:nz
        if (abs(z(k,j))>=0)
            zv(z_ind)=z(k,j);
            z_ind  = z_ind+1;
        end
    end
end
%%
dis = hypdist (et,etp,n,alpha,z1,zv);
%%
z_ind    =   1;
for k=1:mz
    for j=1:nz
        if (abs(z(k,j))>=0)
            disz(k,j) = dis(z_ind);
            z_ind  = z_ind+1;
        else
            disz(k,j) = NaN;
        end
    end
end
%%
vcont  = [0,0.5,1,1.5,2,2.5,3,4,5,6,8,10]; %level values
figure;
hold on
box on
contourf(real(z),imag(z),disz,vcont)
colormap jet
map = 0.8.*colormap+0.2.*ones(size(colormap));
brighten(map,0.4)
caxis([0 10])
colorbar 
crv   =  et;crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'k');
plot(real(z1),imag(z1),'ok','MarkerFaceColor','k')
axis equal
set(gca,'XTick',[-1:1:6],'FontSize',18);
set(gca,'YTick',[-1:1:4]);
set(gca,'LooseInset',get(gca,'TightInset'))
axis([-1.2 6.2 -1.2 4.2])
set(gcf,'Renderer','opengl')
print -depsc -r500  hyp_dist_L1.eps
%%