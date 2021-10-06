%% HW #3
% Compare Binomial RV PMF with Poisson RV PMF

%% Generate RV
n_1 = 20; p_1 = 0.2;
n_2 = 50; p_2 = 0.02;

% Binomial RV
B_20 = zeros(1,10);
B_50 = zeros(1,10);

for k = 1:10
    B_20(k) = nchoosek(n_1, k)*p_1^k*(1-p_1)^(n_1-k);
    B_50(k) = nchoosek(n_2, k)*p_2^k*(1-p_2)^(n_2-k);
end

% Poisson RV
P_20 = zeros(1,10);
P_50 = zeros(1,10);

alpha_1 = n_1*p_1;
alpha_2 = n_2*p_2;

for k = 1:10
    P_20(k) = alpha_1^k*exp(-alpha_1)/factorial(k);
    P_50(k) = alpha_2^k*exp(-alpha_2)/factorial(k);
end

%% Plot 

subplot(1,2,1);
hold on;
bar(B_20); stem(P_20);
title('Approximation'); xlabel('k'); ylabel('P[X=k]');
legend('Binomial PMF', 'Poisson PMF'); grid on; hold off;

subplot(1,2,2);
hold on;
bar(B_50); stem(P_50);
title('Approximation'); xlabel('k'); ylabel('P[X=k]');
legend('Binomial PMF', 'Poisson PMF'); grid on; hold off;