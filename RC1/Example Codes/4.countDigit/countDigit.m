function digit = countDigit(num)
    digit = 0;
    while num > 0
        digit = digit + 1;
        num = round(num / 10);
    end
end