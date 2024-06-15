clc;
clear all;

syms t

% Create scalar and vector functions
g = 3*t^2 - 5*t;
u = [t, -3*t^2, t];
v = [1, -t, 3*t^2];

% Compute the integrand
integrand = 4*g*(u+v);

% output integrand
fprintf('Intergrand = ')
disp(expand(integrand))

% integrate integrand against t
F = int(integrand, t);

% display integrand 
fprintf('F(t) = ');
disp(F);