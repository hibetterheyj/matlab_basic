% structfun, arrayfun, spfun, cellfun
% ���mat2cell��ʹ��
% ��Ԫ�������е�ÿ��Ԫ��Ӧ�ú���
% https://ww2.mathworks.cn/help/matlab/ref/cellfun.html
% ����Ϊarrayfun, cellfun, bsxfun������Faster R-CNN����
% https://blog.csdn.net/u012905422/article/details/52635585
%% Cell�����ַ�����S
% C = {'Monday','Tuesday','Wednesday','Thursday','Friday'};
% A = cellfun(@(x) x(1:3), C, 'UniformOutput', false);

%% Cell������Ԫ�ص�ƽ��ֵ
% C = {1:10, [2; 4; 6], []};
% averages = cellfun(@mean, C)
% [nrows, ncols] = cellfun(@size, C)