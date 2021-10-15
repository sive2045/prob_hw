%% HW 3

len = 1000; sample = 100000;
x = linspace(0,10,len);

%% Theoretical
theo_f_1 = exponentail_PDF(1,x);
theo_F_1 = exponentail_CDF(1,x);

%% Empirical RV
emp_y = rand(1, sample);
emp_x = -log(1-emp_y);

N= histcounts(emp_x, x);
emp_f_1 = N/sample/x(2);
emp_F_1 = cumsum(emp_f_1)*x(2);

%% plot PDF
figure(1);
subplot(2,1,1); hold on; grid on;
bar(x(1:len-1), emp_f_1, 'b'); plot(x, theo_f_1, 'r', 'LineWidth', 2);
legend('Empirical PDF', 'Theoretical PDF'); xlabel('x'); ylabel('PDF');
hold off;

%% plot CDF
subplot(2,1,2); hold on; grid on;
bar(x(1:len-1), emp_F_1, 'b'); plot(x, theo_F_1, 'r', 'LineWidth', 2); 
legend('Empirical CDF', 'Theoretical CDF'); xlabel('x'); ylabel('CDF');
hold off;

%% HW 4

lambda = 1;

Theo_AVG = 1/lambda
Theo_VAR = 1/lambda^2

Empi_AVG = sum(x(1:len-1).*emp_f_1) * x(2)
Empi_VAR = sum(x(1:len-1).^2.*emp_f_1) * x(2) - Empi_AVG^2