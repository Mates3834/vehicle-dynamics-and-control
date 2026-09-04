function Mz = conventional_yaw_control(rRef,r,p)
%CONVENTIONAL_YAW_CONTROL Proportional yaw-rate feedback.

e = rRef-r;
Mz = p.Kr*e;
Mz = min(max(Mz,p.MzMin),p.MzMax);
end
