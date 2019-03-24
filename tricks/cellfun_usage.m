% structfun, arrayfun, spfun, cellfun
% 结合mat2cell的使用
% 对元胞数组中的每个元胞应用函数
% https://ww2.mathworks.cn/help/matlab/ref/cellfun.html
% 以下为arrayfun, cellfun, bsxfun函数与Faster R-CNN代码
% https://blog.csdn.net/u012905422/article/details/52635585
%% Cell数组字符操作S
% C = {'Monday','Tuesday','Wednesday','Thursday','Friday'};
% A = cellfun(@(x) x(1:3), C, 'UniformOutput', false);

%% Cell数组中元素的平均值
% C = {1:10, [2; 4; 6], []};
% averages = cellfun(@mean, C)
% [nrows, ncols] = cellfun(@size, C)