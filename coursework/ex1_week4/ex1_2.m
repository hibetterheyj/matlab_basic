% ex1_2.m
x0 = [0. 1e-10, 1];
tao = [10, 8]; b = [8/3, 3]; r = [28, 15];
[~, X1] = ode45(@equation_set, [0, 100], x0, [], tao(1), b(1), r(1));
[~, X2] = ode45(@equation_set, [0, 100], x0, [], tao(2), b(2), r(2));

subplot(1, 2, 1);plot3(X1(:,1), X1(:,2), X1(:,3));
subplot(1, 2, 2);plot3(X2(:,1), X2(:,2), X2(:,3));