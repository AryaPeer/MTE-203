clc;
clear all;

syms t;

r = [(2/3)*t, sqrt(2)*t, t^2 - (1/3)*t];
t=2;

drdt = diff(r);

% Arc length formula
s = int(norm(drdt));

% Curvature formula
k = (1/norm(drdt))*norm(diff(drdt/norm(drdt)));

% Radius of Curvature formula
p = 1/k;

% Tangential Acceleration formula
at = diff(norm(drdt),t);

% Normal Acceleration formula
an = k*norm(drdt)^2;

% magnitude of acceleration formula
magnitude_acc = sqrt(at^2+an^2);

% Values I used for the functiosn

fprintf('s(t):')
disp(s)

fprintf('k(t):')
disp(k)

fprintf('p(t):')
disp(p)

fprintf("at(t):")
disp(at)

fprintf("an(t):")
disp(an)

% Values I used for the evaluation of functions

fprintf('|a|:')
disp(double(subs(magnitude_acc)))

fprintf('s(t):')
disp(double(subs(s)))

fprintf('k(t):')
disp(double(subs(k)))

fprintf('p(t):')
disp(double(subs(p)))

fprintf("at(t):")
disp(double(subs(at)))

fprintf("an(t):")
disp(double(subs(an)))


% Plotting 

figure(Name='DRONE PATH INFO')

domain = [-3,3];

subplot(3,2,[1,2])
fplot3(r(1), r(2), r(3), domain);

title('Path')

legend('r(t)')

xlabel('X');
ylabel('Y');
zlabel('Z');

subplot(3,2,3)
fplot(s,domain);

title('arc length')

legend('s(t)')

xlabel('X');
ylabel('Y');
zlabel('Z');

subplot(3,2,4)
fplot(k,domain);

title('Curvature')

legend('k(t)')

xlabel('X');
ylabel('Y');
zlabel('Z');

subplot(3,2,5)
fplot(at,domain);

title('Tangential Accelerration')

legend('a_t(t)')

xlabel('X');
ylabel('Y');
zlabel('Z');

subplot(3,2,6)

fplot(an,domain);

title('Normal Acceleration')

legend('a_n(t)')

xlabel('X');
ylabel('Y');
zlabel('Z');