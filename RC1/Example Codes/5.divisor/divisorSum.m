function res = divisorSum(num)
    if sum(findDivisor(num)) == 2 * num
        res = true;
    else
        res = false;
    end
end