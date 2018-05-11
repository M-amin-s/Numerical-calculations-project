function output = curve_linear(points, precision)%output{1}is coefs and output{2} is the linear fnction string
    output = curve_polynomial(points, 1, precision);
end