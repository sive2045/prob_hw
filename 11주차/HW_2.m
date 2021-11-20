%% HW #2
%% n = 5

len = 2500; sample = 100000;
x = linspace(0,25,len);

%empirical
emp_y = zeros(5,sample);
emp_x = zeros(5,sample);
for idx = 1:5
    emp_y(idx,:) = rand(1,sample);
    emp_x(idx,:) = -log(1-emp_y(idx,:));
end

emp_sum = sum(emp_x);
N= histcounts(emp_sum, x);
emp_PDF = N/sample/x(2);
emp_CDF = cumsum(emp_PDF)*x(2);

%approximation
normal_CDF = normcdf(x(1:len-1),5,sqrt(5));

% plot
figure(1); hold on;
plot(x(1:len-1), emp_CDF, 'r', 'LineWidth', 1.5); plot(x(1:len-1), normal_CDF, '--b', 'LineWidth', 1.5);
xlabel('x'); ylabel('CDF'); ylim([0 1]);
legend("Sum of 5 exponentail Rv's", 'Gaussian CDF', 'location', 'southeast');
grid on; hold off;

%% n = 50

len = 6000; sample = 100000;
x2 = linspace(20,80,len);

%empirical
emp_y = zeros(50,sample);
emp_x = zeros(50,sample);
for idx = 1:50
    emp_y(idx,:) = rand(1,sample);
    emp_x(idx,:) = -log(1-emp_y(idx,:));
end

emp_sum = sum(emp_x);
N= histcounts(emp_sum, x2);
emp_PDF = N/sample/(x2(2)-x2(1));
emp_CDF = cumsum(emp_PDF)*(x2(2)-x2(1));

%approximation
normal_CDF = normcdf(x2(1:len-1),50,sqrt(50));

% plot
figure(2); hold on;
plot(x2(1:len-1), emp_CDF, 'r', 'LineWidth', 1.5); plot(x2(1:len-1), normal_CDF, '--b', 'LineWidth', 1.5);
xlabel('x'); ylabel('CDF'); ylim([0 1]);
legend("Sum of 50 exponentail Rv's", 'Gaussian CDF', 'location', 'southeast');
grid on; hold off;