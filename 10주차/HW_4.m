%% HW #3
% max distribution & min distribution

%% Empirical CDF
% generate RVs
rng(0,'twister');
start_point = -1; end_point = 1;
X = (end_point-start_point).*rand(1,10000) + start_point;

rng(1512,'twister');
Y = (end_point-start_point).*rand(1,10000) + start_point;

% X and Y CDF and PDF

empiricalMax = max(X,Y);
empiricalMin = min(X,Y);

% PDF & CDF
z = linspace(-1,1,1000);

% Max
countMax = histcounts(empiricalMax, z);
empiricalMaxPDF = countMax/10000/(z(2)-z(1));
empiricalMaxCDF = cumsum(empiricalMaxPDF)*(z(2)-z(1));

% Min
countMin = histcounts(empiricalMin, z);
empiricalMinPDF = countMin/10000/(z(2)-z(1));
empiricalMinCDF = cumsum(empiricalMinPDF)*(z(2)-z(1));

%% Theoretical CDF
theoreticalMaxCDF = ((z+1)/2).^2;
theoreticalMinCDF = 1 - ((1-z)/2).^2;

%% plot
% max CDF
figure(1);
hold on; grid on;
bar(z(1:1000-1), empiricalMaxCDF, 'b'); plot(z, theoreticalMaxCDF, 'r', 'LineWidth', 2);
legend('Empirical CDF', 'Theoretical CDF', 'location', 'northwest'); xlabel('z'); ylabel('CDF'); title("MAX(X,Y)'s CDF");
hold off;

% min CDF
figure(2);
hold on; grid on;
bar(z(1:1000-1), empiricalMinCDF, 'b'); plot(z, theoreticalMinCDF, 'r', 'LineWidth', 2);
legend('Empirical CDF', 'Theoretical CDF', 'location', 'northwest'); xlabel('z'); ylabel('CDF'); title("MIN(X,Y)'s CDF");
hold off;