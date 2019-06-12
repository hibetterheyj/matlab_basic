x1 = 0.01:0.01:20;
x2 = 0.01:0.01:20;
[X, Y] = meshgrid(x1, x2);
Z = X+1./X+Y+1./Y;
surf(X,Y,Z)