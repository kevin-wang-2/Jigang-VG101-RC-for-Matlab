clear;
clc;
testcases = ["1+1", "1-1", "1*1", "1/1", "-1+1", "-1-1", "-1*1", "-1/1",...
            "1.1+1", "1+1.1", "1.2 *1.2", "1.44/ 1.2"];
std = [2, 0, 1, 1, 0, -2, -1, -1, 2.1, 2.1, 1.44, 1.2];

for i = 1:12
    try
        result = myEval(char(testcases(i)));
        if result ~= std(i)
            fprintf('%s answer = %f, WA = %f\n', testcases(i), std(i), result);
        end
    catch ex
        disp(ex);
    end
end