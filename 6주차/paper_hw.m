%% init value
sample = 1000000; interval = 0.01;
x = [-10:interval:10]; eta = 0.001;

%% generate normal distbution
Nxa = normrnd(2,1, [1,sample]);
Nxb = normrnd(4,1, [1,sample]);
Nxc = normrnd(-2,1, [1,sample]);

Na = histcounts(Nxa, x);
Nb = histcounts(Nxb, x);
Nc = histcounts(Nxc, x);

sumX = Na + Nb;
sumX_pdf = sumX/sample*2/interval;

prodX = Nc + eta*sumX;
prodX_pdf = prodX/sample*3/interval;

Na_pdf = Na/sample/interval;
Nb_pdf = Nb/sample/interval;

Na_cdf = cumsum(Na_pdf)*interval;

%% plot PDF
figure(1); hold on;
bar(x(1:length(x)-1), Na_pdf, 'r');
bar(x(1:length(x)-1), Nb_pdf, 'g'); 
hold off;

figure(2);
bar(x(1:length(x)-1), prodX_pdf);