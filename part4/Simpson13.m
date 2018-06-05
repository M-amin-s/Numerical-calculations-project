function res = Simpson13(f, x_0, x_n, h)
    f = sprintf('@(x)%s', f);
    func = str2func(f);
    sum = func(x_0);
    t = 1;
    x_t = x_0 + h;
    while x_t <= (x_n - h)
       if mod(t,2) == 1
           sum = sum + 4 * func(x_t);
       else
           sum = sum + 2 * func(x_t);
       end
       t = t + 1;
       x_t = x_t + h;
    end
    sum = sum + func(x_n);
    res = (h/3) * sum;
end