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
vert      = [6+i,1+i,1+4i,-1+4i,-1-i,6-i]; % Vertices of the polygon
alpha     =  0;
%%
nvert     =  length(vert);
ns        =  2^8;
n         =  nvert*ns;
[et,etp]  =  polygonp(vert,ns); 
%%


%%
[x , y ] =   meshgrid(linspace(-0.999,5.999,5000),linspace(-0.999,3.999,5000));
z        =   x+i.*y;
[mz,nz]  =   size(z);
z(real(z)>=1 & imag(z)>=1) = NaN+i*NaN;
zv       =  z(abs(z)>=0).';
Lz = length(zv)
%%
figure;
hold on
box on
crv   =  et;crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'k');
plot(real(zv),imag(zv),'.r','MarkerFaceColor','k')
plot(real(z1),imag(z1),'ok','MarkerFaceColor','k')
axis equal
axis([-1.2 6.2 -1.2 4.2])
%%
dis(1:Lz/2)    = hypdist (et,etp,n,alpha,z1,zv(1:Lz/2));
dis(Lz/2+1:Lz) = hypdist (et,etp,n,alpha,z1,zv(Lz/2+1:Lz));
% dis    = hypdist (et,etp,n,alpha,z1,zv);
%%
vert_d   = vert;vert_d(2)=[];vert_d(4)=[];
%%
r1       = 1;
z_Lv_r1  = zv;
z_Lv_r1(abs(dis-r1)>1e-4) = [];
%
figure;
hold on
box on
crv   =  et;crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'k');
plot(real(z_Lv_r1),imag(z_Lv_r1),'.r','MarkerFaceColor','k')
plot(real(z1),imag(z1),'ok','MarkerFaceColor','k')
axis equal
axis([-1.2 6.2 -1.2 4.2])
%
for k=1:length(vert_d)
    dis_r1(k) = min(abs(vert_d(k)-z_Lv_r1));
end
%
hd_r1 = max(dis_r1)
%%
r2       = 2;
z_Lv_r2  = zv;
z_Lv_r2(abs(dis-r2)>1e-4) = [];
%
figure;
hold on
box on
crv   =  et;crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'k');
plot(real(z_Lv_r2),imag(z_Lv_r2),'.r','MarkerFaceColor','k')
plot(real(z1),imag(z1),'ok','MarkerFaceColor','k')
axis equal
axis([-1.2 6.2 -1.2 4.2])
%
for k=1:length(vert_d)
        dis_r2(k) = min(abs(vert_d(k)-z_Lv_r2));
end
%
hd_r2 = max(dis_r2)
%%
r3       = 3;
z_Lv_r3  = zv;
z_Lv_r3(abs(dis-r3)>1e-4) = [];
%
figure;
hold on
box on
crv   =  et;crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'k');
plot(real(z_Lv_r3),imag(z_Lv_r3),'.r','MarkerFaceColor','k')
plot(real(z1),imag(z1),'ok','MarkerFaceColor','k')
axis equal
axis([-1.2 6.2 -1.2 4.2])
%
for k=1:length(vert_d)
        dis_r3(k) = min(abs(vert_d(k)-z_Lv_r3));
end
%
hd_r3 = max(dis_r3)
%%
r4       = 4;
z_Lv_r4  = zv;
z_Lv_r4(abs(dis-r4)>1e-4) = [];
%
figure;
hold on
box on
crv   =  et;crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'k');
plot(real(z_Lv_r4),imag(z_Lv_r4),'.r','MarkerFaceColor','k')
plot(real(z1),imag(z1),'ok','MarkerFaceColor','k')
axis equal
axis([-1.2 6.2 -1.2 4.2])
%
for k=1:length(vert_d)
        dis_r4(k) = min(abs(vert_d(k)-z_Lv_r4));
end
%
hd_r4 = max(dis_r4)
%%
r5       = 5;
z_Lv_r5  = zv;
z_Lv_r5(abs(dis-r5)>1e-4) = [];
%
figure;
hold on
box on
crv   =  et;crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'k');
plot(real(z_Lv_r5),imag(z_Lv_r5),'.r','MarkerFaceColor','k')
plot(real(z1),imag(z1),'ok','MarkerFaceColor','k')
axis equal
axis([-1.2 6.2 -1.2 4.2])
%
for k=1:length(vert_d)
        dis_r5(k) = min(abs(vert_d(k)-z_Lv_r5));
