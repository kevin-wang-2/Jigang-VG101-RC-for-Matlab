function L = findDivisor(num)
    L = [];
    for i = 1:num
        if mod(num, i) == 0
            L = [L i];
        end
    end
end