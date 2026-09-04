function [A,B,C,D] = linear_bicycle_model(p,Vx)
%LINEAR_BICYCLE_MODEL Linear single-track lateral vehicle model.
%
% States:
%   x = [v_y; r]
%
% Input:
%   delta = front steering angle

m  = p.m;
Iz = p.Iz;
lf = p.lf;
lr = p.lr;
Cf = p.Cf;
Cr = p.Cr;

Vx = max(Vx,0.1);

A11 = -(Cf+Cr)/(m*Vx);
A12 = -Vx - (Cf*lf-Cr*lr)/(m*Vx);
A21 = -(Cf*lf-Cr*lr)/(Iz*Vx);
A22 = -(Cf*lf^2+Cr*lr^2)/(Iz*Vx);

A = [A11 A12;
     A21 A22];

B = [Cf/m;
     Cf*lf/Iz];

C = eye(2);
D = zeros(2,1);
end
