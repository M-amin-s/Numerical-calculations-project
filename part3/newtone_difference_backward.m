function output = newtone_difference_backward(points,  x,  precision, showFigure)
%output has this format{answer estimated for the x; function(string format); function for printing(string with correct floating points);
%table for printing}
%useful variables
points = sortrows(points);
X = points(:, 1);
Y = points(:, 2);
n = size(X, 1);%it is the number of points
if(n>=2)
    h = X(2) - X(1);
end

%check if the x's are ok
for i =3:n
    if(abs(X(i) - X(i-1) - X(2) + X(1)) > 1e-10)
        fprintf('This methode is not suitable for your data because the distances are not the same');
        output = {-1; -1; -1; -1};
        return;
    end
end

%---make the table---
table = zeros(n, n+1);%it is the table of newtone divided differnces
table(:, 1) = X;%set the first row of this table with X of points
table(:, 2) = Y;%set the second row of this table with Y of points

%---calculating the table and table_clean
%calculating the table
for i = 3:n+1
    for j = i-1:n
        table(j, i) = (table(j, i-1) - table(j-1, i-1));
    end
end
%calculating the table_clean
table_clean = '';
for i = 1:n
    for j = 1:n+1
        if(j > 1)
            if(j == n)
                t1 = sprintf('%%s\t(%%.%df)', precision);
            else
                t1 = sprintf('%%s\t%%.%df', precision);
            end
            table_clean = sprintf(t1,table_clean, table(i, j));
        else
            if(j == n)
                t1 = sprintf('%%s(%%.%df)', precision);
            else
                t1 = sprintf('%%s%%.%df', precision);
            end
            table_clean = sprintf(t1,table_clean,  table(i, j));
        end
    end
    table_clean = sprintf('%s\n', table_clean);
end

%---making the func  & func_clean
for i = 1:n
    if(i >1)
        func = sprintf('%s+%d', func, table(n, i+1));
        t1 = sprintf('%%s+%%.%df', precision);
        func_clean = sprintf(t1, func_clean, table(n, i+1));
        %adding the (r -i) part
        for j = 1:i-1
            func = sprintf('%s*(r+%d)', func, j-1);
            if(j==1)
                t1 = sprintf('%%s(r)');
                func_clean = sprintf(t1, func_clean);
            else
                t1 = sprintf('%%s(r+%%.0f)');
                func_clean = sprintf(t1, func_clean, j-1);
            end
        end
    else
        func = sprintf('%d', table(n, i+1));
        t1 = sprintf('%%.%df', precision);
        func_clean = sprintf(t1, table(n, i+1));
    end
    
    %adding the factorial part
    if(i>1)
        func = sprintf('%s/(factorial(%d))',func, i-1);
        func_clean = sprintf('%s/(%d!)',func_clean, i-1);
    end
end

func_clean = three_blade(func_clean);
f = sprintf('@(r)%s', func);
f = str2func(f);
r = (x-X(n))/h;
y = f(r);
output = {y; func; func_clean; table_clean; r};
if(showFigure == 1)
   fig = figure();
   set(fig, 'resize', 'off');
   rows = strsplit(table_clean, '\n');
   disp(rows);
   row = zeros(0,0);
   for i = 1:n
       row = [row;strsplit(char(rows(i)), '\t')];
   end
   
   cName = 'x y';
   for i = 2:n
       cName = sprintf('%s #%d',cName ,i);
   end
   uitable('Data', row, 'ColumnName', strsplit(cName, ' '), 'Position', [20 200 500 200]);
   
%show the func
str = func_clean;
edit1 = uicontrol(fig, 'Style','edit', 'FontSize',9, ...
    'Min',0, 'Max',2, 'HorizontalAlignment','left', ...
    'Units','normalized', 'Position',[0.05 0.05 0.9 0.35], ...
    'String',str);

t3 = sprintf('Function for calculating is(at r = %%.%df) :', precision);
edit2 = uicontrol(fig, 'Style','text', 'FontSize',15, ...
    'Min',0, 'Max',2, 'HorizontalAlignment','left', ...
    'Units','normalized', 'Position',[0.03 0.41 1 0.05], ...
    'String',sprintf(t3, r));

edit3 = uicontrol(fig, 'Style','text', 'FontSize',15, ...
    'Min',0, 'Max',2, 'HorizontalAlignment','left', ...
    'Units','normalized', 'Position',[0.03 0.95 1 0.05], ...
    'String','Table of the method:');

end
end
