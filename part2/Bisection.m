function y = Bisection(f, x_0, x_n, number_iter)
    if (number_iter == 0)
        y = (x_n + x_0)/2
    else
        syms x
        syms func(x)
        func(x) = f;      
        x_m = (x_n + x_0)/2;
        if(func(x_0) * func(x_m) < 0)
            x_n = x_m;
        else
            x_0 = x_m;
        end
        y = Bisection(f, x_0, x_n, number_iter - 1);
    end
end

        
        