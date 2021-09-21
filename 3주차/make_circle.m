%% Make circle function
% 이충녕, 2019144027
% input parameters : (x, y), r
% return X, Y

function [X, Y] = make_circle(x, y, r)
    theta = linspace(0,2*pi);
    X = r*cos(theta) + x;
    Y = r*sin(theta) + y;
end