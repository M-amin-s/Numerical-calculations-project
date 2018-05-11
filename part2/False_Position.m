function y = False_Position (f, x_0, x_n, number_iter)
    syms x
    syms func(x)
    func(x) = f;
    x_m = double((x_0 * abs(func(x_0)) + x_n * abs(func(x_n)))/(abs(func(x_0)) + abs(func(x_n))))
    if (number_iter == 0)
        y = x_m;
    else
        if(func(x_0) * func(x_m) < 0)
            x_n = x_m;
        else
            x_0 = x_m;
        end
        y = False_Position(f, x_0, x_n, number_iter - 1);
    end
end

        
        