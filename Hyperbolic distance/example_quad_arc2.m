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
[x , y ] =   meshgrid(linspace(-1.999,1.999,1000),linspace(-1.999,1.999,1000));
z        =   x+i.*y;
[mz,nz]  =   size(z);
z(abs(z-1)>=1 & real(z)>=+1) = NaN+i*NaN;
z(abs(z-i)>=1 & imag(z)>=+1) = NaN+i*NaN;
z(abs(z+1)>=1 & real(z)<=-1) = NaN+i*NaN;
z(abs(z+i)>=1 & imag(z)<=-1) = NaN+i*NaN;
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
% vcont  = [0.5,1,1.5,2,2.5,3,3.5,4,5,6,8]; %level values
vcont  = [0,0.3,0.6,1,1.5,2,3,4,5]; %level values
figure
hold on
box on
contourf(real(z),imag(z),disz,vcont)
colormap jet
map = 0.8.*colormap+0.2.*ones(size(colormap));
brighten(map,0.4)
caxis([0 7])
colorbar 
% [cnt1,cnt2] =  contour(real(z),imag(z),disz,vcont,'b');
% % clabel(cnt1, 'manual','FontSize',15,'Color','k')
% clabel(cnt1,cnt2,'FontSize',15,'Color','k')
crv   =  et;crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'k');
plot(real(z1),imag(z1),'ok','MarkerFaceColor','k')
axis equal
axis([-2.2 2.2 -2.0 2.0])
set(gca,'LooseInset',get(gca,'TightInset'))
set(gca,'XTick',[-2:1:2],'FontSize',18);
set(gca,'YTick',[-2:1:2]);
set(gca,'LooseInset',get(gca,'TightInset'))
set(gcf,'Renderer','zbuffer')
print -depsc -r300  hyp_dist_quad2.eps
print -dpdf  -r300  hyp_dist_quad2.pdf
%%