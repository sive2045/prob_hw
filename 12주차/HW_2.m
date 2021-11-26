%% HW #2
p = [0:0.001:1];
entropy = -p.*cal_log(p) - (1-p).*cal_log(1-p);

figure(1)
plot(p, entropy); xlabel('p'); ylabel('H(p)'); 
legend('Entropy'); grid on;