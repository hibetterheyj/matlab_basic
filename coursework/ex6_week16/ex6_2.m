% ex6_2
% ��ͼ�õ���СֵԼ��-8���ң�Ϊ�˱ܿ��ֲ���С
x = -10:0.01:10;
y = (x-2).^4.* sin(x)-(x-1).^2.* cos(x);
plot(x,y);
% �ҵ�����Լ���Ķ����������Сֵ
% [x,fval] = fmincon(fun,x0,A,b,Aeq,beq,lb,ub)
% fun������
% x0Ϊ��ʼֵ
% Ax <= b ��Ϊ����ʽ���󣬴���û��
% A_{eq}x = b_{eq}
% lb,ubΪ������
fun = @(x) (x-2)^4*sin(x)-(x-1)^2*cos(x);
x0 = -9;
lb = -10;
ub = 10;
% �õ���Сֵ��
x = fmincon(fun,x0,[],[],[],[],lb,ub);
sprintf('Min = %f', x)