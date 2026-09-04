function [uComp,state] = dob_yaw_control(y,uNom,dt,state,p)
%DOB_YAW_CONTROL Educational first-order disturbance observer.
%
% Assumed nominal output model:
%   ydot = a*y + b*(u + d)
%
% A low-pass filtered disturbance estimate is used for compensation.

if ~isfield(state,'yPrev')
    state.yPrev = y;
end
if ~isfield(state,'dHat')
    state.dHat = 0;
end

ydot = (y-state.yPrev)/dt;
dRaw = (ydot - p.a*y)/p.b - uNom;

alpha = dt/(p.tau+dt);
state.dHat = state.dHat + alpha*(dRaw-state.dHat);

uComp = uNom - state.dHat;
state.yPrev = y;
end
