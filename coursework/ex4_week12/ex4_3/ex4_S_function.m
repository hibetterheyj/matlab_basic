function [sys,x0,str,ts,simStateCompliance] = ex4_S_function(t,x,u,flag,k,a1,a2,g,m)
k = 5; a1 = 1; a2 = 1; g = 10; m = 70;
switch flag
    case 0
        [sys,x0,str,ts,simStateCompliance] = mdlInitializeSizes;
    case 1
        sys = mdlDerivates(t,x,u,k,a1,a2,g,m);
    case 2
        sys = mdlUpdate(t,x,u);
    case 3
        sys = mdlOutputs(t,x,u);
    case 4
        sys = mdlGetTimeOfNextVarHit(t,x,u);
    case 9
        sys = mdlTerminate(t,x,u);
    otherwise
        error('wrong')
end

    function [sys,x0,str,ts,simStateCompliance] = mdlInitializeSizes
        sizes = simsizes;
        sizes.NumContStates = 2;
        sizes.NumDiscStates = 0;
        sizes.NumOutputs = 1;
        sizes.NumInputs = 0;
        sizes.DirFeedthrough = 0;
        sizes.NumSampleTimes = 1;
        sys=simsizes(sizes);
        x0 = [0];
        str = [];
        ts = [0 0]; % 适用于连续系统
        simStateCompliance = 'UnknownSimState';
    end

    function sys = mdlDerivates(t,x,u,k,a1,a2,g,m)
        k = 5; a1 = 1; a2 = 1; g = 10; m = 70;
        if x(1) > 0
            f = -k*x(1);
        else
            f = 0;
        end
        dx = x(2);
        ddx = g + 1/m * (f - a1*x(2) - a2*abs(x(2))*x(2));
        sys = [dx;ddx];
    end

    function sys = mdlOutputs(t,x,u)
        sys = x(1);
    end

    function sys=mdlUpdate(t,x,u)
        sys = [];
    end

    function sys=mdlTerminate(t,x,u)
        sys = [];
    end
end