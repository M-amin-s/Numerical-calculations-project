function res = GaussLegendre(f, x_0, x_n, n)
    f = sprintf('@(x)%s', f);
    func = str2func(f);
    syms t;
    roots = vpasolve(legendreP(n,t) == 0);
    w = ones(n);
    legendre_func = legendreP(n, t);
    legendre_diff = diff(legendre_func, t, 1);
    legendre_diff = sprintf('@(t)%s', legendre_diff);
    diff_func = str2func(legendre_diff);
    for i = 1:n
        w(i) = 2 /( (1 - roots(i)^2) * (diff_func(roots(i))^2) );
    end
    res = 0;
    for i = 1:n
        res = res + w(i) * func(((x_n - x_0) / 2) * roots(i) + (x_n + x_0) /2);
    end
    res = res * ((x_n - x_0)/2);
end