function [u,state] = cruise_control(vRef,v,dt,state,p)
%CRUISE_CONTROL Generic PI cruise controller with saturation.

if ~isfield(state,'integral')
    state.integral = 0;
end

e = vRef-v;
uUnsat = p.Kp*e + p.Ki*state.integral;
u = min(max(uUnsat,p.uMin),p.uMax);

if isfield(p,'Kaw')
    state.integral = state.integral + dt*(e + p.Kaw*(u-uUnsat));
else
    state.integral = state.integral + dt*e;
end
end
