function res = Trapezoidal(f, x_0, x_n, h)
    f = sprintf('@(x)%s', f);
    func = str2func(f);
    x_t = x_0 + h;
    sum = func(x_0);
    while x_t <= x_n
        sum = sum + 2 * func(x_t);
        x_t = x_t + h;
    end
    sum = sum - func(x_n);
    res = (h/2) * sum;
end