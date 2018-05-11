function y = Brent (f, x_1, x_2, x_3, number_iter)
    syms x
    syms func(x)
    func(x) = f;
    R = func(x_2) / func(x_3);
    S = func(x_2) / func(x_1);
    T = func(x_1) / func(x_3);
    P = S *(T * (R - T) * (x_3 - x_2) - (1 - R) * (x_2 - x_1));
    Q = (T - 1) * (R - 1) * (S - 1);
    x_m = x_2 + P/Q;
    if (number_iter == 0)
        y = x_m;
    else
        if(x_m < x_2)
            y = Brent(f, x_1, x_m, x_2, number_iter - 1)
        else
            y = Brent(f, x_2, x_m, x_3, number_iter - 1)
        end
    end
end

        
        