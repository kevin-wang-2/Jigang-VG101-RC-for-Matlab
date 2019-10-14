function ret = myEval(s)
    if contains(s, '+')
        pos = strfind(s, '+');
        ret = str2double(s(1:pos - 1)) + str2double(s(pos + 1:end));
    elseif contains(s, '*')
        pos = strfind(s, '*');
        ret = str2double(s(1:pos - 1)) * str2double(s(pos + 1:end));
    elseif contains(s, '/')
        pos = strfind(s, '/');
        ret = str2double(s(1:pos - 1)) / str2double(s(pos + 1:end));
    elseif contains(s, '-')
        pos = strfind(s, '-');
        if length(pos) == 2
            pos = pos(2);
        end
        ret = str2double(s(1:pos - 1)) - str2double(s(pos + 1:end));
    end
end