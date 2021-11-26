%% HW #1 
% input data
x = [3 5 6 8 9 11];
y = [2 3 4 6 5 8];

%% Calculated optimal estimation a and b
% wherer y = a + bx
R = corrcoef(x,y);
rho = R(2);

optimal_b = rho*sqrt(var(y))/sqrt(var(x));
optimal_a = mean(y) - rho*sqrt(var(y))*mean(x)/sqrt(var(x));

%% plot
t = [3:0.1:11];
figure(1); hold on;
scatter(x,y); plot(t, t*optimal_b + optimal_a);
xlabel('x'); ylabel('y');
legend('scatter', 'linear regreesion', 'location', 'northwest'); grid on;