function res = differentiationOh2(f, x, degree, h)
    f = sprintf('@(x)%s', f);
    func = str2func(f);
    n = degree;
    delta1 = 0;
    delta2 = 0;
    for i = 0:n
       delta1 = delta1 + (-1)^i * func(x-h/2 + (n/2 - i) * h) * nchoosek(n, i);
       delta2 = delta2 + (-1)^i * func(x+h/2 + (n/2 - i) * h) * nchoosek(n, i);
    end
    delta = (delta1 + delta2)/2;
    res = delta / (h^n);
end