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