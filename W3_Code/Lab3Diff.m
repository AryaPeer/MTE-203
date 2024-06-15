clc;
clear all;

%initial val and var decleration
syms a b x y

subA = 2;
subB = 3;
subX = 1;
subY = -2;

% original f(a,b,x,y)
f = (a * ((y * sin(x^2 * y^2)) / (exp(x^2 * y^3) + ((7 + y^2)/(x * y))))) + b * x^2 * y^2;

% Differentiating to get f_x
f_x = diff(f, x);

% Differentiating to get f_y
f_y = diff(f, y);

% Differentiating f_x to get f_xy
f_xy = diff(f_x, y);

% Differentiating f_y to get f_yx
f_yx = diff(f_y, x);



% Sub values of subA subB subX and subY into the f_x equations and map them
% to the their according symbols in the equation
evalf_x = subs(f_x, {a, b, x, y}, {subA, subB, subX, subY});
evalf_y = subs(f_y, {a, b, x, y}, {subA, subB, subX, subY});
evalf_xy = subs(f_xy, {a, b, x, y}, {subA, subB, subX, subY});
evalf_yx = subs(f_yx, {a, b, x, y}, {subA, subB, subX, subY});

fprintf('f_x Equation:')
disp(f_x)
fprintf('f_y Equation:')
disp(f_y)
fprintf('f_xy Equation:')
disp(f_xy)
fprintf('f_yx Equation:')
disp(f_yx)

fprintf('f_x Evaluation:')
disp(evalf_x)
fprintf('f_y Evaluation:')
disp(evalf_y)
fprintf('f_xy Evaluation:')
disp(evalf_xy)
fprintf('f_yx Evaluation:')
disp(evalf_yx)