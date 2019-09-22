function plate = plate()
s = '1234567890QWERTYUIOPASDFGHJKLZXCVBNM';
plate = zeros(1,5);
for i = 1:5
    rc = s(ceil(rand(1, 1) * length(s))); %string in ASCII code
    plate(i) = rc;
end
plate = char(plate); %Or: plate = '     ' and delete this line