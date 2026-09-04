function Fy = magic_formula_tire(alpha,Fz,p)
%MAGIC_FORMULA_TIRE Simplified Pacejka-style lateral tire model.
%
% Fy = Fz*D*sin(C*atan(B*alpha - E*(B*alpha-atan(B*alpha))))

B = p.B;
C = p.C;
D = p.D;
E = p.E;

x = B .* alpha;
Fy = Fz .* D .* sin(C .* atan(x - E .* (x - atan(x))));
end
