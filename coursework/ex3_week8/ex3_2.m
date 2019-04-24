name={'Jack','Marry','Peter','Rose','Tom'};
score=[72,83,56,94,100];
for i=1:5
    switch floor(score(i)/10)
        case 10
            rank(i)={'满分'};
        case 9
            rank(i)={'优秀'};
        case 8
            rank(i)={'良好'};
        case {6,7}
            rank(i)={'及格'};
        otherwise
            rank(i)={'不及格'};
    end
end
disp('学生姓名  得分  等级')

for i=1:5
disp([char(name(i)),'   ',num2str(score(i)),'    ',char(rank(i))]);
end