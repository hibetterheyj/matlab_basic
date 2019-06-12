% ex6_2
% 画图得到最小值约在-8左右，为了避开局部最小
x = -10:0.01:10;
y = (x-2).^4.* sin(x)-(x-1).^2.* cos(x);
plot(x,y);
% 找到带有约束的多变量函数最小值
% [x,fval] = fmincon(fun,x0,A,b,Aeq,beq,lb,ub)
% fun即函数
% x0为初始值
% Ax <= b 即为不等式矩阵，此题没有
% A_{eq}x = b_{eq}
% lb,ub为上下限
fun = @(x) (x-2)^4*sin(x)-(x-1)^2*cos(x);
x0 = -9;
lb = -10;
ub = 10;
% 得到最小值！
x = fmincon(fun,x0,[],[],[],[],lb,ub);
sprintf('Min = %f', x)