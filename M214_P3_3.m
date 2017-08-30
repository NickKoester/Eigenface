%% Problem 3 model Detroit population over time
time = (0:19)';
population = [1422 2222 9102 21019 45619 79577 116340 205876 285704 465766 993678 1568662 1623452 1849568 1670144 1511482 1203339 1027974 951270 713777]';

cubic = time .^ 3;
quadratic = time .^2;
linear = time;
constant = ones(20,1);
A = [cubic quadratic linear constant];

parameters = (A' * A) \ (A' * population);
disp('Parameters');
disp(parameters);

hold on;
title('Detroit population model');
plot(time, A*parameters);
scatter(time, population, 'filled')
