% ex6_4
% f^T x 即为优化的函数，系数向量，直接写成列向量
f=[13; 9; 10; 11; 12; 8];
% 分别是等式左右侧 A_{eq} x = b_{eq}
Aeq = [1 0 0 1 0 0; 0 1 0 0 1 0; 0 0 1 0 0 1]; % 3x6
beq = [400; 600; 500]; 
% 对应元素的上下界 [lb, ub]
lb=[0 0 0 0 0 0];
% 对应不等式矩阵 Ax <= b
A=[0.4 1.1 1.0 0 0 0;
   0 0 0 0.5 1.2 1.3];
b=[800;900];
% 求解 x对应结果，fval对应最小化值
[x,fval] =linprog(f,A,b,Aeq,beq,lb);
fprintf('each element = [%f,%f,%f,%f,%f,%f]\n',x);
fprintf('min res = %f\n', fval);