function out = dugoff_combined(kappa,alpha,Fz,p)
%DUGOFF_COMBINED Convenience wrapper returning tire-force structure.

[Fx,Fy] = dugoff_simple(kappa,alpha,Fz,p);

out.Fx = Fx;
out.Fy = Fy;
out.forceMagnitude = hypot(Fx,Fy);
end
