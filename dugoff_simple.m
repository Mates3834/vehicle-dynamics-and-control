function [Fx,Fy] = dugoff_simple(kappa,alpha,Fz,p)
%DUGOFF_SIMPLE Simplified combined-slip Dugoff tire model.
%
% Inputs:
%   kappa : longitudinal slip ratio
%   alpha : slip angle [rad]
%   Fz    : normal load [N]
%
% Parameters:
%   Cx    longitudinal stiffness
%   Cy    lateral stiffness
%   mu    friction coefficient

Cx = p.Cx;
Cy = p.Cy;
mu = p.mu;

sx = Cx .* kappa;
sy = Cy .* tan(alpha);

den = 2 .* sqrt(sx.^2 + sy.^2) + eps;
lambda = mu .* Fz .* (1 + kappa) ./ den;

f = ones(size(lambda));
idx = lambda < 1;
f(idx) = lambda(idx) .* (2 - lambda(idx));

Fx = sx ./ (1 + kappa + eps) .* f;
Fy = -sy ./ (1 + kappa + eps) .* f;
end
