function ret = isPalindrome(s)
    if s(1) ~= s(end)
        ret = false;
    elseif length(s) == 1
        ret = true;
    else
        ret = isPalindrome(s(2:end - 1));
    end
end