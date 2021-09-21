%% HW 3
% 이충녕, 2019144027

x = 0:1:5;
y = 3:3:18;

%% z

z = zeros(1, length(x) + length(y));
for idx = 1:(length(x)+length(y))
    if rem(idx, 2) == 1
        z(idx) = x(fix(idx/2)+1);
    else
        z(idx) = y(fix(idx/2));
    end
end