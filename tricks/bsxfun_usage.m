% structfun, arrayfun, spfun, cellfun
% 对两个数组应用按元素运算（启用隐式扩展）
% https://ww2.mathworks.cn/help/matlab/ref/bsxfun.html
%% 实现减去平均值
A = [1 2 10; 3 4 20; 9 6 15];
% 矩阵 A 的对应列元素中减去列均值
% 在 MATLAB? R2016b 及更高版本中，可以直接使用运算符而不是 bsxfun
% 因为这些运算符本身支持对具有兼容大小的数组进行隐式扩展。
tic;
% A_meanA = A - repmat(mean(A), 3, 1);
% A_meanA = A - mean(A)
% A_meanA = bsxfun(@minus, A, mean(A))
toc;
% std(A) % 标准差，归一化
%% 比较向量元素
% row = [8; 17; 20; 24];
% col = [0 10 21];
% row > col;
% compRes = bsxfun(@gt, row, col);

%% 自定义函数拓展
% 对应元素之间进行自定义函数运算
minusExp = @(x, y) x- exp(y);
x_hat = 1:7;
y_hat = pi*[0 1/4 1/3 1/2 2/3 3/4 1].';
res = bsxfun(minusExp, x_hat, y_hat);

%% 内置二元函数本身支持隐式扩展
% xor, min, max, mod


