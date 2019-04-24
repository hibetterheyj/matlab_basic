- **计算 $ \rm{arc}\sin x $。当$|x|<1$时，**

$$
\arcsin x \approx x+\frac{2 x^{3}}{4 \times 3}+\cdots+\frac{(2 n) !}{2^{2 n}(n !)^{2}} \frac{x^{2 n+1}}{(2 n+1)}
$$

代码

```matlab
function res = arcsin(x)
if abs(x) < 1
    res = 0;
    n = 1;
    % factorial阶乘
    while factorial(2*n-2) ./ (2^(2*n-2) * (factorial(n-1))^2) > (1e-5)
        res = res + cellproduct(x, n);
        n = n + 1;
    end
else
    res = NaN;
    disp("Range Exceeded!");
end
end

function product_n = cellproduct(x, n)
product_n = (factorial(2*n-2) * x^(2*n-1)) ./ ...
    (2^(2*n-2) * (factorial(n-1))^2 * (2*n-1));
end
```

结果

```matlab
res = arcsin(0.2)
res2 = arcsin(1.1)

res =
    0.2014
Range Exceeded!
res2 =
   NaN
```

- **学生的成绩管理，五名同学： Jack, Marry, Peter, Rose,  Tom。成绩分别为：72, 83, 56, 94, 100。成绩划分区域：满分(100)，优秀(90-99)，良好(80-89)，及格(60-79)，不及格(<60)。根据学生的分数，求出相应的等级。运行程序后将学生姓名，得分，等级等信息显示出来。显示结果如下：**

```
学生姓名    得分      等级
Jack       72       及格
Marry      83       良好
Peter      56       不及格
Rose       94       优秀
Tom        100      满分
```

代码

```matlab
% ex3_2.m
name={'Jack','Marry','Peter','Rose','Tom'};
score=[72,83,56,94,100];
for i=1:5
    switch floor(score(i)/10)
        case 10
            rank(i)={'满分'};
        case 9
            rank(i)={'优秀'};
        case 8
            rank(i)={'良好'};
        case {6,7}
            rank(i)={'及格'};
        otherwise
            rank(i)={'不及格'};
    end
end
disp('学生姓名  得分  等级')

for i=1:5
disp([char(name(i)),'   ',num2str(score(i)),'    ',char(rank(i))]);
end
```

- **在xy平面内选择区域[-8,8]×[-8,8],在同一图形窗口中绘制函数的mesh、surf、contour3图**
  $$
  z=\frac{\sin \sqrt{x^{2}+y^{2}}}{\sqrt{x^{2}+y^{2}}}
  $$

代码

```matlab
% ex3_3.m
[X,Y]=meshgrid(-8:0.01:8,-8:0.01:8);
Z=sin(sqrt(X.^2+Y.^2))./sqrt(X.^2+Y.^2);
f1 = figure;
set(f1,'position',[0 0 1000 300]);
subplot(131);
mesh(X,Y,Z);
subplot(132);
surf(X,Y,Z);
subplot(133);
contour3(X,Y,Z)
```

结果

![ex3_3](C:\Users\HYJ\Documents\MATLAB\matlab_basic\coursework\ex3_week8\ex3_3.png)

- **在同一坐标中绘制如下分段函数的曲线，x的范围由键盘输入。不同分段曲线的颜色、线型和点标不同（自定义），并对各个分段曲线在适当位置分别进行标注x>0, x<=0**

$$
f(x)=\left\{\begin{array}{l}{x^{2}+\sqrt[4]{1+x}, x>0} \\ {x^{3}+\sqrt{1-x}, x \leq 0}\end{array}\right.
$$

代码

```matlab
% ex3_4
% main function
start=input('下界 start=');stop=input('上界 stop=');
piece_plot(start, stop); 


function piece_plot(start, stop)
if stop < start
    error('Input error');
else
    if start > 0
        [x1,y1]=fplot('x^2+(1+x)^(1/4)',[start,stop]);
        plot(x1,y1,'k');
        gtext('x>0');
    elseif stop < 0
        [x2,y2]=fplot('x^3+sqrt(1-x)',[start,stop]);
        plot(x2,y2,':b');
        gtext('x<=0');
    else
        [x1,y1]=fplot('x^2+(1+x)^(1/4)',[0,stop]);
        [x2,y2]=fplot('x^3+sqrt(1-x)',[start,0]);
        plot(x1,y1,'k',x2,y2,':b');
        gtext('x>0');gtext('x<=0');
    end
end
end
```

结果

![ex3_4](C:\Users\HYJ\Documents\MATLAB\matlab_basic\coursework\ex3_week8\ex3_4.png)

- **产生一个6×6的魔方矩阵A，根据用户自定义，从中取出一个子矩阵，如果出错，显示出错原因，并取出整个矩阵。对取出的矩阵进行改写：将大于等于15的元素求平方根，小于15的求平方。**

代码

```matlab
function res = matrix_select(r1, c1, r2, c2)
% r1, c1, r2, c2代表矩阵左上和右下对角
A = magic(6);
if r1 < 0 || r2 > 6
	res = [];
	disp("Row Exceeded!");
elseif c1 < 0 || c2 > 6
	res = [];
	disp("Column Exceeded!");
else
	res = A(r1:r2,c1:c2);
	more_index = find(res >= 15);
	less_index = find(res < 15);
	res(more_index) = res(more_index) .^ 0.5;
	res(less_index) = res(less_index) .^ 2;
end
```

结果

```
>> matrix_select(1,1,6,7)
Column Exceeded!
ans =
     []
     
>> matrix_select(1,1,2,2)
ans =
    5.9161    1.0000
    9.0000    5.6569
```





