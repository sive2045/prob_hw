%% HW #2
% Empirical Discrete Uniform RV

%% Generate RV

X = make_Uniform_RV(100000, 10);

%% Plot Histogram

subplot(3,1,1);
bar(X);
title('Histogram(10^5 samples)')
xlabel('k'); ylabel('# of smaples'); ylim([0, 20000]);

%% Plot PMF

% Theoretical PMF
k = 1:10;
P_k = ones(1,length(k));
P_k = P_k*1/length(k);

% Empirical PMF
empirical_P = zeros(1,10);
empirical_P = X / 100000;

subplot(3,1,2);
hold on; 
stem(P_k, 'r'); stem(empirical_P, 'b*'); title('PMF'); 
xlabel('k'); ylabel('P[X=k]'); ylim([0, 0.2]);
legend('Theoretical PMF', 'Empirical PFM', 'location', 'northwest');
grid on; hold off;

%% Plot CDF

% Theoretical CDF
CDF = cumsum(P_k);

% Empirical CDF
CDF_E = cumsum(empirical_P);

subplot(3,1,3);
hold on;
stem(CDF, 'r'); stem(CDF_E, 'b*'); title('CDF');
xlabel('k'); ylabel('P[X=k]'); ylim([0, 1]);
legend('Theoretical CDF', 'Empirical CDF', 'location', 'northwest');
grid on; hold off;
