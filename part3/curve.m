function output = curve(points, curveTo, stringFunc, showFigure, precision)
%curveTo is
%0 represents best fitting function
% 1 represents y = a*e^(bx)
%2 represents y = a*log(x) + b
%3 represents y = a/x + b
%4 represents y = 1/(ax+b)
%>=5 represents poynomial degree(curvTo - 5) so curveTo = 7 represents
%polynomial degree 2
X = points(:, 1);
Y = points(:, 2);
best = 0;
switch(curveTo)
    case 0%user's stringFunc
        best = inf;
        disp(best);
        for i = 1:10
            te = curve(points, i, stringFunc, 0, precision);
            test = cost(points, te{2});
            fprintf('%d %.10f', i, test);
            if(test < best && isnan(test) == false)
                temp = te;
                best = test;
            end
            if(test < 10^(-precision))
                break;
            end
        end
    case 1
        temp = curve_expo(points, precision);
    case 2
        temp = curve_log(points, precision);
    case 3
        temp = curve_frac(points, precision);
    case 4
        temp = curve_cfrac(points, precision);
    otherwise
        temp = curve_polynomial(points, curveTo - 5, precision);%so it is not possible to fixed numebr now!
end


if(showFigure == 1)
    %getting the func out of its string format
    f = sprintf('@(x)%s', temp{2});
    fprintf(temp{2});
    f = str2func(f);
    %plottig the dots and the function estimated
    figure();
    plot(X, Y, 'r*');
    xlabel('x'), ylabel('y'), title('curve');
    
    %plotting the function
    %---getting the range of x
    min_x = min(X);
    max_x = max(X);
    x_range  = max_x - min_x;
    x_first = min_x - x_range/3;
    x_second = max_x + x_range/3;
    XP = x_first:(x_range/100):x_second;
    YP = zeros(1, size(XP, 2));
    for i = 1:size(XP, 2)
        YP(i) = f(XP(i));
    end
    
    %setting the y limits so the plot is charming
    min_y = min(min(Y), min(real(YP)));
    max_y = max(max(Y), max(real(YP)));
    y_range = max_y - min_y;
    ylim([min_y - y_range/3, max_y + y_range/3]);
    
    
    hold on;
    plot(XP, YP, 'b');
    legend('location', 'southeast', 'data',temp{3});
end

output = temp;

end




%TODO please implement the support for user inputed function like this
% user get us a*x^2 + b*sin(x) + c*cos(x)
% we will minimize the cost function for him using gradiants and then
% output the minimized coeffiecients

