function res = CustomizedSimpson(f, x_0, x_n, h)
    n = fix((x_n - x_0), h);
    if mod(n,2) == 0
        res = Simpson13(f, x_0, x_n, h);   
    else
        res = Simpson13(f, x_0, x_n - 3 * h, h) + Simpson38(f, x_n - 3 * h, x_n, h);
    end
end