function ret = reverse(arr)
    if length(arr) == 1
        ret = arr;
    else
        ret = [reverse(arr(2:end)) arr(1)];
    end
end