clear all;
clc;

a0=[-0.5,0.5,-0.5];
[x,fval]=fsolve(@TripleFunc_Peer,a0);

fprintf('x = %f %f %f', x);
fprintf('\nfval = %g %g %g\n', fval)

a1=[0.5,0.5,0.5];
[x1,fval1]=fsolve(@TripleFunc_Peer,a1);

fprintf('\nx1 = %f %f %f', x1);
fprintf('\nfval1 = %g %g %g\n', fval1);