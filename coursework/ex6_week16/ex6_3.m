% ex6_3
%% 画图
x1 = 0.01:0.01:20;
x2 = 0.01:0.01:20;
[X, Y] = meshgrid(x1, x2);
Z = X+1./X+Y+1./Y;
surf(X,Y,Z)
%% 求解
fun = @(x) x(1)+1/x(1)+x(2)+1/x(2);
% 使用无导数法计算无约束的多变量函数的局部最小值 x = fminsearch(fun,x0)
[x,fval]=fminsearch(fun,[2,2]);
% fval 中返回目标函数 fun 在解 x 处的值。
% x0为初始值
sprintf('The Min %f can be found in [%f, %f].', fval, x)