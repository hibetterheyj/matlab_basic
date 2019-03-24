function volumn = hollow_sphere()
    r1 = input('outer diameter: ');
    r2 = input('inner diameter: ');
    volumn = 3/4 * pi * (r1^3 - r2^3);
    disp(volumn);
end