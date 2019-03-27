% ex2_6.m
equ = 'D2y - 2 * Dy + 5 * y = exp(x) * sin(x)';
f = dsolve(equ, 'Dy(0) = 0', 'y(0) = 0', 'x')
[x, y] = ode45(@equfun, [0, 120], [0, 0]);
plot(x, y(:,1), 'ok');
hold on
fplot(f)
xlim([115, 120]);
legend('numerical solution','symbolic  solution')