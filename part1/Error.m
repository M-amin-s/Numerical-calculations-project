
function out = Error(str, inputs, approxs)
    func = inline(str, 'a', 'b', 'c', 'd', 'e', 'f');
    exact = func(inputs(1), inputs(2), inputs(3), inputs(4), inputs(5), inputs(6));
    app = func(approxs(1),approxs(2), approxs(3), approxs(4), approxs(5), approxs(6));
    matrix = zeros(1, 14);
    i = 1;
    j = 1;
    while i < 7
       matrix(1, j) = abs(inputs(i)-approxs(i));
       matrix(1, j+1) = abs(inputs(i)-approxs(i))/abs(inputs(i));
       j=j+2;
       i = i + 1;
    end
    matrix(1, 13) = exact;
    matrix(1, 14) = abs(exact-app);
    matrix(1, 15) = matrix(1, 14)/abs(exact);
    out = matrix;
end


