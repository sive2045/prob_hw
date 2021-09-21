%% HW 1
% 이충녕, 2019144027
% plot activation function

x = -2:0.01:2;

%% Sigmoid function

sig = 1 ./ (1 + exp(-x));

%% Step function

step = x >= 0;

%% ReLU function

ReLU = max(x,0);

%% Plot functions

figure(1)
plot(x, sig, 'k', x, step, '--b', x, ReLU, '-.r');
legend('Sigmoid function', 'Step function', 'ReLU function', 'Location', 'northwest');
xlabel('x'); ylabel('h(x)'); grid on;