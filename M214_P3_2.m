%% Problem 2 Bolt data
boltTime = [0.0 0.01 1.1 3.0 4.0 4.5 5.4 5.8 6.2 6.5 6.9 7.3 7.7 8.0 8.3 8.6 8.8 9.4 9.69 13]';
boltDistance = [0.0 0.0 5.0 22.5 34.0 41.3 52.1 55.9 61.5 64.8 69.6 73.3 78.5 81.7 85.6 89.2 91.3 98.6 100 112]';

quadratic = 0.5 * boltTime .^ 2;
linear = boltTime;
constant = ones(20,1);
A = [quadratic linear constant];

parameters = (A' * A) \ (A' * boltDistance);
disp('Bolt parameters');
disp(parameters);

hold on;
title('Bolt data');
plot(boltTime, A*parameters);
scatter(boltTime, boltDistance, 'filled');

%% Problem 2 Thompson data
thompTime = [0.0 0.01 1.1 3.0 4.0 4.5 5.4 5.8 6.2 6.5 6.9 7.3 7.7 8.0 8.3 8.6 8.8 9.4 9.89 13]';
thompDistance = [0.0 0.0 4.9 22.6 34.0 41.1 51.3 55.3 60.8 63.9 68.5 72.1 77.1 79.9 83.8 87.5 89.4 96.4 100 112]';

quadratic = 0.5 * thompTime .^ 2;
linear = thompTime;
constant = ones(20,1);
A = [quadratic linear constant];

parameters = (A' * A) \ (A' * thompDistance);
disp('Thompson parameters:')
disp(parameters);

figure;
title('Thompson data');
hold on;
plot(thompTime, A*parameters);
scatter(thompTime, thompDistance, 'filled');

%% Problem 2 part 3
boltTime = [0.0 0.01 1.1 3.0 4.0 4.5 5.4]';
boltDistance = [0.0 0.0 5.0 22.5 34.0 41.3 52.1]';

quadratic = 0.5 * boltTime .^ 2;
linear = boltTime;
constant = ones(7,1);
A = [quadratic linear constant];

parameters = (A' * A) \ (A' * boltDistance);
disp('Bolt limited parameters');
disp(parameters);

figure;
hold on;
title('Bolt limited data');
plot(boltTime, A*parameters);
scatter(boltTime, boltDistance, 'filled');

