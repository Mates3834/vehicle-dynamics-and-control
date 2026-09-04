function dx = quarter_car_model(~,x,Tb,p)
%QUARTER_CAR_MODEL Generic longitudinal quarter-car braking model.
%
% States:
%   x = [v; omega]
%
% Input:
%   Tb = brake torque [N m]

v = max(x(1),0);
omega = max(x(2),0);

m = p.m;
J = p.J;
R = p.R;
Fz = p.Fz;

lambda = (v - R*omega) / max(v,0.5);
lambda = min(max(lambda,0),1);

mu = p.c1*(1-exp(-p.c2*lambda)) - p.c3*lambda;
Fx = mu*Fz;

vdot = -Fx/m;
omegadot = (R*Fx - Tb)/J;

dx = [vdot;omegadot];
end
