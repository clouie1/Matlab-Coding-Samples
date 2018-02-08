function test_integration()
% This function returns the following items:
% 1. A plot of the integrand function in figure (1)
% 2. A plot of the errors (using midpoint, trapezoid, and simpson rule)
% where I = 1.6851344770476 is the reference value for the integral
% in figure (2)

% Initialize values
a = -3;
b = 1;
I = 1.6851344770476;
N = 2:10000;

%Define fun
fun=@(x) ((1./(1+x.^2)).*cos(1.5*exp(-x.^2)))-((x.^3)./30);

% Use functions to compute the numerical approximation of integral
for n=N
    [I_mid] = int_midpoint_rule(fun,a,b,n);
    err_mid(n) = abs(I-I_mid);
    
    [I_trap] = int_trapezoidal_rule(fun,a,b,n);
    err_trap(n) = abs(I-I_trap);
    
    [I_simp] = int_Simpson_rule(fun,a,b,n);
    err_simp(n) = abs(I-I_simp);
end

% Plot of integrand function
x=linspace(-3,1,1000);
figure(1)
clf
plot(x,fun(x),'b-')

%Plot of errors
figure(2)
clf
loglog(N,err_mid(N),'r-');
hold
loglog(N,err_trap(N),'b-');
loglog(N,err_simp(N),'k-');

% Modify plot to look nice
grid
legend('Midpoint','Trapezoid','Simpson');
title('Plot of the errors versus n');
xlabel('$n$','Interpreter','Latex')
ylabel('$|I-I_{n}|$','Interpreter','Latex')
set(gca,'Fontsize',13)

end