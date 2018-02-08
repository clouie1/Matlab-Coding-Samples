function solve_ODE_system()
% This function returns the following items:
% 1. The plots of the trajectories y1(t), y2(t), and y3(t) versus time
%    in figure 1
%
% 2. A three-dimensional plot of the curve (y1(t),y2(t),y3(t)) in 
%    figure 2. Such curve provides a visualization of the 
%    strange attractor.

%Initialize value
T = 1000;
DT = 1e-3;
IOSTEP = 50;
y0 = [1 2 3]';

[y,t] = AB3(@(y,t) F(y,t),y0,T,DT,IOSTEP)

% Plots of the trajectories y1(t), y2(t), and y3(t) versus time
figure(1)
clf
plot(t,y(1,:),'r') % Plot of trajectory y1(t)
hold
plot(t,y(2,:),'b') % Plot of trajectory y2(t)
plot(t,y(3,:),'k') % Plot of trajectory y3(t)
xlabel('Time')
title('Plot of Trajectories')
legend('y1(t)','y2(t)','y3(t)');

% Three-dimensional plot of the curve (y1(t),y2(t),y3(t))
figure(2)
clf
plot3(y(1,:),y(2,:),y(3,:),'k') %Plot of curve
grid
%Format plot
xlabel('y_1')
ylabel('y_2')
zlabel('y_3')
title('Visualization of Strange Attractor')




end

% Define function to use for AB3
function fun = F(y,t)
fun = zeros(3,1);
fun(1) = -y(1)+y(2)*y(3);
fun(2) = -y(2)+(y(3)-2)*y(1);
fun(3) = 1 - y(1)*y(2);
end