function res = reverseNum(num)
    length = floor(log10(num)) + 1;
    res = 0;
    for i = 1:length
        res = res * 10 + getDigit(num, i);
    end
end