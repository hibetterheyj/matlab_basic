function [sys,x0,str,ts,simStateCompliance] = ex4_3(t,x,u,flag,k,a1,a2,g,m)
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
end