clc;
clear all;

syms t;

r = [(2/3)*t,sqrt(2)*t,(t^2)-(1/3)*t];
fplot3(r(1), r(2), r(3), [-3,3]);

equation = 'r(t) = (2/3)*t*i + sqrt(2)*t*j + ((t^2)-(1/3)*t)*k';

xlabel('x');
ylabel('y');
zlabel('z');

title('Drone Path fplot')

legend(equation, 'location', 'best');