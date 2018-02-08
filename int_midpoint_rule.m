function [I] = int_midpoint_rule(fun,a,b,n)
% This function implement the composite midpoint rule
%
% Input:
%       fun -> function handle representing f(x)
%       a,b -> endpoints of the integration interval 
%       n   -> number of evenly-spaced points in [a,b] (including
%       endpoints)
%
% Ouput:
%       I -> numerical approximation of the integral.
%

%Define h and evenly-spaced points in [a,b]
h = (b-a)/(n-1);
for j=1:n
    x(j)=a+(j-1)*h;
end

Sum=0;
for k=1:n-1
    xbar = 0.5*(x(k+1)+x(k));
    Sum = Sum + fun(xbar);
end

I = h*Sum;

end
