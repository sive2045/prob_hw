%% Exponentail's CDF

function Fx = exponentail_CDF(lambda, x)
    Fx = 1 - exp(-lambda*x);
end