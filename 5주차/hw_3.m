%% HW #3
% Compare Binomial RV PMF with Poisson RV PMF

%% Generate RV
n_1 = 20; p_1 = 0.2;
n_2 = 50; p_2 = 0.02;

% Binomial RV
B_20 = zeros(1,11);
B_50 = zeros(1,11);

for k = 1:11
    B_20(k) = nchoosek(n_1, k-1)*p_1^(k-1)*(1-p_1)^(n_1-k+1);
    B_50(k) = nchoosek(n_2, k-1)*p_2^(k-1)*(1-p_2)^(n_2-k+1);
end

% Poisson RV
P_20 = zeros(1,11);
P_50 = zeros(1,11);

alpha_1 = n_1*p_1;
alpha_2 = n_2*p_2;

for k = 1:11
    P_20(k) = alpha_1^(k-1)*exp(-alpha_1)/factorial(k-1);
    P_50(k) = alpha_2^(k-1)*exp(-alpha_2)/factorial(k-1);
end

%% Plot 

k = 0:10;
subplot(1,2,1);
hold on;
bar(k, B_20); stem(k, P_20);
title('Approximation'); xlabel('k'); ylabel('P[X=k]');
legend('Binomial PMF', 'Poisson PMF'); grid on; hold off;

subplot(1,2,2);
hold on;
bar(k, B_50); stem(k, P_50);
title('Approximation'); xlabel('k'); ylabel('P[X=k]');
legend('Binomial PMF', 'Poisson PMF'); grid on; hold off;