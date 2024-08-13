clc;
clear;

% Define constants
G = 6.67e-11; % Gravitational constant in Nm^2/kg^2
M = 1.989e39; % Mass of the black hole in kg
m = 15e6; % Mass of the Endurance Spaceship in kg

% Define the parametric equations for the paths
x = @(t) 30e6 * cos(t) - 30e6;
y1 = @(t) 40e6 * sin(t);
y2 = @(t) 40e6 * sin(t) - 20e6 * t.^2 + 50e6 * t;

% Define the distance and unit direction vector components
r = @(x, y) sqrt((x + 30e6).^2 + (y + 50e6).^2);
rx_hat = @(x, y) (x + 30e6) ./ r(x, y);
ry_hat = @(x, y) (y + 50e6) ./ r(x, y);

% Define the gravitational force components
F_mag = @(x, y) G * M * m ./ r(x, y).^2;
Fx = @(x, y) -G * M * m * rx_hat(x, y) ./ r(x, y).^2;
Fy = @(x, y) -G * M * m * ry_hat(x, y) ./ r(x, y).^2;

% Generate a grid of points to plot the vector field
[X, Y] = meshgrid(-60e6:5e6:40e6, 0:5e6:100e6);
U = Fx(X, Y);
V = Fy(X, Y);

% Plot the vector field and original path
figure;
quiver(X, Y, U, V);
hold on;
axis([-60e6, 40e6, 0, 100e6])
t_vals = linspace(0, 2.5, 100);
plot(x(t_vals), y1(t_vals), 'r', 'LineWidth', 2);
scatter(x(0), y1(0), 100, 'bo', 'filled');
scatter(x(1.6), y1(1.6), 100, 'ko', 'filled');
plot(x(2.5), y1(2.5), 'r>', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
legend('Gravitational Force Field', 'Original Path', 'Start', 'Original @ 1.6s', 'End');
xlabel('X (meters)');
ylabel('Y (meters)');
title('Original Path of Endurance Spaceship');
hold off;

% Plot the vector field and both paths
figure;
quiver(X, Y, U, V);
hold on;
axis([-60e6, 40e6, 0, 100e6])
plot(x(t_vals), y1(t_vals), 'r', 'LineWidth', 2);
plot(x(t_vals), y2(t_vals), 'b', 'LineWidth', 2);
scatter(x(0), y1(0), 100, 'bo', 'filled');
scatter(x(1.6), y1(1.6), 100, 'ko', 'filled');
plot(x(2.5), y1(2.5), 'r>', 'MarkerSize', 10, 'MarkerFaceColor', 'g');
scatter(x(1.6), y2(1.6), 100, 'ks', 'filled');
plot(x(2.5), y2(2.5), 'b>', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
legend('Gravitational Force Field', 'Original Path', 'New Path', 'Start', 'Original @ 1.6s', 'Original End', 'New Path @ 1.6s', 'New End');
xlabel('X (meters)');
ylabel('Y (meters)');
title('Both Paths of Endurance Spaceship');
hold off;

% Define symbolic variables and expressions for work calculation
syms t_sym;
x_sym = 30e6 * cos(t_sym) - 30e6;
y1_sym = 40e6 * sin(t_sym);
y2_sym = 40e6 * sin(t_sym) - 20e6 * t_sym^2 + 50e6 * t_sym;
dx = diff(x_sym, t_sym);
dy1 = diff(y1_sym, t_sym);
dy2 = diff(y2_sym, t_sym);

% Gravitational force expressions for path 1
r1_sym = sqrt((x_sym + 30e6)^2 + (y1_sym + 50e6)^2);
Fx1_sym = -G * M * m * (x_sym + 30e6) / r1_sym^3;
Fy1_sym = -G * M * m * (y1_sym + 50e6) / r1_sym^3;

% Gravitational force expressions for path 2
r2_sym = sqrt((x_sym + 30e6)^2 + (y2_sym + 50e6)^2);
Fx2_sym = -G * M * m * (x_sym + 30e6) / r2_sym^3;
Fy2_sym = -G * M * m * (y2_sym + 50e6) / r2_sym^3;

% Work integrals
work_total = vpaintegral(Fx1_sym * dx + Fy1_sym * dy1, t_sym, 0, 2.5);
work_partial = vpaintegral(Fx1_sym * dx + Fy1_sym * dy1, t_sym, 1.6, 2.5);
work_new = vpaintegral(Fx2_sym * dx + Fy2_sym * dy2, t_sym, 0, 2.5);

% Convert symbolic results to numeric
work_total_num = double(work_total) / 1e24;
work_partial_num = double(work_partial) / 1e24;
work_new_num = double(work_new) / 1e24;

% Display results
fprintf('Work performed by the gravitational field (0 <= t <= 2.5): %e Yotta Joules\n', work_total_num);
fprintf('Work performed by the gravitational field (1.6 <= t <= 2.5): %e Yotta Joules\n', work_partial_num);
fprintf('Work performed by the gravitational field for the new path (0 <= t <= 2.5): %e Yotta Joules\n', work_new_num);
