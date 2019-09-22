function L = separateDigit_s(number) 
    length = floor(log10(number)) + 1;
    L = zeros(1, length);
    i = 1;
    while number > 0
        L(length - i + 1) = mod(number, 10);
        i = i + 1;
        number = round(number / 10);
    end
end