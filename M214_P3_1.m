%% Problem 1 part 1
[month, day, year, temp] = textread('MIDETROI.txt', '%d %d %d %f','whitespace', ' ');
x = (0:7962)';
constantTerm = ones(7963, 1);
cosineTerm = cos((2 * pi * x) / (365.25));
sineTerm = sin((2 * pi * x) / (365.25));
A = [constantTerm cosineTerm sineTerm];
coeffs = (A' * A) \ (A' * temp);
disp('Temperature model parameters:');
disp(coeffs);

% Plot model against actual data
hold on;
title('Model using A + Bcos(x) + Csin(x)');
plot(x, A * coeffs, 'LineWidth', 2);
scatter(x, temp, 1);


%% Problem 1 part 2
% minIdx is the coldest day of the year
[minVal, minIdx] = min(A(1:366, :) * coeffs);
disp('Index of minimum value from model');
disp(minIdx);

%% Problem 1 part 3
warmingTerm = x;
A = [constantTerm cosineTerm sineTerm warmingTerm];
coeffs = (A' * A) \ (A' * temp);
disp('Temperature model parameters with global warming:');
disp(coeffs);

% Plot global warming model against actual data
figure;
title('Model using A+Bcos(x) = Csin(x) + Dx');
hold on;
plot(x, A * coeffs, 'LineWidth', 2);
scatter(x, temp, 1);