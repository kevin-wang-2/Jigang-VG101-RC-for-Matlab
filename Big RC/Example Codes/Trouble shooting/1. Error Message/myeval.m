function ret = myeval(str)
    a = 1;
    m = 0;
    n = 0;
    x = length(str);
    y = 0;
    if str(1) == '-'
        y = 1;
        a = a + 1;
    end
    while str2double(str(a)) >= 0 && str2double(str(a)) <= 9
        m = str2double(str(a)) + m * 10;
        a = a + 1; c = a;
    end
    if str(a) == '.'
        a = a + 1;
        while str2double(str(a)) >= 0 && str2double(str(a)) <= 9
            m = m + str2double(str(a)) * 10 ^ (-a + c);
            a = a + 1;
        end
    end
    if str(a) == ' '
        b = a + 1;
        a = a + 2;
    else
        b = a;
        a = a + 1;
    end
    if str(a) == ' '
        a = a + 1;
    end
    while str2double(str(a)) >= 0 && str2double(str(a)) <= 9
        n = str2double(str(a)) + n * 10;
        a = a + 1;
        d = a;
        if a > x
            break
        end
    end
    if str(a) == '.'
        a = a + 1;
        while str2double(str(a)) >= 0 && str2double(str(a)) <= 9
            m = m + str2double(str(a)) * 10  ^(-a + d);
            a = a + 1;
            if a > x
                break
            end
        end
        if y == 1
            m = -m;
        end
        if str(b) == '+'
            ret = m + n;
        elseif str(b) == '-'
            ret = m - n;
        elseif str(b) == '*'
            ret = m * n;
        elseif str(b) == '/'
            ret = m / n;
        end
    end