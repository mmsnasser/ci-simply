function y = theta(kind, z , q , tol)
%THETA 	computes the theta functions
nmax = ceil(log(tol)/log(q));
s=0;
if ( kind == 1)
for j=0:nmax
s =s+exp(j*log(-1))*exp(((j+0.5).^2).*log(q)).*sin((2*j+1)*z);
end;
 s = 2*s;
end;
if ( kind == 2)
   for j=0:nmax
     s =s+exp(((j+0.5).^2).*log(q)).*cos((2*j+1)*z);
   end;
   s = 2*s;
end;
if ( kind == 3)
   for j=1:nmax
     s =s+exp(((j).^2).*log(q)).*cos((2*j)*z);
   end;
   s = 1+2*s;
end;
if ( kind == 4)
   for j=1:nmax
     s =s+exp(j*log(-1))*exp(((j).^2).*log(q)).*cos((2*j)*z);
   end;
   s = 1+2*s;
end;
y = s;
if ((any(any(imag(z))) == 0) & (any(any(imag(q)))==0) & ...
    (sum(sum( real(q) <0)) == 0))
   y = real(y);
end;
end