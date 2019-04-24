# plot_course

> 190403

- 绘制双坐标系

`plotyy()`

- `peak()`

- 加注功能

```
gtext
ginput 获取鼠标点击位置
text 对点击位置进行标注
axis square 绘图区域标为正方形
axis equal 坐标轴比例相等
axis on / off
```

- 绘制函数图函数

```matlab
fplot(fun, lim)
fplot('[sin(x), cos(x), tan(x)]', 2*pi*[-1 1 -1 1];
```
- 绘制隐函数

`ezplot(f, [xmin, xmax])`

- 特殊函数

```matlab
stairs(x, y)
hist
stem
```

- 高层绘图与底层绘图
- 
- 句柄绘图

**底层绘图**

figure, axis,line,patch

GUIDE布局编辑器，callback等回调函数

- nargin与nargout
外循环执行次数少，内循环执行次数多！！！