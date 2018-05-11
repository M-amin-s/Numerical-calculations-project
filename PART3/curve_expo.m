function output = curve_expo(points, precision)%output{1}is coefs and output{2} is the linear fnction string
X = points(:, 1);
Y = points(:, 2);
Y = log(Y);

temp = curve_linear([X, Y], precision);
coefs = temp{1};
coefs(1) = exp(coefs(1));%what we have is ln(a) so we make it a itself
func = sprintf('%d*exp(%d*x)', coefs(1), coefs(2));
t2 = sprintf('%%.%df*e^{(%%.%dfx)}', precision, precision);
func_clear =  sprintf(t2, coefs(1), coefs(2));
output = {coefs; func;func_clear};
end