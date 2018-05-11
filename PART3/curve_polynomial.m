function output = curve_polynomial(points, degree, precision)

% extracting 'X' and 'Y' out of the 'points'
X = points(:, 1);
Y = points(:, 2);

%sum_X(i) is the sum(X.^(i-1))
sum_X = zeros(1, 2*degree+1);
for i = 1:2*degree+1
        sum_X(1, i) = sum(X.^(i-1));
end

%sum_XY(i) is the sum(X.^(i-1) .* Y)
sum_XY = zeros(1, degree+1);
for i = 1:degree+1
        sum_XY(1, i) = sum(X.^(i-1) .*Y);
end

%creating M_1
M_1 = zeros(degree+1, degree+1);
for i = 1:degree+1
        for j = 1:degree+1
                M_1(i, j) = sum_X(1, i+j-1);
        end
end

%creating M_2
M_2 = zeros(degree+1, 1);
for i = 1:degree+1
        M_2(i, 1) = sum_XY(i);
end

%calculate coefs which is (m+1, 1)
coefs = linsolve(M_1, M_2);
size(coefs);
func = '';
func_clear = '';
for i = 1:degree+1
    if(i>1)
        if(abs(coefs(i, 1)) < (10^(-precision)))
            continue;
        end
    func = sprintf('%s+%d*x^%d', func, coefs(i, 1), i-1);
    t2 =sprintf('%%s+%%.%df*x^{%%d}', precision);
     func_clear = sprintf(t2, func_clear, coefs(i, 1), i-1);
    else
        func = sprintf('%d', coefs(i, 1));
        t2 =sprintf('%%.%df', precision);
        func_clear = sprintf(t2,coefs(i, 1));
    end
end

output = {coefs; func; func_clear};
end

