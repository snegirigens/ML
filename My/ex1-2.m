close all; clear; clc;

data = load ('ex1data1.txt');

X = data (:,1);
Y = data (:,2);

plot (X, Y, 'rx', 'MarkerSize', 4);
xlabel ('Population of City');
ylabel ('Profit in $');

hold off;

X = [ones(size(X, 1), 1), X];
theta = zeros (size (X, 2), 1);
	
theta_grad = gradientDesc (X, Y, theta, alpha, 1500);
theta_norm = normalEq (X, Y, theta);

J_grad = costFunc (X, Y, theta_grad);
J_norm = costFunc (X, Y, theta_norm);

printf ('Gradient Descend:\nCost = %f with \n', J_grad);
theta_grad

printf ('Normal Equation:\nCost = %f with \n', J_norm);
theta_norm

plot (X(:,2), [X * theta_grad], 'b-');
plot (X(:,2), [X * theta_norm], 'r-');

prediction1 = [1, 3.5]  * theta_grad;
prediction2 = [1, 7.0]  * theta_grad;
prediction3 = [1, 23.0] * theta_grad;

printf ('Prediction for city with population 35,000  is %f\n', prediction1 * 10000);		% 0.451977
printf ('Prediction for city with population 70,000  is %f\n', prediction2 * 10000);		% 4.534245
printf ('Prediction for city with population 230,000 is %f\n', prediction3 * 10000);		% 23.196043

