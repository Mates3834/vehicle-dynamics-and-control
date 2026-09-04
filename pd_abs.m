function [Tb,state] = pd_abs(lambda,dt,state,p)
%PD_ABS Generic PD slip controller.

if ~isfield(state,'prevError')
    state.prevError = 0;
end

e = p.lambdaRef - lambda;
de = (e-state.prevError)/dt;

TbUnsat = p.bias + p.Kp*e + p.Kd*de;
Tb = min(max(TbUnsat,p.Tmin),p.Tmax);

state.prevError = e;
end
