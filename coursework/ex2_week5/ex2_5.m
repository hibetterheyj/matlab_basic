% ex2_5.m
syms x y;
y = dsolve('D2y * x - Dy * 3 = x^2', 'y(1) = 0', 'y(5) = 0', 'x')