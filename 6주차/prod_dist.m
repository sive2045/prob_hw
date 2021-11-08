%% Xa * Xb 분포
clear; clc;

x = [-10:0.5:10]; y = [-10:0.5:10];
[X,Y] = meshgrid(x,y);
f = exp(-((X-2).^2 + (Y-4).^2)/2)/2*pi;

surf(X,Y,f)
