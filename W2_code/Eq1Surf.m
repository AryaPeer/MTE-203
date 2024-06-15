clc;
clear all;

[x,y]=meshgrid(-1.2:0.01:1.2);

a = 4 * x.^2 + 2;
b = cos(3 * x.^2 .* y.^2 + x.^2);
c = (2 * y.^2) + (x.^2 / 2) - 5;

z = (-b + sqrt(b.^2 - 4 * a .* c)) ./ (2 * a);

surf(x,y,z, 'FaceColor', 'cyan', 'FaceAlpha', 0.7, 'EdgeColor', 'none');

xlabel('x');
ylabel('y');
zlabel('z');

title('Plot of 3D Surface of Equation 1');
equation = 'z = (-cos(3x^2 * y^2 + x^2) + sqrt((cos(3x^2y^2 + x^2))^2 - 4*(4x^2 + 2)*((2y^2) + (x^2)/(2) - 5)))/(2*(4x^2 + 2))';
legend(equation, 'location', 'best');
