%% HW_2

x = [0:1:5]; y = [0:1:5];
[X,Y] = meshgrid(x,y);
P_xy = zeros(6,6);

P_xy(2,3) = 0.02; P_xy(2,5) = 0.10; P_xy(2,6) = 0.08;
P_xy(4,3) = 0.08; P_xy(4,5) = 0.32; P_xy(4,6) = 0.40;

%idx = find(P_xy == 0);
%P_xy(idx) = NaN;

%% plot
stem3(Y,X, P_xy);
xlim([0 4]); ylim([0 6]);
title('Joint PFM'); xlabel('X=x'); ylabel('Y=y'); zlabel('P_{XY}'); 

%% calculate

% Marginal PMF
PMF_x = zeros(1,6); PMF_y = zeros(1,6);

for i = 1:6
    for j = 1:6
        PMF_x(i) = PMF_x(i) + P_xy(i,j);
        PMF_y(i) = PMF_y(i) + P_xy(j,i);
    end
end

% E[X], E[Y]
E_X = 0; E_Y = 0;

for k = 1:6
    E_X = E_X + (k-1)*PMF_x(k);
    E_Y = E_Y + (k-1)*PMF_y(k);
end

% Var[X], Var[Y]
E_X2 = 0 ; E_Y2 = 0;

for k = 1:6
    E_X2 = E_X2 + (k-1)^2*PMF_x(k);
    E_Y2 = E_Y2 + (k-1)^2*PMF_y(k);
end

varX = E_X2 - E_X^2;
varY = E_Y2 - E_Y^2;

% P[XY <6]
P_XY_6 = P_xy(2,3) + P_xy(2,5) + P_xy(2,6) + P_xy(4,3);

% P[X=Y]
P_X_Y = 0;

for i = 1:6
    P_X_Y = P_X_Y +  P_xy(i,i);
end

% E[XY]
E_XY = 0;

for i = 1:6
    for j = 1:6
        E_XY = E_XY + (i-1)*(j-1)*P_xy(i,j);
    end
end

% E[(X-3)(Y-2)]
E_vii = 0;

for i = 1:6
    for j = 1:6
        E_vii = E_vii + (i-1-3)*(j-1-2)*P_xy(i,j);
    end
end

% E[X(Y^3-11Y^2+38Y)]
E_viii = 0;

for i = 1:6
    for j = 1:6
        E_viii = E_viii + (i-1)*((j-1)^3-11*(j-1)^2+38*(j-1))*P_xy(i,j);
    end
end

% Cov(X,Y) = E[(X-E[X])(Y-E[Y])]
Cov_XY = 0;

for i = 1:6
    for j = 1:6
        Cov_XY = Cov_XY + ((i-1)-E_X)*((j-1)-E_Y)*P_xy(i,j);
    end
end

% Rho(X,Y) = Cov(X,Y)/sqrt(Var[X]Var[Y])
Rho_XY = Cov_XY/sqrt(varX*varY);