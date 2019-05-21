- 运用simulink，求解以下微分方程

$$
\mathrm{m} \ddot{\mathrm{x}}=\mathrm{mg}+\mathrm{f}-\mathrm{a}_{1} \dot{\mathrm{x}}-\mathrm{a}_{2}|\dot{\mathrm{x}}| \dot{\mathrm{x}}
$$

其中，$ \mathrm{f}=\left\{\begin{array}{ll}{-\mathrm{kx},} & {\mathrm{x}>0} \\ {0} & {\mathrm{x} \leq 0}\end{array}\right. $

参数配置：$ \mathrm{k}=5, \ \mathrm{a}_{1}=\mathrm{a}_{2}=1, \ \mathrm{g}=10, \ \mathrm{m}=70 $

画出simulink模型框图，并将结果画图。

**框图**

![ex4_1_block](ex4_1_block.png)

**结果**

![ex4_1_result](ex4_1_result.png)

- 将第一题的微分方程求解模型进行子系统封装，画出模型图，展示参数配置对话框。

**框图**

![ex4_2_block](ex4_2_block.png)

**参数设置**

![ex4_2_params](ex4_2_params.png)