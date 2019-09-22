clearvars;
uiwait(msgbox({'Welcome, dear challenger, to the game of wisdom and luck - '; ...
    '/The Crossworld/!'; 'In this game, you will design your own mix of traffic light length, number of cars on the road, etc. to get the traffic moving.'}));
uiwait(msgbox('Now let us begin!'));

prompt = {'How many cars do you want at the crossroad?', ...
    'How wide do you want the road to be (in units)?', ...
    'What is your ideal probability (ranging from 0 to 1) of a car jumping the red light?'};
dlg_title = 'Basic Settings';
numlines = 1;
defAns = {'10', '1', '0'};
basicset = inputdlg(prompt,dlg_title,numlines,defAns);

prompt = {'How long do you want the green light to last (s)?', ...
    'How long do you want the orange light to last (s)?', ...
    'How long do you want the red light to last (s)?'};
dlg_title = 'Advanced Settings';
numlines = 1;
defAns = {'10', '3', '10'};
advset = inputdlg(prompt,dlg_title,numlines,defAns);
%%%%%%%%点叉和cancel都没用，function optimize

n_cars = str2num(basicset{1});
w = str2num(basicset{2});
p = str2num(basicset{3});
green = str2num(advset{1});
orange = str2num(advset{2});
red = str2num(advset{3});

%allocate cars to four lanes
N_cars = zeros(1, 4);
for i = 1:4
    randomList = randperm(n_cars, 1);
    while randomList > n_cars + i - 4 || randomList == 0
        randomList = randperm(n_cars, 1);
    end
        N_cars(i) = randomList;
        n_cars = n_cars - randomList;
end

%initialization
crash = false;
stop = [false, false, false, false];
clearflag = [false, false, false, false];
n = 1; n1 = 0; n2 = 0; n3 = 0; n4 = 0;
i = 0;
light = 'r';

crossCar = {};

