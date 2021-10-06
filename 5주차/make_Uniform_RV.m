%% Make Uniform RV Function
% k = {1, 2, ... , n}

function X = make_Uniform_RV(size, n)
    %% make sub-intervals
    sub_idx = linspace(0,1,n+1);
    
    %% genrate RV
    X = zeros(1, n);
    x = rand(1, size);
    
    for i = 1:size
        for j = 1:n
            if x(i) > sub_idx(j) & x(i) <= sub_idx(j+1)
                X(j) = X(j)+1;
            end
        end
    end
end