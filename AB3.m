function [y,t] = AB3(fun,y0,T,DT,IOSTEP)
% This function computes the solution to the ODE system
% 
%       dy/dt=f(y,t),  y(0)=y0
%
% with the three-step Adam-Bashforth method
% Input:
%       fun    -> function handle representing f(y,t)
%       y0     -> column vector representing the initial condition 
%       DT     -> time step
%       T      -> period of integration
%       IOSTEP -> input/output steps (the solution vector is saved 
%                 in the output matrix every IOSTEP steps
%
% Output:
%       y -> matrix with solution snapshots columnwise
%       t -> vector of times at which we output the solution
%
% Definition of NSTEPS = floor(T/DT);

% Initialize value
y  = y0;
t0 = 0;
t  = 0;
NSTEPS = floor(T/DT);


% Startup step for AB3 (with Heun)
y1 = y0 + DT/2*( fun(y0+DT*fun(y0,t0), t0+DT) + fun(y0,t0));
t1 = t0 + DT;

y2 = y1 + DT/2*( fun(y1+DT*fun(y1,t1), t1+DT) + fun(y1,t1));
t2 = t1 + DT;

% Interate through every step
for i=2:NSTEPS
    y3 = y2 + DT/12*(23*fun(y2,t2)- 16*fun(y1,t1)+ 5*fun(y0,t0));
    t3 = t2 + DT;
    
    y0 = y1;
    t0 = t1;
    
    y1 = y2;
    t1 = t2;
    
    y2 = y3;
    t2 = t3;
    
    if mod(i,IOSTEP)==0
        y = [y y3];
        t = [t t3];
    end
end