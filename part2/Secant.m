function y = Secant (f, x_0, x_n, number_iter)
    syms x
    syms func(x)
    func(x) = f;
    x_m = double((x_0 * func(x_n) - x_n * func(x_0))/(func(x_n) - func(x_0)));
    x = x_m;
    if (number_iter == 0)
        y = x_m;
    else
        if(x_m > x_n)
            y = False_Position(f, x_n, x_m, number_iter - 1);
        else
            y = False_Position(f, x_m, x_0, number_iter - 1);
        end
    end
end

        
        