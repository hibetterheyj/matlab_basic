% ex1_4.m
X = [0, 1, 2, 3, 4, 5, 6, 10, 12, 15, 16];
Y = [1, 7, 23, 109, 307, 400, 307, 123, 69, 24, 6];

Fit4 = polyfit(X, Y, 4);
Formula4 = poly2str(Fit4, 'X');
Y4 = polyval(Fit4, X);
Fit5 = polyfit(X, Y, 5);
Formula5 = poly2str(Fit5, 'X');
Y5 = polyval(Fit5, X);
Fit6 = polyfit(X, Y, 6);
Formula6 = poly2str(Fit6, 'X');
Y6 = polyval(Fit6, X);
Fit7 = polyfit(X, Y, 7);
Formula7 = poly2str(Fit7, 'X');
Y7 = polyval(Fit7, X);
plot(X, Y, 'o', X, Y4, 'm--.', X, Y5, 'k-.', X, Y6, 'r-', X, Y7, 'b:');

legend('data', 'poly4', 'poly5', 'poly6', 'poly7');
xlim([0,16]);
ylim([0,400]);