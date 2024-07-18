clear all
clc

%Define coordinate system
syms r theta y

% define a,b,l in metres
a = double(400/1000); 
b = double(200/1000); 
l = double(3000/1000); 

density_func = 420 + 80*(cos(theta - pi/2) + 5*sin(theta + 5*pi/2));

% define limit for r
r_max = a*b/sqrt(b^2*cos(theta)^2+a^2*sin(theta)^2);

% Use the density function to integrate for the value of mass
mass_integral = int(int(int(density_func * r, r, 0, r_max), theta, 0, 2*pi), y, -l/2, l/2);
mass = double(mass_integral);

% Center of mass integrals (kgm) and vals (m)
centroid_x_integral = int(int(int(r*cos(theta)*density_func*r, r, 0, r_max), theta, 0, 2*pi), y, -l/2, l/2);
centroid_x = double(centroid_x_integral)/mass;

centroid_z_integral = int(int(int(r*sin(theta)*density_func*r, r, 0, r_max), theta, 0, 2*pi), y, -l/2, l/2);
centroid_z = double(centroid_z_integral)/mass;

% weight and torque calcs
g = 9.81;
weight = mass*g;
torque = weight*(centroid_x + a/1);

disp(['Total Mass Case 1: ', num2str(mass), ' kg']);
disp(['Center of Mass (x) Case 1: ', num2str(centroid_x), ' m']);
disp(['Center of Mass (z) Case 1: ', num2str(centroid_z), ' m']);
disp(['Torque Case 1: ', num2str(torque), ' N.m']);

disp(['Case 1 Done, Starting Case 2']);

clear;

syms r theta y
a = double(600/1000);
b = double(400/1000);
l = double(2400/1000); 

density_func = 420 + 80*(cos(theta - pi/2) + 5*sin(theta + 5*pi/2));

% define limit for r
r_max = a*b/sqrt(b^2*cos(theta)^2+a^2*sin(theta)^2);

% Use the density function to integrate for the value of mass
mass_integral = int(int(int(density_func * r, r, 0, r_max), theta, 0, 2*pi), y, -l/2, l/2);
mass = double(mass_integral);

% Center of mass integrals (kgm) and vals (m)
centroid_x_integral = int(int(int(r*cos(theta)*density_func*r, r, 0, r_max), theta, 0, 2*pi), y, -l/2, l/2);
centroid_x = double(centroid_x_integral)/mass;

centroid_z_integral = int(int(int(r*sin(theta)*density_func*r, r, 0, r_max), theta, 0, 2*pi), y, -l/2, l/2);
centroid_z = double(centroid_z_integral)/mass;

% weight and torque calcs
g = 9.81;
weight = mass*g;
torque = weight*(centroid_x + a/1);

disp(['Total Mass Case 2: ', num2str(mass), ' kg']);
disp(['Center of Mass (x) Case 2: ', num2str(centroid_x), ' m']);
disp(['Center of Mass (z) Case 2: ', num2str(centroid_z), ' m']);
disp(['Torque Case 2: ', num2str(torque), ' N.m']);
