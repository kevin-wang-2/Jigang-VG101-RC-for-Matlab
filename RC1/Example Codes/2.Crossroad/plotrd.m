function plotrd(w, light, car_right, car_top, ...
    car_left, car_bottom, n1, n2, n3, n4)
    %be careful of the input: not car_right(j1).position, cuz j1 is just an
    %intermediate variable. The whole structs(car_...) and the end point of
    %the original for loops (n1234) should be included.
    
    axis([0 7 0 7]); %construct a coordinate system
    axis equal;
    hold on; %display all plots
    
    %plot continuous edge of the road
    var1 = 3.5 - 0.5 * w;
    var2 = 3.5 + 0.5 * w;
    rd = plot([var1 , var1, 0], [0, var1, var1], 'k', ...
        [var2, var2, 7], [0, var1, var1], 'k', ...
        [0, var1, var1], [var2, var2, 7], 'k', ...
        [7, var2, var2], [var2, var2, 7], 'k'); 
    rd(1).LineWidth = 2;
    rd(2).LineWidth = 2;
    rd(3).LineWidth = 2;
    rd(4).LineWidth = 2;
    
    %plot the midlines
    plot([0, var1], [3.5, 3.5], '--', [var2, 7], [3.5, 3.5], '--', ...
        [3.5, 3.5], [0, var1], '--', [3.5, 3.5], [var2, 7], '--');

    %plot the lights
    theta = 0 : .01 : 2*pi; %construct a circle
    r = 0.1; %make it a small circle
    x1 = var2 + r * cos(theta); y1 = var1 + r * sin(theta);
    x2 = var2 + r * cos(theta); y2 = var2 + r * sin(theta);
    x3 = var1 + r * cos(theta); y3 = var2 + r * sin(theta);
    x4 = var1 + r * cos(theta); y4 = var1 + r * sin(theta);
        %remember to multiply every cos&sin with the radius!!
    A_orange = [1, 0.6471, 0.3098];
    
    switch light
        case 'r'
            fill(x1, y1, 'r', 'EdgeColor', 'r');
            fill(x3, y3, 'r', 'EdgeColor', 'r');
            fill(x2, y2, 'g', 'EdgeColor', 'g');
            fill(x4, y4, 'g', 'EdgeColor', 'g');
        case 'o'
            fill(x1, y1, A_orange, 'EdgeColor', A_orange);
            fill(x3, y3, A_orange, 'EdgeColor', A_orange);
            fill(x2, y2, A_orange, 'EdgeColor', A_orange);
            fill(x4, y4, A_orange, 'EdgeColor', A_orange);
        case 'g'
            fill(x1, y1, 'g', 'EdgeColor', 'g');
            fill(x3, y3, 'g', 'EdgeColor', 'g');
            fill(x2, y2, 'r', 'EdgeColor', 'r');
            fill(x4, y4, 'r', 'EdgeColor', 'r');
    end

    %plot the cars
    for j1 = 1:n1
        rectangle('Position', [car_right(j1).position (3.375+0.25*w) car_right(j1).length 0.25], ...
            'FaceColor', [1,0.5490,0.4118], 'EdgeColor', [1,0.5490,0.4118])
    end
    for j2 = 1:n2
        rectangle('Position', [(3.375-0.25*w) car_top(j2).position 0.25 car_top(j2).length], ...
            'FaceColor', [0.6236,0.4745,0.9333], 'EdgeColor', [0.6236,0.4745,0.9333]);
    end
    for j3 = 1:n3
        rectangle('Position', [car_left(j3).position (3.375-0.25*w) car_left(j3).length 0.25], ...
            'FaceColor', [0.5294,0.8078,1], 'EdgeColor', [0.5294,0.8078,1]);
    end
    for j4 = 1:n4
        rectangle('Position', [(3.375+0.25*w) car_bottom(j4).position 0.25 car_bottom(j4).length], ...
            'FaceColor', [1,0.9255,0.5451], 'EdgeColor', [1,0.9255,0.5451]);
    end
        
        %IF CRASH
        %BREAK
        %END
end