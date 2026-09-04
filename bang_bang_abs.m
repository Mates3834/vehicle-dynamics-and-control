function Tb = bang_bang_abs(lambda,p)
%BANG_BANG_ABS Simple slip-threshold ABS controller.

if lambda > p.lambdaHigh
    Tb = p.Tlow;
elseif lambda < p.lambdaLow
    Tb = p.Thigh;
else
    Tb = p.Thold;
end
end
