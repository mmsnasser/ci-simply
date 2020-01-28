function  y   =   sqrta (z,alpha)
%This function compute the function sqrt(z) where the branch cut is along
%the +ve real line
%%
%first we compute arg(z) using MATLAB function angle(z)
thet  =  angle(z);
% we make sure that 0<=thet<2*pi
thet(thet<alpha)=thet(thet<alpha)+2*pi;
thet(thet>=alpha+2*pi)=thet(thet>=alpha+2*pi)-2*pi;
% then we compute sqrt(z)
y  =  sqrt(abs(z)).*exp(i.*thet./2);
%%
end