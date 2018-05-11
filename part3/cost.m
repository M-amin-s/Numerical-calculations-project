function output = cost(points, f)
f = sprintf('@(x)%s', f);
f = str2func(f);
X = points(:, 1);
Y = points(:, 2);
n = size(X, 1);%it is the number of points
E = zeros(n, 1);
for i = 1:n
    E(i) = Y(i) - f(X(i));
end
output = rms(E);
end