while ~crash
    clf;
    
    %confirm the new position of the cars
    for j1 = 1:n1
        if (light == 'g' || light == 'o') && abs(car_right(j1).position - 4) < 0.05
            if rand(1, 1) > p
                stop(1) = true;
            elseif stop(1) == false
                crossCar = [crossCar car_right(j1).plate];
                car_right(j1).position = car_right(j1).position - 0.1;
            end
            if stop(1) == true
                clearflag(1) = true;
                break;
            end
        else
            car_right(j1).position = car_right(j1).position - 0.1;
        end
    end
    if ~clearflag(1)
        stop(1) = false;
    end
    clearflag(1) = false;
    for j2 = 1:n2
        if (light == 'r' || light == 'o') && abs(car_top(j2).position - 4) < 0.05 
            if rand(1, 1) > p
                stop(2) = true;
            elseif stop(2) == false
                crossCar = [crossCar car_top(j2).plate];
                car_top(j2).position = car_top(j2).position - 0.1;
            end
            if stop(2) == true
                clearflag(2) = true;
                break;
            end
        else
            car_top(j2).position = car_top(j2).position - 0.1;
        end
    end
    if ~clearflag(2)
        stop(2) = false;
    end
    clearflag(2) = false;
    for j3 = 1:n3
        if (light == 'g' || light == 'o') && abs(car_left(j3).position - 2.5) < 0.05 
            if rand(1, 1) > p
                stop(3) = true;
            elseif stop(3) == false
                crossCar = [crossCar car_left(j3).plate];
                car_left(j3).position = car_left(j3).position + 0.1;
            end
            if stop(3) == true
                clearflag(3) = true;
                break;
            end
        else
            car_left(j3).position = car_left(j3).position + 0.1;
        end
    end
    if ~clearflag(3)
        stop(3) = false;
    end
    clearflag(3) = false;
    for j4 = 1:n4
        if (light == 'r' || light == 'o') && abs(car_bottom(j4).position - 2.5) < 0.05 
            if rand(1, 1) > p
                stop(4) = true;
            elseif stop(4) == false
                crossCar = [crossCar car_bottom(j4).plate];
                car_bottom(j4).position = car_bottom(j4).position + 0.1;
            end
            if stop(4) == true
                clearflag(4) = true;
                break;
            end
        else
            car_bottom(j4).position = car_bottom(j4).position + 0.1;
        end
    end
    if ~clearflag(4)
        stop(4) = false;
    end
    clearflag(4) = false;
    
    %specify the static condition of light
    if mod(i,10*(green + 2*orange + red)) == 0
        light = 'r';
    elseif mod(i,10*(green + 2*orange + red)) == 10*green || ...
            mod(i,10*(green + 2*orange + red)) == 10*(green + orange + red)
        light = 'o';
        elseif mod(i,10*(green + 2*orange + red)) == 10*(green + orange)
        light = 'g';    
    end
    %remember to multiply EVERY DIVISOR by 1/0.1!!!
    
    %generate new cars
        if mod(i,10) == 0
            %disp(stop);
            if ~stop(1)
                if n1 <= N_cars(1) - 1 %not while!!
                    n1 = n1 + 1;
                    car_right(n1).position = 6.5;
                    car_right(n1).length = rand(1, 1) * 0.2 + 0.35;
                    car_right(n1).plate = plate();
                end
            end
            if ~stop(2)
                if n2 <= N_cars(2) - 1
                    n2 = n2 + 1;
                    car_top(n2).position = 6.5;
                    car_top(n2).length = rand(1, 1) * 0.2 + 0.35;
                    car_top(n2).plate = plate();
                end
            end
            if ~stop(3)
                if n3 <= N_cars(3) - 1
                    n3 = n3 + 1;
                    car_left(n3).position = 0;
                    car_left(n3).length = rand(1, 1) * 0.2 + 0.35;
                    car_left(n3).plate = plate();
                end
            end
            if ~stop(4)
                if n4 <= N_cars(4) - 1
                    n4 = n4 + 1;
                    car_bottom(n4).position = 0;
                    car_bottom(n4).length = rand(1, 1) * 0.2 + 0.35;
                    car_bottom(n4).plate = plate();
                end
            end
        end
    i = i + 1;
    
    crash = crashur(car_top, car_right, w) || crashul(car_top, car_left, w) ||...
        crashdr(car_bottom, car_right, w) || crashdl(car_bottom, car_left, w);
    
    plotrd(w, light, car_right, car_top, car_left, ...
        car_bottom, n1, n2, n3, n4) %renew 
    
    pause(0.1);
end

uiwait(msgbox({'Oops! Your car has been crashed. There is a list of cars who disobey the traffic rule'}));
for i = crossCar
    uiwait(msgbox(i));
end

function fail = crashur(caru, carr, w)
    for i = caru
        for j = carr
            if overlap((3.375-0.25*w), i.position, 0.25, i.length,...
                    j.position, (3.375+0.25*w), j.length, 0.25)
                fail = true;
                return;
            end
        end
    end
    fail = false;
end

function fail = crashul(caru, carl, w)
    for i = caru
        for j = carl
            if overlap((3.375-0.25*w), i.position, 0.25, i.length,...
                    j.position, (3.375-0.25*w), j.length, 0.25)
                fail = true;
                return;
            end
        end
    end
    fail = false;
end

function fail = crashdl(card, carl, w)
    for i = card
        for j = carl
            if overlap((3.375+0.25*w), i.position, 0.25, i.length,...
                    j.position, (3.375-0.25*w), j.length, 0.25)
                fail = true;
                return;
            end
        end
    end
    fail = false;
end

function fail = crashdr(card, carr, w)
    for i = card
        for j = carr
            if overlap((3.375+0.25*w), i.position, 0.25, i.length,...
                    j.position, (3.375+0.25*w), j.length, 0.25)
                fail = true;
                return;
            end
        end
    end
    fail = false;
end