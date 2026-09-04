function betaHat = sideslip_observer(vyHat,vx)
%SIDESLIP_OBSERVER Simple kinematic sideslip estimate.

betaHat = atan2(vyHat,max(vx,0.1));
end
