function generateCircle(radius)
    img = zeros(300, 400);
    thetas = 0:0.01:(2*pi);
    x = radius * cos(thetas) + 150;
    y = radius * sin(thetas) + 200;
    for ii = 1:length(thetas)
        img(floor(x(ii)), floor(y(ii))) = 255;
    end
    imwrite(img, 'output.bmp');
end