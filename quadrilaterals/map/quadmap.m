function   f = quadmap(verc,n,MaxItr,tol)
%
%
r      =  1;  Delta = 0; error = inf; 
itr    =  0;  delta=1;
while (error>tol)
    itr = itr+1;
    r = r+Delta;
    verr = [ 0 ; 1 ; 1+r*i ; r*i ];
    f    =  cirmap3p(verr,verc,n);
    zet  =  f.zet;
    et   =  f.et;
    %%
    vercn = [et(1) ;  et(n/4+1) ; et(2*n/4+1) ; et(3*n/4+1) ];
    sdr(itr) = angle(vercn(4)/verc(4));
    if itr>2 & sdr(itr)*sdr(itr-1)<0 & sdr(itr-1)*sdr(itr-2)<0
        delta=delta/2;
    end
    if itr>2 & sdr(itr)*sdr(itr-1)>0 & sdr(itr-1)*sdr(itr-2)>0
        delta=2*delta;
    end
    Delta=(angle(vercn(4)/verc(4))/(2*pi))*delta;
    if Delta>0.2*r
        Delta = 0.2*r; delta=delta/2;
    end
    if Delta<-0.2*r
        Delta=-0.2*r; delta=delta/2;
    end
    error = abs(angle(vercn(4)/verc(4)));
    [itr error]
    errork(itr,1) = error;
    if (itr>=MaxItr)
        disp(['The error of the iterative method is  ',...
               num2str(error),...
              ' Convegence failed after maximum iterations allowed'])          
        break;
    end   
%     if itr>50 & errork(itr)>errork(itr-1) & errork(itr-1)>errork(itr-2) & errork(itr-2)>errork(itr-3)
%         disp(['The iterative method truncated after  ',...
%             num2str(itr),'  iterations, with error  ',...
%             num2str(error)])
%         break;
%     end
    %%
end
r      =  r+Delta;
verr   = [0 ; 1 ; 1+r*i ; r*i ];
f      =  cirmap3p(verr,verc,n);
f.r    =  r;
f.err  =  errork;
f.itr  =  itr;
% 
% 
end