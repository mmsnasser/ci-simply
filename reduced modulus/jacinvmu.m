function y = jacinvmu(x)
 y = (theta(2,0,exp(-2*x),1e-14)./theta(3,0,exp(-2*x),1e-14)).^2;
end