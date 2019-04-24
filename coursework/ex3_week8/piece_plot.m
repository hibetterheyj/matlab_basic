function piece_plot(start, stop)
if stop < start
    error('Input error');
else
    if start > 0
        [x1,y1]=fplot('x^2+(1+x)^(1/4)',[start,stop]);
        plot(x1,y1,'k');
        gtext('x>0');
    elseif stop < 0
        [x2,y2]=fplot('x^3+sqrt(1-x)',[start,stop]);
        plot(x2,y2,':b');
        gtext('x<=0');
    else
        [x1,y1]=fplot('x^2+(1+x)^(1/4)',[0,stop]);
        [x2,y2]=fplot('x^3+sqrt(1-x)',[start,0]);
        plot(x1,y1,'k',x2,y2,':b');
        gtext('x>0');gtext('x<=0');
    end
end
end