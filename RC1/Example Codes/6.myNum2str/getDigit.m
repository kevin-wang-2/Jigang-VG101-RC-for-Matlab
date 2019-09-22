function digit = getDigit(number, n)
    digit = mod(floor(number / 10 ^ (n - 1)), 10);
end