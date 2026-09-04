function Fy = linear_tire_model(alpha,Ca)
%LINEAR_TIRE_MODEL Generic linear lateral tire model.
%
%   Fy = -Ca * alpha
%
% alpha : slip angle [rad]
% Ca    : cornering stiffness [N/rad]

Fy = -Ca .* alpha;
end
