clc;
clear all;

t=-linspace(-1.2,1.2,1000);

x=t;
y=t;

a = 4 * t.^2 + 2;
b = cos(3 * t.^2 .* t.^2 + t.^2);
c = (2 * t.^2) + (t.^2 / 2) - 5;

z = (-b + sqrt(b.^2 - 4 * a .* c)) ./ (2 * a);

plot3(x,y,z,'-.b','LineWidth',3)

xlabel('x');
ylabel('y');
zlabel('z');

title('Plot of Curve of Intersection Between Equation 1 and 2');
equation = 'z=(-cos(3t^4 + t^2) + sqrt((cos(3t^4 + t^2))^2 - 4*(4t^2 + 2)*((2t^2) + (t^2)/(2) - 5)))/(2*(4t^2 + 2))';
legend(equation, 'location', 'best');