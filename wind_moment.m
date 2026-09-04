function Mz = wind_moment(t,p)
%WIND_MOMENT Generic yaw-disturbance generator.
%
% Supported types:
%   'step'
%   'pulse'
%   'sine'

switch lower(p.type)
    case 'step'
        Mz = p.amplitude * double(t >= p.t0);

    case 'pulse'
        Mz = p.amplitude * double(t >= p.t0 && t <= p.t1);

    case 'sine'
        Mz = p.amplitude * sin(2*pi*p.frequency*t);

    otherwise
        error('Unknown disturbance type.');
end
end
