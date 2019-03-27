% ex2_1.m
syms x t;
A = sym('[2 * x, t * t; t * sin(x), e^x]');
ans1 = int(int(A, x), t)
ans2 = diff(diff(A, x), t)