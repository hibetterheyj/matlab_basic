% ex1_3.m
matrix = 2 + sqrt(0.1) * rand(10);
B = matrix > 1.8 & matrix <2.1;
number = sum(sum(B))