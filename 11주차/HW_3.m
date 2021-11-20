%% HW #3
% Bernoulli RV's generated
p = 0.5;
f=@(p,k) (k ==1).*p + (k==0).*(1-p);
pmf_v = f(p,[0 1]);
cdf_v = cumsum(pmf_v);

sample = 100000;

%% n = 5
len = 500;
x = linspace(0,5,len);

%empirical 
emp_x = zeros(5, sample);
for idx = 1:5
    U = rand(1,sample);
    emp_x(idx,:) = U>cdf_v(1);
end

emp_sum = sum(emp_x);
N= histcounts(emp_sum, x);
emp_PDF = N/sample/x(2);
emp_CDF = cumsum(emp_PDF)*x(2);

%approximation
normal_CDF = normcdf(x(1:len-1),5*0.5,sqrt(5)*0.5);

% plot
figure(1); hold on;
plot(x(1:len-1), emp_CDF, 'r', 'LineWidth', 1.5); plot(x(1:len-1), normal_CDF, '--b', 'LineWidth', 1.5);
xlabel('x'); ylabel('CDF'); ylim([0 1]);
legend("Sum of 5 Bernoulli Rv's", 'Gaussian CDF', 'location', 'southeast');
grid on; hold off;

%% n = 25
len = 2500;
x2 = linspace(0,25,len);

%empirical 
emp_x = zeros(25, sample);
for idx = 1:25
    U = rand(1,sample);
    emp_x(idx,:) = U>cdf_v(1);
end

emp_sum = sum(emp_x);
N= histcounts(emp_sum, x2);
emp_PDF = N/sample/x2(2);
emp_CDF = cumsum(emp_PDF)*x2(2);

%approximation
normal_CDF = normcdf(x2(1:len-1),25*0.5,sqrt(25)*0.5);

% plot
figure(2); hold on;
plot(x2(1:len-1), emp_CDF, 'r', 'LineWidth', 1.5); plot(x2(1:len-1), normal_CDF, '--b', 'LineWidth', 1.5);
xlabel('x'); ylabel('CDF'); ylim([0 1]);
legend("Sum of 25 Bernoulli Rv's", 'Gaussian CDF', 'location', 'southeast');
grid on; hold off;