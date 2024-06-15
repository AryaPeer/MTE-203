clear all;
clc;

[x,y]=meshgrid(-1.2:0.01:1.2);

a = 4 * x.^2 + 2;
b = cos(3 * x.^2 .* y.^2 + x.^2);
c = (2 * y.^2) + (x.^2 / 2) - 5;

z = (-b + sqrt(b.^2 - 4 * a .* c)) ./ (2 * a);

surf(x,y,z, 'FaceColor', 'b', 'FaceAlpha', 0.9, 'EdgeColor', 'none');

hold on;

[c,h] = contour(x,y,z,8)
clabel(c,h)

hold on;

[x,z]=meshgrid(-1.2:0.01:1.2,0.2:0.01:1.5);

y=x;

surf(x,y,z,'FaceColor','y', 'EdgeColor', 'none');

hold on;

t=-linspace(-1.2,1.2,1000);

x= t;
y= t;

a = 4 * t.^2 + 2;
b = cos(3 * t.^2 .* t.^2 + t.^2);
c = (2 * t.^2) + (t.^2 / 2) - 5;

z = (-b + sqrt(b.^2 - 4 * a .* c)) ./ (2 * a);

plot3(x,y,z,'-.k','LineWidth',3);

xlabel('x');
ylabel('y');
zlabel('z');

title('Combined Plot of 4 Previous Plots');
legend('z=f(x,y)','x=y','z=f(x,y)','z=f(t,t)', 'location', 'best');
