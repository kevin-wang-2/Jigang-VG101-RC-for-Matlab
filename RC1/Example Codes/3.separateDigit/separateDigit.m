function L = separateDigit(number)
    length = floor(log10(number)) + 1;
    L = zeros(1, length);
    for i = 1:length
        L(i) = getDigit(number, length - i + 1);
    end
end