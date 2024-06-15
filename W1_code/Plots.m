clear all;
clc;

figure('Name','Single Plot');
x=(-5:0);

g1=x-3*exp(-0.2471*3.0717)+5;
g2=-3.5956-3*exp(x*3.0717)+5;
g3=-3.5956-3*exp(-0.2471*x)+5;

hold on

plot(x,g1,'-b', 'LineWidth',2)
plot(x,g2,'r--o','MarkerSize',4)
plot(x,g3,'-.m')

legend('g_{1}(x)=x1-3*exp(-0.2471*3.0717)+5','g_{2}(x)=-3.5956-3*exp(x2*3.0717)+5', 'g_{3}(x)=-3.5956-3*exp(-0.2471*x3)+5')
xlabel('x');
ylabel('g(x)')
title('g(x) function plotted as functions of x_{1}, x_{2}, and x_{3}')

figure('Name','Subplot');
x2 = (0:5);

g4=x2-3*exp(-0.2471*3.0717)+5;
g5=-3.5956-3*exp(x2*3.0717)+5;
g6=-3.5956-3*exp(-0.2471*x2)+5;

subplot(2,2,1)
plot(x2,g4,'-b', 'LineWidth',2)
xlabel('x');
ylabel('g(x)')
legend('g_{1}(x)=x1-3*exp(-0.2471*3.0717)+5')
title('g(x) function as function of x_{1}')

subplot(2,2,2)
plot(x2,g5,'r--o','MarkerSize',4)
xlabel('x');
ylabel('g(x)')
legend('g_{2}(x)=-3.5956-3*exp(x2*3.0717)+5')
title('g(x) function as function of x_{2}')

subplot(2,2,[3,4])
plot(x2,g6,'-.m')
xlabel('x');
ylabel('g(x)')
legend('g_{3}(x)=-3.5956-3*exp(-0.2471*x3)+5')
title('g(x) function as function of x_{3}')