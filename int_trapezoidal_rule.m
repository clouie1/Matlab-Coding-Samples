function [I] = int_trapezoidal_rule(fun,a,b,n)
% This function implement the composite trapezoidal rule
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

I =0;
for k=1:n-1
    I = I + (0.5*h*(fun(x(k+1))+fun(x(k))));
end