end
%
hd_r5 = max(dis_r5)
%%
r6       = 6;
z_Lv_r6  = zv;
z_Lv_r6(abs(dis-r6)>1e-4) = [];
%
figure;
hold on
box on
crv   =  et;crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'k');
plot(real(z_Lv_r6),imag(z_Lv_r6),'.r','MarkerFaceColor','k')
plot(real(z1),imag(z1),'ok','MarkerFaceColor','k')
axis equal
axis([-1.2 6.2 -1.2 4.2])
%
for k=1:length(vert_d)
        dis_r6(k) = min(abs(vert_d(k)-z_Lv_r6));
end
%
hd_r6 = max(dis_r6)
%%
r7       = 7;
z_Lv_r7  = zv;
z_Lv_r7(abs(dis-r7)>1e-3) = [];
%
figure;
hold on
box on
crv   =  et;crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'k');
plot(real(z_Lv_r7),imag(z_Lv_r7),'.r','MarkerFaceColor','k')
plot(real(z1),imag(z1),'ok','MarkerFaceColor','k')
axis equal
axis([-1.2 6.2 -1.2 4.2])
%
for k=1:length(vert_d)
        dis_r7(k) = min(abs(vert_d(k)-z_Lv_r7));
end
%
hd_r7 = max(dis_r7)
%%
r8       = 8;
z_Lv_r8  = zv;
z_Lv_r8(abs(dis-r8)>1e-3) = [];
%
figure;
hold on
box on
crv   =  et;crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'k');
plot(real(z_Lv_r8),imag(z_Lv_r8),'.r','MarkerFaceColor','k')
plot(real(z1),imag(z1),'ok','MarkerFaceColor','k')
axis equal
axis([-1.2 6.2 -1.2 4.2])
%
for k=1:length(vert_d)
        dis_r8(k) = min(abs(vert_d(k)-z_Lv_r8));
end
%
hd_r8 = max(dis_r8)
%%
r9       = 9;
z_Lv_r9  = zv;
z_Lv_r9(abs(dis-r9)>1e-3) = [];
%
figure;
hold on
box on
crv   =  et;crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'k');
plot(real(z_Lv_r9),imag(z_Lv_r9),'.r','MarkerFaceColor','k')
plot(real(z1),imag(z1),'ok','MarkerFaceColor','k')
axis equal
axis([-1.2 6.2 -1.2 4.2])
%
for k=1:length(vert_d)
        dis_r9(k) = min(abs(vert_d(k)-z_Lv_r9));
end
%
hd_r9 = max(dis_r9)
%%
r10       = 10;
z_Lv_r10  = zv;
z_Lv_r10(abs(dis-r10)>1e-3) = [];
%
figure;
hold on
box on
crv   =  et;crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'k');
plot(real(z_Lv_r10),imag(z_Lv_r10),'.r','MarkerFaceColor','k')
plot(real(z1),imag(z1),'ok','MarkerFaceColor','k')
axis equal
axis([-1.2 6.2 -1.2 4.2])
%
for k=1:length(vert_d)
        dis_r10(k) = min(abs(vert_d(k)-z_Lv_r10));
end
%
hd_r10 = max(dis_r10)
%%
r11       = 11;
z_Lv_r11  = zv;
z_Lv_r11(abs(dis-r11)>1e-2) = [];
%
figure;
hold on
box on
crv   =  et;crv(n+1) = crv(1); 
plot(real(crv),imag(crv),'k');
plot(real(z_Lv_r11),imag(z_Lv_r11),'.r','MarkerFaceColor','k')
plot(real(z1),imag(z1),'ok','MarkerFaceColor','k')
axis equal
axis([-1.2 6.2 -1.2 4.2])
%
for k=1:length(vert_d)
        dis_r11(k) = min(abs(vert_d(k)-z_Lv_r11));
end
%
hd_r11 = max(dis_r11)
%%