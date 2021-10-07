%% Empirical Success Prob form Bernoulli RV
% k = {0, 1, ... ,n}

function P_E = empirical_success_prob(iter, p)    
    X = zeros(1, 2);
    x = rand(1, iter);
    
    for i = 1:iter
        if x(i) >= p
            X(2) = X(2) + 1;
        else
            X(1) = X(1) + 1;
        end
    end
    
    P_E = X(1)/iter;
end