function answer = three_blade(str)
answer = str;
if(size(str+0, 2)==0)
    answer = '';
    return;
end

if(str(1) == '+')
    answer = three_blade(str(2:end));
    return;
end

for i = 1:size(str+0, 2)-1
    if(str(i) == '-' && str(i+1) == '-')
        answer = sprintf('%s%s%s',str(1:i-1),'+',three_blade(str(i+2:end)));
       break;
    end
      if(str(i) == '+' && str(i+1) == '-' ||str(i) == '-' && str(i+1) == '+'  )
        answer = sprintf('%s%s%s',str(1:i-1),'-',three_blade(str(i+2:end)));
      break;
      end
end
end