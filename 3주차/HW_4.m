%% HW 4
% 이충녕, 2019144027

n = randi([1 10], 1,10000); % generated random integer

x = 1:10;
y = zeros(1,10);

%% count

for idx = 1:length(y)
    tmp = size(find(n==idx));
    y(idx) = tmp(2);
end

%% plot

stem(x, y); legend('# of each integer'); grid on;