function res = Romberg(f, x_0, x_n, n)
    h = ones(1, n + 1);
    h(1) = x_n - x_0;
    for i = 2:(n+1)
        h(i) = h(i-1) / 2;
    end
    T = zeros(n+1, n+1);
    for i = 1:(n+1)
        T(i, 1) = Trapezoidal(f, x_0, x_n, h(i));
    for i = 2:(n+1)
        for j = i:(n+1)
            T(j, i) = ((4^(i-1)) * T(j, i-1) - T(j-1, i-1))/ (4^(i-1) - 1);
        end
    end
    res = T(n+1, n+1);
end