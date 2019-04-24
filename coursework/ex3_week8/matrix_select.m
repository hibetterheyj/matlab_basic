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