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
%%
vert      = [6+i,1+i,1+4i,-1+4i,-1-i,6-i]; % Vertices of the polygon
nvert     =  length(vert);
ns        =  2^9;
n         =  nvert*ns;
[et,etp]  =  polygonp(vert,ns); 
%%

%%
z1       =  2i;  %choose the point z_1 inside the polygon
alpha    =  0;
z2       =  1:5;
dis      =  hypdist (et,etp,n,alpha,z1,z2);
[z2.' dis.']
%%
z1       =  2;  %choose the point z_1 inside the polygon
alpha    =  0;
z2       =  i.*[0:3];
dis      =  hypdist (et,etp,n,alpha,z1,z2);
[z2.' dis.']
%%