[TOC]

# Matlab, A Practical Introduction to Programming and Problem Solving快速阅读

> MOOC: [MATLAB and Octave for beginners](https://courses.edx.org/courses/course-v1:EPFLx+MatlabeOctaveBeginnersX+1T2017/course/)
>
> Boook: **Matlab, A Practical Introduction to Programming and Problem Solving**
>
> 当前进度: [here](https://courses.edx.org/courses/course-v1:EPFLx+MatlabeOctaveBeginnersX+1T2017/courseware/a03b33e868b3432fb04182f4949af06e/7096a990bae541a18191c05d50748e03/?child=first)

## Chap 1 Intro to Matlab

### Note1

- 名字最大长度63

```matlab
>> - namelengthmax
ans =
    63
```

- 一些基本查看清除操作

```
clear <variable> - 清除参变量
who - 简单查看参变量
whos - 具体查看参变量
```

- 类型，默认是`double`

```
single
double
int8, int16, int32, int64
uint8...
char
string
logical
class(num) % 查看类型
```

- format命令

```matlab
format long/short % 显示位数，默认short（四位）
format loose/compact % 显示样式，默认loose（宽松）
```

- ellipsis ... 可以用于长公式
- 操作符

```matlab
\左除挺有意思的
A\B = inv(A)*B
A/B = A*inv(B)
```

- 基本内置常数built-in constant

```
pi, i, j, inf, NaN
```

- random numbers

```matlab
rand(x) % 随机分布/均匀分布，生成(x * x)的方阵(0,x)，与下方不同
randi(x); randi([low, high]) % 整数随机分布，[1,x]
randn(x) % 高斯分布，均值为0，方差为1，(0,x]
```

- 保证生成随机数（不）相同

```matlab
s = rng;
R1 = rand(1,5);
rng(s); % 生成相同的种子
R2 = rand(1,5);
rng('shuffle') % 生成不同的种子
```

- 生成一个范围内的随机数

```matlab
low = 5; high = 10;
rand_num = rand * (high - low) + low
```

- 一些基本判断符

```matlab
<; >; <=; >=; ==; ||; &&; ~
% 特殊的不等于
>> 1 ~= 1
ans =
  logical
   0
% 特殊的xor()异或
>> xor(2 < 4, 'a' == 'c')
ans =
  logical
   1
>> ‘b' == 'a' +1
ans =
  logical
   1
```

- 逻辑上存在一些bug

```
% cos(pi/2) == 0但事实并不是这样
>> cos(pi/2) == 0
ans =
  logical
   0
```

- 相关类型最大最小储存范围

```
intmin('int8') = -128;
intmax('int8') = 127;
% 如果输入int8(200)
>> int8(200)
ans =
  int8
   127
```

- 内置数值函数`elfun`

```matlab
>> help elfun
  Elementary m	ath functions.
sin(pi/2) = sind(90)
fix(); floor();ceil();round(); % 对数字进行操作
mod();rem() % 余数
sign() % 大于0取1，小于0取-1
nthroot(64, 3) = 4; % 几阶根
log();log2();log10();exp();
deg2rad();rad2deg(); % 角度弧度转换
```

- `which()`和`addpath()`的使用

### Ex1

> Chapter 1 - Exercises :  1, 6, **9**, 13, 15, 16, **22**, 23, 28, 29, 30
>

- Find a format option that would result in the following output format in fraction style

```matlab
>> format rat
>> 5/16 + 2/7
ans =
      67/112
```

- In the ASCII character encoding, the letters of the alphabet are, in order: ‘a’ comes before ‘b’ and also ‘A’ comes before ‘B’. However, which comes first e lower or uppercase letters?

```
>> 'a'>'A'
ans =
  logical
   1
```

有两题奇怪的题目：

- The smallest number which can be stored by the `int` type is -2147483648. Check that this value is correct. Is there an equivalent bound for the type `real`? If so, what is this variable's name?

第一题不懂; 2.2251e-308

## Char2 Vectors and Matrices

### Note2

- 向量

```matlab
% 列之间使用空格或者,行之间使用;
linspace(min, max, interval)
[min:interval:max]
```

- 矩阵

```matlab
ones();zeros();
%取左上角四个元素
%操作先行后列
A([1,2],[1,2]);A(1:2,1:2)=5 %直接赋值修改矩阵
A = diag(5:-1:1);
A(1:3,[1,3,5]) = A(1:3,[1,3,5]) + ones(3,3)
A =
     6     0     1     0     1
     1     4     1     0     1
     1     0     4     0     1
     0     0     0     2     0
     0     0     0     0     1
```

- 左除右除

```
A = [1, 2; 3, 4];
x = [1; 1];
b = [3; 7];
A * x == b;
% 用法介绍
x = A \ b
```

- 内积the norm of the column vector

```
b_norm = sqrt(b' * b)
b_norm = sqrt(sum(b.*b))
```

- elementwise operations

```
A = [-8, 2, 4; -5. -5. -6;-2,2,-8];
a1 = A(:,1); a2 = A(:,2);
a_sum = a1 + a2
a1_pow2 = a1.^2
a1_d_a2 = a1./a2
```

- 修改增加元素

```
a = [1, 2, 3];
a(3) = 4;
a(4) = 8;
a(6) = 32;

a = [1, 2, 4, 8, 0, 32]
```

- 生成随机矩阵

```
rand(row, column)
rand([min, high], row, column)
```

- 长度与维度

```
length(vec) % 返回向量长度或者每一列的长度
size(mat) % 返回每一矩阵的列数和行数
numel(mat) % 返回所有元素个数
```

- 好好使用`end`这个参数
- 改变维度

> 使用`reshape`,`fliplr`,`flipud`,`flip`,`rot90`

```
reshape(mat, row, column) % 按照列的方向开始重排
fliplr(mat) % 直接左右翻转
flipud(mat) % 上下翻转
rot90((mat， <rot_times>) % 直接旋转九十度
remat(mat, row, col) % 将原矩阵按照行列各复制几遍
repelem(mat, row, col) % 将原矩阵各个部分按照行列各复制几个
```

- 分别对元素和对特定行列操作的内置函数

```matlab
abs(vec); sign(vec);

min(mat);max(mat);sum(mat);prod(mat) % 默认对列进行操作，然后才是function(mat, 2)对行进行操作
%累加系列操作
cumprod();cumsum();%使用‘reverse'操作符
diff() % 相互之间差距值
>> vec1 = 1:4
vec1 =
     1     2     3     4
>> diff(vec1)
ans =
     1     1     1
```

- 对某一行、列进行操作

```
ans(:,3) = [] % 对某一列直接删除
ans(1,:) = 1:4 % 对第一行直接赋值
```

### Ex2

> - Reading from chapter 2: Section 2.1 until the end of 2.1.4 ; Section 2.2; Summaries on pages 27 and 66
> - Exercises from chapter 2: 4, 6, 10, 12, 17

## Chap3 Intro to Matlab Programming

### Note3

#### File I/O 

- 文件存放与载入

```matlab
save -mat test.mat
load <filename>.mat
load <filename>.mat <varibale1>
```

- 保存成txt

```matlab
% 只能保存一个参数
save -ascii test.txt a
load test.txt
C = load('test.txt')
% 遇到多个参数
A = [u v];
save -ascii test2.txt A
```

- 基本操作

```matlab
[fileID, message] = fopen('filename','mode');
fprintf;
fclose(fileID);

>> [fileID, message] = fopen('cry.txt', 'w');
>> fprintf(fileID, 'Today is %2.1f degree.', [10.53]);
>> fclose(fileID);
% sprintf('Today is %2.1f degree.', [10.53]); 直接打印
```

- 用`dlmread`读`.csv`

> 官方：<https://www.mathworks.com/help/matlab/ref/dlmread.html>

可见MATALB 读写文本函数[csvwrite,csvread,dlmwrite,dlmread,textread,textscan](https://blog.csdn.net/skye1221/article/details/77750121?utm_source=blogxgwz4),dlmread函数用于从文档中读入数据，调用格式为:

```
M = dlmread(filename);
M = dlmread(filename, delimiter); % 这里指定了分隔符。使用\t代表制表符tab分隔。
M = dlmread(filename, delimiter, R, C);
M = dlmread(filename, delimiter, range);

>> M = [1	1.12	2.10	64
25	1.489	1.18	152.4]
M =
    1.0000    1.1200    2.1000   64.0000
   25.0000    1.4890    1.1800  152.4000
>> dlmwrite('example.csv',M, 'delimiter', '\t')
>> dlmread('example.csv')
ans =
    1.0000    1.1200    2.1000   64.0000
   25.0000    1.4890    1.1800  152.4000
```


- 进阶操作

> sections 3.3.2 and 9.1 from *Stormy Attaway*, Matlab, A Practical Introduction to Programming and Problem Solving.

#### plot basic

- 2D: graph, plot, figure

```
plot()的一些操作，包括变换颜色，线型
legend('label1','label2',...) % 添加图例
xlabel();
saveas(gca, 'first.pdf', 'pdf');
help saveas
doc plot
```

- 3D

```matlab
% plot3D
clear;clc;
t = linspace(-2*pi, 2*pi, 200);
plot3(t, sin(t), cos(t), 'b-');
saveas(gca, 'first.jpg', 'jpg');
hold on
[X, Y] = meshgrid(x, y)
grid on

% surface
clf;
x = linspace(-1, 1, 101);
y = linspace(-1, 1, 201);
[X, Y] = meshgrid(x, y);
Z = sin(2*pi*X).*cos(pi*Y);
surf(X, Y, Z)
```

- 长注释

```matlab
%{
so  
long  
for
comment
&}
disp('HYJ')
```

- 输入

```matlab
rad = input('just input for fun!'，'s') % 输入的是一个字符，一般会有’s'转化为string 
```

- 输出`disp`和`fprintf`

```
disp() % 可以直接输入数字或者字符
fprintf() % 则是可以格式化输出
%d, %f, %c, %s
%5d % 前面空五格
%-5d % 后面空五格
\t tab空格
\n 新的一行
```

### Ex3

> **Reading and complementary exercises**
>
> - Sections 3.2, 3.3, 3.4
> - Summary on page 107
> - Exercises from chapter 3 : 1, 2, 5, 6, 16, 24
> - Sections 3.5.1 and 3.5. 2 and exercises 15, 16, 42
> - Chapter 11 on *Advanced Plotting Techniques*

- 基本文件读写题目

```matlab
%期待输出
%The part weighs 14.57 kg.
%Its volume is 0.09 m^3.
%Its density is 163.34 kg/m^3.

clear; close all; clc;

% Definition of the values
mass = 14.57;
volume = 0.0892;

% Opens the file
fileID = fopen('mooc-3-2-2.txt','w');

% Writes the texts in the file
fprintf(fileID,'The part weighs %4.2f kg.\n',mass);
fprintf(fileID,'Its volume is %4.2f m^3.\n',volume);
fprintf(fileID,'Its density is %4.2f kg/m^3.\n',mass/volume);

% Close the file
fclose(fileID)
```

- For a text file containing tab separated data, which command will **read the data and create a matrix from the data** ? Use the function `dlmread`(not seen during the course but very useful) by **specifying the separator as tabs**. Read a file called `example.csv`. A very short example of such a file is shown below.

```
%基本数据
%1	1.12	2.10	64
%25	1.489	1.18	152.4
dlmread('example.csv','\t')
```

- We shall create a figure showing a linear regression. The full script randomly generates data, the performs a regression on the data. The functions used for the regression have not been seen in the course, but information can be obtained by using the `help`. You must complete the code below such that it is fully functional and correct.(When providing the answers, **do not use semi-colons.**)

```matlab
clear; close all; clc;
    
% Randomly generate data
x = 10*rand(50,1);
y = x+(5*rand(50,1)-2);

% linear regression
fit = polyfit(x,y,1);

% evaluation of the regression
x_eval = 0:10;
y_eval = polyval(fit,x_eval);

%--------------------------%
% figure creation
figure;
hold on;

% Adds elements on the figure
plot(x,y,'xr'); % Draw the points (defined in the variable x and y) using a red cross.
plot(x_eval,y_eval,'g','LineWidth',2)

% Figure styling
xlim([-1,11]);
ylim([-1,11]); % Specify that the y-axis runs from -1 to 11.
xlabel('temps [s]');
ylabel('position [m]'); % Define the title of the -axis as position [m]
title('Position vs Speed'); % Define the title of the figure to be Position vs Speed
hold off;
```

- The command `f = @(x,y) sin (sqrt (x.^2 + y.^2)) ./ sqrt (x.^2 + y.^2);` defines an anonymous (or lambda) function of the formula

```matlab
f = @(x,y) sin (sqrt (x.^2 + y.^2)) ./ sqrt (x.^2 + y.^2);
rangeX = linspace(-8,8,41);
rangeY = linspace(-8,8,21);
[X, Y] = meshgrid(rangeX, rangeY);
Z = f(X, Y);
surf(X, Y, Z);
```

- We will produce a figure presenting a curve in space (3D). The exercise requires the creation of the points defining the curve and the manipulation of the figure itself. **Do not use spaces or semi-colons.**

```matlab
clear; close all; clc;
% Generate data
x=linspace(0,6*pi,100);
y = x.*sin(x); % Create the vector y, by multiplying x by sin(x) 
z=exp(x/10)-1;
		  
% Create figure with visualization
plot3(x,y,z,'b','LineWidth',2) % Draw the parametric curve (defined by the variables x, y and z), with a blue line of thickness 2.
hold on
plot3(x,y,0*z,'kx')
		  
% Add axis labels
xlabel('x')
ylabel('x*sin(x)')
zlabel('e^x/10-1'); % Define the z-axis title as e^x/10-1
hold off % close the hold on called previously 
grid on
```

## Chap4

### 4.1 functions

```
built-in
.m
lambda
inline
```

- anonymous function

```
f = @(A,x) A*x;
areaCircle=@(r)pi*r^2; %计算圆形面积
f=@(a,b)@(x)a*x+b
f23 = f(2,3)
f23(1) = 5

g = inline('A*x'), 'A'
```

#### 4.2 Conditional Execution

```matlab
if (condition1)
	ecu1;
elseif (condition2)
	ecu2;
else
	ecu3;
end

%switch
switch points
	case1 {num1}
		ecu1；
	case2 {num2}
		ecu2；
	otherwise
		ecu3；
```

#### 4.3 Loop

```matlab
% 循环
while

end

for min:max

end
% 中间额外增加
break
continue
```

### Ex4

> **Functions**
>
> - Sections 3.7, (6.1), 10.1, 10.2
> - Exercises from chapter 3 : 24, 25, 29, 37
> - Exercises from chapter 10 : 1, 2, 6, 7
>
> **Conditional execution**
>
> - Summary on page 136
> - Exercises from chapter 4 : 1, 6, 10, 16, 27, 30, 31
>
> **Loops**
>
> - Summary on page 183
> - Exercises from chapter 5 : 1, 6, 7, 8, 9, 13, 40
> - Exercises from chapter 10 : 1, 2, 6, 7

### 小操作

```
edit script.m % 编辑脚本文件 
type .csv/.txt % 直接输出在窗格当中
```

