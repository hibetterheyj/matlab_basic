% structfun, arrayfun, spfun, cellfun
% ����������Ӧ�ð�Ԫ�����㣨������ʽ��չ��
% https://ww2.mathworks.cn/help/matlab/ref/bsxfun.html
%% ʵ�ּ�ȥƽ��ֵ
A = [1 2 10; 3 4 20; 9 6 15];
% ���� A �Ķ�Ӧ��Ԫ���м�ȥ�о�ֵ
% �� MATLAB? R2016b �����߰汾�У�����ֱ��ʹ������������� bsxfun
% ��Ϊ��Щ���������֧�ֶԾ��м��ݴ�С�����������ʽ��չ��
tic;
% A_meanA = A - repmat(mean(A), 3, 1);
% A_meanA = A - mean(A)
% A_meanA = bsxfun(@minus, A, mean(A))
toc;
% std(A) % ��׼���һ��
%% �Ƚ�����Ԫ��
% row = [8; 17; 20; 24];
% col = [0 10 21];
% row > col;
% compRes = bsxfun(@gt, row, col);

%% �Զ��庯����չ
% ��ӦԪ��֮������Զ��庯������
minusExp = @(x, y) x- exp(y);
x_hat = 1:7;
y_hat = pi*[0 1/4 1/3 1/2 2/3 3/4 1].';
res = bsxfun(minusExp, x_hat, y_hat);

%% ���ö�Ԫ��������֧����ʽ��չ
% xor, min, max, mod


