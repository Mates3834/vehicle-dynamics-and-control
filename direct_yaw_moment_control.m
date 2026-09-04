function Mz = direct_yaw_moment_control(rRef,r,beta,p)
%DIRECT_YAW_MOMENT_CONTROL Generic yaw-rate + sideslip feedback.

eR = rRef-r;
Mz = p.Kr*eR - p.Kbeta*beta;
Mz = min(max(Mz,p.MzMin),p.MzMax);
end
