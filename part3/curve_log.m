function output = curve_log(points, precision)%output{1}is coefs and output{2} is the linear fnction string
X = points(:, 1);
Y = points(:, 2);
X = log(X);

temp = curve_linear([X, Y], precision);
coefs = temp{1};
func = sprintf('%d  + %d * log(x)', coefs(1), coefs(2));
t2 =sprintf('%%.%df  + %%.%df * log(x)', precision, precision);
func_clear = sprintf(t2, coefs(1), coefs(2));
output = {coefs; func;func_clear};
end