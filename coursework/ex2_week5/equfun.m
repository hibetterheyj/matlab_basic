% equfun.m
function dy = equfun(x, y)
dy = zeros(2, 1);
dy(1) = y(2);
dy(2) = 2 * y(2) - 5 * y(1) + exp(x) * sin(x);
end