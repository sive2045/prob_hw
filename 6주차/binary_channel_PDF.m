%% Binary Channel
% Y = X + N, 
% cal Y's PDF

b_0 = 0.7; b_1 = 1-b_0;
v = 3.0;

x = [-10:.1:10];

y = b_0*normpdf(x,-v,1) + b_1*normpdf(x,v,1);

plot(x,y);