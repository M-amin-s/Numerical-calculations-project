function y = Newton_Raphson(f, x_0, n)
    if(n == 0)
        y = x_0;
    else
        syms x
        syms func(x)
        func(x) = f;
        func_prime = diff(func);
        x_next = x_0 - double(func(x_0)/func_prime(x_0));
        y = Newton_Raphson(f, x_next, n - 1);
    end
end