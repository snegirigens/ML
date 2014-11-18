clear ; close all; clc

%% Load Data
data = load('ex2data2.txt');
X = data(:, [1, 2]); 
y = data(:, 3);

% Add Polynomial Features
X = mapFeature (X(:,1), X(:,2));	% Note that mapFeature also adds a column of ones for us

% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

lambda = [0, 0.5, 1, 5, 10, 100, 150];
accuracy = zeros (length (lambda));

for i = 1:length (lambda),
	[accuracy(i), theta] = myPrediction (X, y, initial_theta, lambda(i));
end;

plot (lambda, accuracy);
