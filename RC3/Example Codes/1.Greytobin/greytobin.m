function greytobin(thres)
imwrite(imread("input.bmp") .* (imread("input.bmp") > thres), "output.bmp");
end