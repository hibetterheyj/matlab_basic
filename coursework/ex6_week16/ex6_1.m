% ex6_1
% f^T x 即为优化的函数，系数向量，直接写成列向量
f=[0.5; 0.6; 0.7; 0.75; 0.8];
% 分别是等式左右侧 A_{eq} x = b_{eq}
Aeq=[1 1 1 1 1];
beq=4500; 
% 对应元素的上下界 [lb, ub]
lb=[0 0 0 0 0];
ub=[1600 1400 800 650 1000];
% 对应不等式矩阵 Ax <= b
A=[0.76 0 0 0 0;
   0 0.78 0 0 0;
   0 0 0.8 0 0;
   0 0 0 0.82 0;
   0 0 0 0 0.85];
b=[1000;1200;900;800;1200];
% 求解 x对应结果，fval对应最小化值
[x,fval] =linprog(f,A,b,Aeq,beq,lb,ub);
fprintf('each element = [%f,%f,%f,%f,%f]\n',x);
fprintf('min res = %f\n', fval);