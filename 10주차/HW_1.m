%% HW #1
% X and Y are Gaussian RVs
% plot joint PDF of X and Y,
% where correlation 0, -0.8, 0.8

x = [-3:0.1:3]; y = [-3:0.1:3];

[X, Y] = meshgrid(x,y);
F_0 = exp(-(X.^2 -2*0*X.*Y + Y.^2)/(2*(1-0^2)))/(2*pi*sqrt(1-0^2));
F_negative = exp(-(X.^2 -2*(-0.8)*X.*Y + Y.^2)/(2*(1-(-0.8)^2)))/(2*pi*sqrt(1-(-0.8)^2));
F_positive = exp(-(X.^2 -2*0.8*X.*Y + Y.^2)/(2*(1-0.8^2)))/(2*pi*sqrt(1-0.8^2));

%% plot

% rho = 0
figure(1)
surf(X,Y,F_0)
xlim([-3 3]); ylim([-3 3]);
xlabel('X'); ylabel('Y'); zlabel('f_{XY}')
title('\rho = 0');

figure(2)
contour(X,Y,F_0)
xlabel('X'); ylabel('Y'); 
title('\rho = 0'); colorbar; grid on;

% rho = -0.8
figure(3)
surf(X,Y,F_negative)
xlim([-3 3]); ylim([-3 3]);
xlabel('X'); ylabel('Y'); zlabel('f_{XY}')
title('\rho = -0.8');

figure(4)
contour(X,Y,F_negative)
xlabel('X'); ylabel('Y'); 
title('\rho = -0.8'); colorbar; grid on;

% rho = 0.8
figure(5)
surf(X,Y,F_positive)
xlim([-3 3]); ylim([-3 3]);
xlabel('X'); ylabel('Y'); zlabel('f_{XY}')
title('\rho = 0.8');

figure(6)
contour(X,Y,F_positive)
xlabel('X'); ylabel('Y'); 
title('\rho = 0.8'); colorbar; grid on;
