%% HW #1 
% Theoretical Discrete Uniform RV

k = 1:10;
P_k = ones(1,length(k));
P_k = P_k*1/length(k);

%% Plot PMF

subplot(2,1,1);
stem(P_k, 'LineWidth', 2); 
title('PMF'); xlabel('k'); ylabel('P[X=k]'); ylim([0 0.3]);
grid on;

%% Plot CDF

CDF = cumsum(P_k);

subplot(2,1,2);
stairs(CDF, 'LineWidth', 2);
title('CDF'); xlabel('k'); ylabel('P[X=k]');
grid on;
