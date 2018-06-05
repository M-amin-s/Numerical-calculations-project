function res = Richardson(f, x, h, err)
    f = sprintf('@(x)%s', f);
    f = str2func(f);
    R = ones(101, 101);
    res = 0;
    R(1, 1) = (f(x + h) - f(x - h))/(2*h);
    for i=1:100
        h = h/2;
        R(i + 1, 1) = (f(x + h) - f(x - h))/(2*h);
        for j=1:i
            R(i + 1, j + 1) = (4^j*R(i + 1, j) - R(i, j))/(4^j - 1);  
        end
        if ( abs( R(i + 1, i + 1) - R(i, i) ) < err )
            res = R(i+1, i+1);
            break;
        elseif ( i == 100 )
            error( 'Richardson extrapolation failed to converge' );
        end
    end
end