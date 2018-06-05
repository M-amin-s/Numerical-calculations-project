function points = str_2_points(str, n)
    X = zeros(n, 1);
    Y = zeros(n, 1);
    points_str = strsplit(str, ';');
    for i=1:n
       point = strsplit(points_str{i}, ':');
       X(i) = str2num(point{1});
       Y(i) = str2num(point{2});
    end
    points = [X, Y];
end