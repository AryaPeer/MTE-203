clc;
clear all;

[x,z]=meshgrid(-1.2:0.01:1.2,0.2:0.01:1.5);

y=x;

surf(x,y,z,'FaceColor','y', 'EdgeColor', 'none');

xlabel('x');
ylabel('y');
zlabel('z');

title('Plot of 3D Surface of Equation 2');
equation = 'x=y';
legend(equation, 'location', 'best');
