## Parallel and GPU Computing Tutorials

<https://www.bilibili.com/video/av22571883>

> matlab code: <https://ww2.mathworks.cn/matlabcentral/fileexchange/46711-tutorials-parallel-and-gpu-computing-with-matlab-all-in-one-9-parts>
>
> youtube: https://www.youtube.com/playlist?list=PLn8PRpmsu08ryX4qIFma2T5MBGTE475Il
>
> bilibili: <https://www.bilibili.com/video/av47510626/>

### Part1

 way of parallel computing

- built-in multithreading
- parallel computing using explicit tech

Parallel Compute Toolbox/image processing toolbox has GPU function

### Part2

- Parallel Computing Toolbox  support

```\
>> ver distcomp
------------------------------------------------------------------------------------------------
MATLAB 版本: 9.3.0.713579 (R2017b)
MATLAB 许可证编号: 968398
操作系统: Microsoft Windows 10 专业版 Version 10.0 (Build 17763)
Java 版本: Java 1.8.0_121-b13 with Oracle Corporation Java HotSpot(TM) 64-Bit Server VM mixed mode
------------------------------------------------------------------------------------------------
Parallel Computing Toolbox                            版本 6.11             (R2017b)
```

Home -> Parallel --> Manage Cluster Profiles -> click 'local' configuration -> validate

- GPU support

```
>> gpuDevice
```

### Part 3

- `parfor` to replace `for`

```matlab
% start
gcp;
% or
parpool('local;, N) % N workers
% stop
delete(gcp('nocreate'))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
```

### Part 4

- 不可以递归
- 循环必须为整数
- 可以写进函数

### Part 5-7

batch processing

```
job = batch(@fun, <number of output>, <cell array containing input>)
```

`spmd`

```
spmd
	data = load('xxx')
end
```

### Part 9 GPU computing

```
transfer data to GPU
run GPU code
transfer data back to CPU
```

`gpuArray`

> <https://ww2.mathworks.cn/help/parallel-computing/pagefun.html

```
A = zeros(4, 4)
A = gpuArray(A)
% below is better
A = zeros(4, 4, 'gpuArray')

methods gpuArray % to check for built-in function

gather % used for transforming back

arrayfun/pagefun % 支持gpuArray
```

