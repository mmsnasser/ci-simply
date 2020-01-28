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
z1        =  4+5i;  %choose the point z_1 inside the polygon
alpha     =  3+3i;
%%
%
% parametrization of the boundary 
ver    = [ 1    3     5  8+3i  6+5i  2+5i -1+2i];
cent   = [ 2-i  4-2i  8  6+3i  4+4i  2+2i -1]; 
Lv     =  length(ver);   
ns     =   2^10;
n      =   Lv*ns;
% compute the capacity of the domain G
t          =  (0:2*pi/n:2*pi-2*pi/n).';
[s,sp]     =   deltw(t,2*Lv,3);
% parametrization the circular arc polygon
ver(Lv+1)=ver(1);
for k=1:Lv
    aa        = ver(k);  bb = ver(k+1);
    ang{k}    = carg([aa-cent(k),bb-cent(k)]);
    rd(k)     = abs(aa-cent(k));
end
for k=1:Lv
    alp(k)=ang{k}(1);
    bet(k)=ang{k}(2);
end
for k=1:Lv
    thet  =  (Lv*(bet(k)-alp(k))/(2*pi)).*s( 1+(k-1)*n/Lv:k*n/Lv)+k*alp(k)-(k-1)*bet(k);
    thetp =  (Lv*(bet(k)-alp(k))/(2*pi)).*sp(1+(k-1)*n/Lv:k*n/Lv);
    et (1+(k-1)*n/Lv:k*n/Lv,1) =   cent(k)+rd(k).*exp(i.*thet);
    etp(1+(k-1)*n/Lv:k*n/Lv,1) =            rd(k).*exp(i.*thet).*(i.*thetp);
end
%
figure
hold on
box on
crv   =  et;  
plot(real(crv),imag(crv),'k');
plot(real(z1),imag(z1),'ob','MarkerFaceColor','b')
plot(real(cent),imag(cent),'pr','MarkerFaceColor','r')
axis equal
% axis([-2.2 2.2 -2.0 2.0])
%%
[x , y ] =   meshgrid(linspace(-2,8,1000),linspace(0,6.5,1000));
z        =   x+i.*y;
[mz,nz]  =   size(z);
z(abs(z-cent(1))<=rd(1)+1e-6) = NaN+i*NaN;
z(abs(z-cent(2))<=rd(2)+1e-6) = NaN+i*NaN;
z(abs(z-cent(3))<=rd(3)+1e-6) = NaN+i*NaN;
z(abs(z-cent(7))<=rd(7)+1e-6) = NaN+i*NaN;
z(abs(z-cent(4))>=rd(4)-1e-6 & abs(z-cent(5))>=rd(5)-1e-6 &...
  abs(z-cent(6))>=rd(6)-1e-6 & imag(z)> 1.5 ) = NaN+i*NaN;
%
z_ind    =   1;
for k=1:mz
    for j=1:nz
        if (abs(z(k,j))>=0)
            zv(z_ind)=z(k,j);
            z_ind  = z_ind+1;
        end
    end
end
figure
plot(real(z),imag(z),'.r')
hold on
box on
crv   =  et;  
plot(real(crv),imag(crv),'k');
plot(real(z1),imag(z1),'ob','MarkerFaceColor','b')
plot(real(cent),imag(cent),'pk','MarkerFaceColor','k')
axis equal
%%

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
vcont  = [0,0.3,0.6,1,1.5,2,2.5,3,4,5,6];
figure;
hold on
contourf(real(z),imag(z),disz,vcont)
colormap jet
map = 0.8.*colormap+0.2.*ones(size(colormap));
brighten(map,0.4)
caxis([0 7])
colorbar 
% vcont  = [0.2,0.5,1,1.5,2,2.5,3,4,5,5.5]; %level values
% % vcont  = [0.2,0.5,1,1.5,2,3,4,5]; %level values
% [cnt1,cnt2] =  contour(real(z),imag(z),disz,vcont,'b');
% % clabel(cnt1, 'manual','FontSize',15,'Color','k')
% clabel(cnt1,'FontSize',15,'Color','k')
crv   =  et;crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'k');
plot(real(z1),imag(z1),'ok','MarkerFaceColor','k')
box on
axis equal
axis([-1.1 8.1 -0.2 6.3])
set(gca,'LooseInset',get(gca,'TightInset'))
set(gca,'XTick',[-1:1:8],'FontSize',18);
set(gca,'YTick',[0:1:6]);
set(gca,'LooseInset',get(gca,'TightInset'))
set(gcf,'Renderer','zbuffer')
% print -depsc -r300  hyp_dist_hyp1.eps
% print -dpdf  -r300  hyp_dist_hyp1.pdf
print -depsc -r500  hyp_dist_hyp1.eps
print -dpdf  -r500  hyp_dist_hyp1.pdf
%%