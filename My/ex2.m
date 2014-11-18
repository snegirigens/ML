close all; 
clear; clc;

data = load ('ex1data2.txt');

X = data (:,1:2);
Y = data (:,3);

plot (X(:,1), Y, 'rx', 'MarkerSize', 4);
xlabel ('Size of House');
ylabel ('Price in $');

hold on;

[X, mu, sigma] = scale (X);		% Scale features
X = [ones(size(X, 1), 1), X];
theta = zeros (size (X, 2), 1);
	
theta_grad = gradientDesc (X, Y, theta, 0.01, 2500);
theta_norm = normalEq (X, Y, theta);
theta_opti = advOptim (X, Y, theta);

J_grad = costFunc (X, Y, theta_grad);
J_norm = costFunc (X, Y, theta_norm);
J_opti = costFunc (X, Y, theta_opti);

printf ('Gradient Descend:\nCost = %f with \n', J_grad);
printf ('Theta = %f\n', theta_grad);

printf ('Normal Equation:\nCost = %f with \n', J_norm);
printf ('Theta = %f\n', theta_norm);

printf ('Advanced Optimization:\nCost = %f with \n', J_opti);
printf ('Theta = %f\n', theta_opti);

%plot (X(:,2), [X * theta_grad], 'b-');
%plot (X(:,2), [X * theta_norm], 'r-');
%plot (X(:,2), [X * theta_opti], 'g-');

toPredict = ([1650, 4] - mu) ./ sigma;

pred1_grad = [1, toPredict]  * theta_grad;
pred1_norm = [1, toPredict]  * theta_norm;
pred1_opti = [1, toPredict]  * theta_opti;

printf ('Prediction for 1650/4 house using Gradient Descent is %.2f\n', pred1_grad);		% 0.451977
printf ('Prediction for 1650/4 house using Normal Equation  is %.2f\n', pred1_norm);		% 0.451977
printf ('Prediction for 1650/4 house using Advanced Optimiz is %.2f\n', pred1_opti);		% 293081.45
printf ('\n');

%plot ([3.5, 10, 24.5], [pred1_grad, pred2_grad, pred3_grad], 'bo', 'MarkerSize', 2);
%plot ([3.5, 10, 24.5], [pred1_norm, pred2_norm, pred3_norm], 'ro', 'MarkerSize', 2);
