%close all; 
clear; clc;

data = load ('ex1data1.txt');

X = data (:,1);
Y = data (:,2);

plot (X, Y, 'rx', 'MarkerSize', 4);
xlabel ('Population of City');
ylabel ('Profit in $');

hold on;

X = [ones(size(X, 1), 1), X];
theta = zeros (size (X, 2), 1);
	
theta_grad = gradientDesc (X, Y, theta, 0.01, 1500);
theta_norm = normalEq (X, Y, theta);
theta_opti = advOptim (X, Y, theta);

J_grad = costFunc (X, Y, theta_grad);
J_norm = costFunc (X, Y, theta_norm);
J_opti = costFunc (X, Y, theta_opti);

printf ('Gradient Descend:\nCost = %f with \n', J_grad);
theta_grad

printf ('Normal Equation:\nCost = %f with \n', J_norm);
theta_norm

printf ('Advanced Optimization:\nCost = %f with \n', J_opti);
theta_opti

plot (X(:,2), [X * theta_grad], 'b-');
plot (X(:,2), [X * theta_norm], 'r-');
plot (X(:,2), [X * theta_opti], 'g-');

pred1_grad = [1, 3.5]  * theta_grad;
pred1_norm = [1, 3.5]  * theta_norm;
pred1_opti = [1, 3.5]  * theta_opti;

printf ('Prediction for 35,000 using Gradient Descent is %f\n', pred1_grad * 10000);		% 0.451977
printf ('Prediction for 35,000 using Normal Equation  is %f\n', pred1_norm * 10000);		% 0.451977
printf ('Prediction for 35,000 using Advanced Optimization is %f\n', pred1_opti * 10000);		% 0.451977
printf ('\n');

pred2_grad = [1, 10]  * theta_grad;
pred2_norm = [1, 10]  * theta_norm;

%printf ('Prediction for 100,000 using Gradient Descent is %f\n', pred2_grad * 10000);		% 0.451977
%printf ('Prediction for 100,000 using Normal Equation  is %f\n', pred2_norm * 10000);		% 0.451977
%printf ('\n');

pred3_grad = [1, 24.5]  * theta_grad;
pred3_norm = [1, 24.5]  * theta_norm;
pred3_opti = [1, 24.5]  * theta_opti;

printf ('Prediction for 245,000 using Gradient Descent is %f\n', pred3_grad * 10000);		% 0.451977
printf ('Prediction for 245,000 using Normal Equation  is %f\n', pred3_norm * 10000);		% 0.451977
printf ('Prediction for 245,000 using Advanced Optimization is %f\n', pred3_opti * 10000);		% 0.451977

plot ([3.5, 10, 24.5], [pred1_grad, pred2_grad, pred3_grad], 'bo', 'MarkerSize', 2);
plot ([3.5, 10, 24.5], [pred1_norm, pred2_norm, pred3_norm], 'ro', 'MarkerSize', 2);
