function output  = find_points(func_str, p1, p2, n)
f = sprintf('@(x)%s', func_str);

f = str2func(f);
n = n-1;
if(n ~= 0)
    step = (p2-p1)/n;
    X = (p1:step:p2)';
else
    X = p1;
end

    m = size(X, 1);
    Y = zeros(m, 1);
    for i=1:m
        Y(i) = f(X(i));
    end
    output = [X, Y];
end