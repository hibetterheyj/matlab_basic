% https://ww2.mathworks.cn/help/parallel-computing/convert-for-loops-into-parfor-loops.html
% https://ww2.mathworks.cn/help/parallel-computing/parfor.html
% https://ww2.mathworks.cn/help/parallel-computing/decide-when-to-use-parfor.html
%% 将for----循环" 转换为parfor-循环
% 第一次运行比第二次运行慢, 因为必须启动并行池, 第二次运行所经过的时间大为减少。
tic
n = 200;
A = 500;
a = zeros(1,n);
% for i = 1:n
parfor (i = 1 : n, 6)
    a(i) =max (abs(eig(rand(A))));
end
toc

%%
tic;
% M = 6;                     % M specifies maximum number of workers
% y = ones(1,100);
% parfor (i = 1:100,M)
%     y(i) = i;
% end
% toc;