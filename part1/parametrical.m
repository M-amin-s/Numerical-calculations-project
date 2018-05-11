
function out = parametrical(str)
    arr = strfind(str, '+');
    brr = strfind(str, '-');
    
    if length(arr) ~= 0
        str1 = str(1:arr(1)-1);
        str2 = str(arr(1)+1:length(str));
        str1 = parametrical(str1);
        str2 = parametrical(str2);
        out=[str1, '+',str2];
        return;
    elseif length(brr) ~= 0
        str1 = str(1:brr(1)-1);
        str2 = str(brr(1)+1:length(str));
        str1 = parametrical(str1);
        str2 = parametrical(str2);
        out=[str1, '+',str2];
        return;
    end
    
    arr = strfind(str, '*');
    
    if ~isempty(arr)
        str1 = str(1:arr(1)-1);
        str2 = str(arr(1)+1:length(str));
        out = strcat('|', str1, '|*(', parametrical(str2), ')+', '|', str2, '|*(', parametrical(str1), ')');
        return;
    end
    
    arr = strfind(str, '/');
    
    if length(arr) ~= 0
        str1 = str(1:arr(1)-1);
        str2 = str(arr(1)+1:length(str));
        out = strcat('(|', str1, '|*', parametrical(str2), '+', '|', str2, '|*', parametrical(str1), ')', '/(', str2,')^2');
        return;
    end
    
    arr = strfind(str, '^');
    
    if length(arr) ~= 0
       str1 = str(1:arr(1)-1);
       str2 = str(arr(1)+1:length(str));
       if isletter(str2(1))
           out = strcat('e(', str, ')');
           return
       else
           out = strcat(str2, '*', str1, '^(', str2, '-1)', '*', 'e(', str1, ')');
           return
       end
    end
    
    if isletter(str(1))
       out = strcat('e(', str, ')');
       return;
    end
    
    out = '0';
    return;
    
end