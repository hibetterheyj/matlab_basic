## Matlab, A Practical Introduction to Programming and Problem Solving快速阅读

### Chap 1 Intro to Matlab

#### Note1

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

#### Ex1

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

### Char2 Vectors and Matrices

#### Note2

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

#### Ex2

> - Reading from chapter 2: Section 2.1 until the end of 2.1.4 ; Section 2.2; Summaries on pages 27 and 66
> - Exercises from chapter 2: 4, 6, 10, 12, 17