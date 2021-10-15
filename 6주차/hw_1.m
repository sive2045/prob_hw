%% HW 1
% plot Exponetial RV X's PDF and CDF

sample = 1000;
x = linspace(0,5,sample);

f_1 = exponentail_PDF(1,x); F_1 = exponentail_CDF(1,x);
f_2 = exponentail_PDF(2,x); F_2 = exponentail_CDF(2,x);
f_3 = exponentail_PDF(3,x); F_3 = exponentail_CDF(3,x);

%% plot PDF
figure(1);
plot(x, f_1, 'k', x, f_2, 'b-.', x, f_3, 'r--'); title('PDF of Exponential RV');  grid on;
ylabel('PDF'); xlabel('x'); legend('\lambda = 1', '\lambda = 2', '\lambda = 3', 'location', 'northeast');

%% plot CDF
figure(2);
plot(x, F_1, 'k', x, F_2, 'b-.', x, F_3, 'r--'); title('CDF of Exponential RV'); grid on;
ylabel('CDF'); xlabel('x'); legend('\lambda = 1', '\lambda = 2', '\lambda = 3', 'location', 'northeast');