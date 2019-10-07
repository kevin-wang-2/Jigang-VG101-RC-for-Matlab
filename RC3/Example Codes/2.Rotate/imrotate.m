function imrotate(filename)
    img = imread(filename);
    imwrite(img(:, end:-1:1)');
end