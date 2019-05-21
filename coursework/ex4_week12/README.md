### ex4_week12

> run in R2018b

- 运用simulink，求解以下微分方程

![](http://latex.codecogs.com/gif.latex?\ \mathrm{m} \ddot{\mathrm{x}}=\mathrm{mg}+\mathrm{f}-\mathrm{a}_{1} \dot{\mathrm{x}}-\mathrm{a}_{2}|\dot{\mathrm{x}}| \dot{\mathrm{x}})

其中，当![](http://latex.codecogs.com/gif.latex?\ {\mathrm{x}>0)时，![](http://latex.codecogs.com/gif.latex?\ \mathrm{f}=- \mathrm{kx})，当![](http://latex.codecogs.com/gif.latex?\ \mathrm{x} \leq 0)时，![](http://latex.codecogs.com/gif.latex?\ \mathrm{f}= 0)。

参数配置：![](http://latex.codecogs.com/gif.latex?\ \mathrm{k}=5, \ \mathrm{a}_{1}=\mathrm{a}_{2}=1, \ \mathrm{g}=10, \ \mathrm{m}=70)

画出simulink模型框图，并将结果画图。

**框图**

![ex4_1_block](ex4_1_block.png)

**结果（仿真T=200.0）**

![ex4_1_result](ex4_1_result.png)

- 将第一题的微分方程求解模型进行子系统封装，画出模型图，展示参数配置对话框。

**框图**

![ex4_2_block](ex4_2_block.png)

**参数设置**

![ex4_2_params](ex4_2_params.png)

- 试用构造S-函数方法，求解第一题的微分方程，将模型图画出，并展示S-函数的M文件的内容（文件中的注释语句请去掉），其求解结果请画图，并与第一题求解结果进行对比。

**代码**

```matlab
function [sys,x0,str,ts,simStateCompliance] = ex4_S_function(t,x,u,flag,k,a1,a2,g,m)
k = 5; a1 = 1; a2 = 1; g = 10; m = 70;
switch flag
    case 0
        [sys,x0,str,ts,simStateCompliance] = mdlInitializeSizes;
    case 1
        sys = mdlDerivates(t,x,u,k,a1,a2,g,m);
    case 2
        sys = mdlUpdate(t,x,u);
    case 3
        sys = mdlOutputs(t,x,u);
    case 4
        sys = mdlGetTimeOfNextVarHit(t,x,u);
    case 9
        sys = mdlTerminate(t,x,u);
    otherwise
        error('wrong')
end

    function [sys,x0,str,ts,simStateCompliance] = mdlInitializeSizes
        sizes = simsizes;
        sizes.NumContStates = 2;
        sizes.NumDiscStates = 0;
        sizes.NumOutputs = 1;
        sizes.NumInputs = 0;
        sizes.DirFeedthrough = 0;
        sizes.NumSampleTimes = 1;
        sys=simsizes(sizes);
        x0 = [0];
        str = [];
        ts = [0 0]; % 适用于连续系统
        simStateCompliance = 'UnknownSimState';
    end

    function sys = mdlDerivates(t,x,u,k,a1,a2,g,m)
        k = 5; a1 = 1; a2 = 1; g = 10; m = 70;
        if x(1) > 0
            f = -k*x(1);
        else
            f = 0;
        end
        dx = x(2);
        ddx = g + 1/m * (f - a1*x(2) - a2*abs(x(2))*x(2));
        sys = [dx;ddx];
    end

    function sys = mdlOutputs(t,x,u)
        sys = x(1);
    end

    function sys=mdlUpdate(t,x,u)
        sys = [];
    end

    function sys=mdlTerminate(t,x,u)
        sys = [];
    end
end
```

**框图**

![ex4_3_block](ex4_3_block.png)

**结果（仿真T=150.0）**

![ex4_3_result](ex4_3_result.png)