function res = arcsin(x)
if abs(x) < 1
    res = 0;
    n = 1;
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