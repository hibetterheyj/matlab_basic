% ex6_3
%% ��ͼ
x1 = 0.01:0.01:20;
x2 = 0.01:0.01:20;
[X, Y] = meshgrid(x1, x2);
Z = X+1./X+Y+1./Y;
surf(X,Y,Z)
%% ���
fun = @(x) x(1)+1/x(1)+x(2)+1/x(2);
% ʹ���޵�����������Լ���Ķ���������ľֲ���Сֵ x = fminsearch(fun,x0)
[x,fval]=fminsearch(fun,[2,2]);
% fval �з���Ŀ�꺯�� fun �ڽ� x ����ֵ��
% x0Ϊ��ʼֵ
sprintf('The Min %f can be found in [%f, %f].', fval, x)