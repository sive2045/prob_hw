t = linspace(0, 3, 500);
tau = 0.3;
x = zeros(1, length(t));
abs_diff = abs(t-round(t));

idx1 = find(abs_diff <= tau);
idx2 = find(abs_diff > tau);

x(idx1) = 1;
x(idx2) = -1;

f = 5;
phase = zeros(1, length(t));
phase(idx1) = 0;
phase(idx2) = pi;

y = cos(2*pi*f*t + phase);

figure(1)
subplot(211)
plot(t, x, 'b-');
xlabel('t [sec]'); ylabel('x(t)'); grid on; ylim([-1.1, 1.1]);

subplot(212)
plot(t, y, 'r-');
xlabel('t [sec]'); ylabel('y(t)'); grid on;