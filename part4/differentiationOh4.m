function res = differentiationOh4(f, x, degree, h)
    f = sprintf('@(x)%s', f);
    func = str2func(f);
    if degree == 1
        res = (-func(x+2*h) + 8 * func(x+h) - 8 * func(x-h) + func(x-2*h))/(12*h);
    elseif degree == 2
        res = (-func(x+2*h) + 16 * func(x+h) -30 * func(x) + 16 * func(x-h) - func(x-2*h))/(12*h^2);
    elseif degree == 3
        res = (-func(x+3*h) + 8*func(x+2*h) - 13*func(x+h) + 13 * func(x-h) - 8*func(x-2*h) + func(x-3*h))/(8*h^3);
    elseif degree == 4
        res = (-func(x+3*h) + 12*func(x+2*h) - 39*func(x+h) + 56*func(x) - 39*func(x-h) + 12*func(x-2*h) - func(x-3*h))/(6*h^4);
    else
        res = differentiationOh2(f, x, degree, h);
    end
end