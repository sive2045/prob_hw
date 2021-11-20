%% HW #1

x1_100 = zeros(1,100); x2_100 = zeros(1,100);
x1_1000 = zeros(1,1000); x2_1000 = zeros(1,1000);
x1_10000 = zeros(1,10000); x2_10000 = zeros(1,10000);
x1_100000 = zeros(1,100000); x2_100000 = zeros(1,100000);
parfor idx = 1:100
    x1__100 = randn(1,100); x2__100 = randn(1,100);
    x1__1000 = randn(1,1000); x2__1000 = randn(1,1000);
    x1__10000 = randn(1,10000); x2__10000 = randn(1,10000);
    x1__100000 = randn(1,100000); x2__100000 = randn(1,100000);
    x1_100(idx) = sum(x1__100)/100; x2_100(idx) = sum(x2__100)/100;
    x1_1000(idx) = sum(x1__1000)/1000; x2_1000(idx) = sum(x2__1000)/1000;
    x1_10000(idx) = sum(x1__10000)/10000; x2_10000(idx) = sum(x2__10000)/10000;
    x1_100000(idx) = sum(x1__100000)/100000; x2_100000(idx) = sum(x2__100000)/100000;
end

%% plot
figure(1); 
subplot(2,2,1);
scatter(x1_100,x2_100); xlim([-0.4 0.4]); ylim([-0.4 0.4]);
title('n=100'); xlabel('x1'); ylabel('x2'); grid on;
subplot(2,2,2);
scatter(x1_1000,x2_1000); xlim([-0.4 0.4]); ylim([-0.4 0.4]);
title('n=1000'); xlabel('x1'); ylabel('x2'); grid on;
subplot(2,2,3);
scatter(x1_10000,x2_10000); xlim([-0.4 0.4]); ylim([-0.4 0.4]);
title('n=10000'); xlabel('x1'); ylabel('x2'); grid on;
subplot(2,2,4);
scatter(x1_100000,x2_100000); xlim([-0.4 0.4]); ylim([-0.4 0.4]);
title('n=100000'); xlabel('x1'); ylabel('x2'); grid on;