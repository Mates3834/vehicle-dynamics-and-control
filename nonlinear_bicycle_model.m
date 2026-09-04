function dx = nonlinear_bicycle_model(~,x,u,p)
%NONLINEAR_BICYCLE_MODEL Generic planar nonlinear bicycle model.
%
% States:
%   x = [X; Y; psi; vx; vy; r]
%
% Inputs:
%   u = [delta; Fx]
%
% Uses simple nonlinear slip-angle calculation with linear tire-force law.

X = x(1); %#ok<NASGU>
Y = x(2); %#ok<NASGU>
psi = x(3);
vx = max(x(4),0.1);
vy = x(5);
r = x(6);

delta = u(1);
Fx = u(2);

m  = p.m;
Iz = p.Iz;
lf = p.lf;
lr = p.lr;
Cf = p.Cf;
Cr = p.Cr;

alphaF = atan2(vy + lf*r, vx) - delta;
alphaR = atan2(vy - lr*r, vx);

Fyf = -Cf*alphaF;
Fyr = -Cr*alphaR;

Xdot = vx*cos(psi) - vy*sin(psi);
Ydot = vx*sin(psi) + vy*cos(psi);
psidot = r;

vxdot = (Fx - Fyf*sin(delta))/m + vy*r;
vydot = (Fyf*cos(delta) + Fyr)/m - vx*r;
rdot = (lf*Fyf*cos(delta) - lr*Fyr)/Iz;

dx = [Xdot;Ydot;psidot;vxdot;vydot;rdot];
end
