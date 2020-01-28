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
z1        =  2;  %choose the point z_1 inside the polygon
% z1        =  -1+1i;  %choose the point z_1 inside the polygon
alpha     =  0.5+0.5i;
%%
n     =  2^12;
t     = (0:2*pi/n:2*pi-2*pi/n).';
s1    =  sin(t);
s2    =  sin(2.*t);
s4    =  sin(4.*t);
c1    =  cos(t);
c2    =  cos(2.*t);
es    =  exp(sin(t));
ec    =  exp(cos(t));
%R     =  exp(cos(s)).*((cos(2.*s)).^2)+exp(sin(s)).*((sin(2.*s)).^2);
R     =  ec.*c2.^2+es.*s2.^2;
Rp    = -s1.*c2.^2.*ec+c1.*s2.^2.*es+2.*s4.*(es-ec);
et    =   R.*exp(i.*t);
etp   =  (Rp+i.*R).*exp(i.*t);
%%

%%
[x , y ] =   meshgrid(linspace(-1.5,2.8,1000),linspace(-1.2,2,1000));
z        =   x+i.*y;
[mz,nz]  = size(z);
sum(sum(abs(z)>=0))
dis  =  1e-2;

node  =  [real(et)  imag(et)];
for j=1:nz
    point = [real(z(:,j)) imag(z(:,j))];
    in(:,j) = inpoly(point,node);
    z(~in) = NaN+i*NaN;
end
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
vcont  = [0.5,1,1.5,2,2.5,3,4,5,6,7,8,10]; %level values
figure
hold on
box on
[cnt1,cnt2] =  contour(real(z),imag(z),disz,vcont,'b');
clabel(cnt1, 'manual','FontSize',15,'Color','k')
% clabel(cnt1,cnt2','FontSize',15,'Color','k')
crv   =  et;crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'k');
plot(real(z1),imag(z1),'ob','MarkerFaceColor','b')
% plot(real(alpha),imag(alpha),'ok','MarkerFaceColor','b')
axis equal
axis([-1.5 2.8 -1.2 2.0])
set(gca,'LooseInset',get(gca,'TightInset'))
set(gca,'XTick',[-1:1:6],'FontSize',18);
set(gca,'YTick',[-1:1:4]);
set(gca,'LooseInset',get(gca,'TightInset'))
print -depsc hyp_dist_s1
print -dpdf  hyp_dist_s1
%%