%% init value
clear; clc;
sample = 1000000; interval = 0.01;
x = [-10:interval:10]; eta = 0.01;

%% generate normal distbution
Nxa = normrnd(2,1, [1,sample]);
Nxb = normrnd(4,1, [1,sample]);
Nxc = normrnd(-2,1, [1,sample]);

Na = histcounts(Nxa, x);
Nb = histcounts(Nxb, x);
Nc = histcounts(Nxc, x);

Na_pdf = Na/sample/interval;
Nb_pdf = Nb/sample/interval;
Nc_pdf = Nc/sample/interval;

prodX = Na_pdf.*Nb_pdf;
prodX_pdf = prodX/sample/interval;
prodX_pdf = prodX_pdf*100000;

%
sumX = Nc_pdf + eta*prodX;
sumX_pdf = sumX/sample/interval;
sumX_pdf = sumX_pdf*10000;

sumX1 = Nc_pdf + 0.1*prodX;
sumX1_pdf = sumX1/sample/interval;
sumX1_pdf = sumX1_pdf*10000;

sumX2 = Nc_pdf + 0.3*prodX;
sumX2_pdf = sumX2/sample/interval;
sumX2_pdf = sumX2_pdf*10000;

sumX3 = Nc_pdf + 0.7*prodX;
sumX3_pdf = sumX3/sample/interval;
sumX3_pdf = sumX3_pdf*10000;
%

Na_cdf = cumsum(Na_pdf)*interval;
sumX_cdf = cumsum(sumX_pdf)*interval;
prodX_cdf = cumsum(prodX_pdf)*interval;

%% plot Xa, Xb, Xc's PDF
figure(1); hold on; grid on;
stairs(x(1:length(x)-1), Na_pdf, 'r');
stairs(x(1:length(x)-1), Nb_pdf, 'g'); 
stairs(x(1:length(x)-1), Nc_pdf, 'blue');
title("Normal Distribution Computed by 10^6 Samples")
ylabel('PDF'); xlabel('x');
legend('X_{a} ~ N(2,1)', 'X_{b} ~ N(4,1)', 'X_{c} ~ N(-2,1)', 'Location','northwest');
hold off;

%% plot Xa*Xb
figure(2); hold on; grid on;
title("Product of two Normal Distributions");
stairs(x(1:length(x)-1), prodX_pdf, 'm');
stairs(x(1:length(x)-1), Na_pdf, '-r');
stairs(x(1:length(x)-1), Nb_pdf, '-g'); 
ylabel('PDF'); xlabel('x');
legend('X_{a}X_{b}','X_{a} ~ N(2,1)', 'X_{b} ~ N(4,1)', 'Location','northwest');
hold off;

%% plot Xc + eta*Xa*Xb
figure(3); hold on; grid on;
title("X_{c} + \etaX_{a}X_{b}");
stairs(x(1:length(x)-1), sumX_pdf, 'r'); stairs(x(1:length(x)-1), sumX1_pdf, 'g');
stairs(x(1:length(x)-1), sumX2_pdf, 'b'); stairs(x(1:length(x)-1), sumX3_pdf, 'm');
legend('\eta=0.01', '\eta=0.1', '\eta=0.3', '\eta=0.7', 'Location','northwest');
ylabel('PDF'); xlabel('x');
hold off;