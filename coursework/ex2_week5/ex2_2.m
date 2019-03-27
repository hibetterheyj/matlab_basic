% ex2_2.m
equ1 = sym('x^2 + 2 * x + 1 = 0');
equ2 = sym('x + 3 * z = 4');
equ3 = sym('y * z = -1');
[x, y, z] = solve(equ1, equ2, equ3)