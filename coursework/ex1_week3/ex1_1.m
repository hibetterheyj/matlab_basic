% ex1_1.m
A = [-4, -2, 0, 2, 4;...
     -3, -1, 1, 3, 5];
ans = find(abs(A)>3)
[x_index, y_index] = find(abs(A)>3)