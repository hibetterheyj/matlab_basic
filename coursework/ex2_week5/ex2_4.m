% ex2_4.m
syms k;
M = [1/(2 * k - 1)^2 (-1)^k/k];
ans = symsum(M, k, 1, inf);
vpa(ans, 20)