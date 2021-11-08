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

sumX = Na + Nb;
sumX_pdf = sumX/sample/interval;
sumX_pdf = sumX_pdf/2;

prodX = Na.*Nb;
prodX_pdf = prodX/sample/interval;
prodX_pdf = prodX_pdf/1000;

Na_pdf = Na/sample/interval;
Nb_pdf = Nb/sample/interval;
Nc_pdf = Nc/sample/interval;

Na_cdf = cumsum(Na_pdf)*interval;
sumX_cdf = cumsum(sumX_pdf)*interval;
prodX_cdf = cumsum(prodX_pdf)*interval;

%% plot Xa, Xb, Xc's PDF
figure(1); hold on; 
stairs(x(1:length(x)-1), Na_pdf, 'r');
stairs(x(1:length(x)-1), Nb_pdf, 'g'); 
stairs(x(1:length(x)-1), Nc_pdf, 'blue');
title('Normal Distribution(1,000,000 sampling)')
ylabel('PDF'); xlabel('x');
legend('X_{a} ~ N(2,1)', 'X_{b} ~ N(4,1)', 'X_{c} ~ N(-2,1)', 'Location','northwest');
hold off;

figure(2);
stairs(x(1:length(x)-1), prodX_pdf);