name={'Jack','Marry','Peter','Rose','Tom'};
score=[72,83,56,94,100];
for i=1:5
    switch floor(score(i)/10)
        case 10
            rank(i)={'����'};
        case 9
            rank(i)={'����'};
        case 8
            rank(i)={'����'};
        case {6,7}
            rank(i)={'����'};
        otherwise
            rank(i)={'������'};
    end
end
disp('ѧ������  �÷�  �ȼ�')

for i=1:5
disp([char(name(i)),'   ',num2str(score(i)),'    ',char(rank(i))]);
end