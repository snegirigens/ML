close all; clear; clc;

data = load ('ex1data1.txt');

X = data (:,1);
Y = data (:,2);

%plot (X, Y, 'rx', 'MarkerSize', 4);
%xlabel ('Population of City');
%ylabel ('Profit in $');
%
%hold off;


X = [ones(size(X, 1), 1), X];

alphas = [0.001, 0.003, 0.01];
colors = ['r-', 'b-', 'y-', 'g-', 'k-'];

for i = 1 : length(alphas),
	alpha = alphas(i);
	color = 'r-';
	
	theta = zeros (size (X, 2), 1);
		
	[theta, costHist] = gradientDesc (X, Y, theta, alpha, 1500);

	J = costFunc (X, Y, theta);
	printf ('Alpha = %f. Cost = %f with \n', alpha, J);
	theta

	figure;
	plot (costHist, color);
end;

H = X * theta;			% [-3.6303; 1.1664]
plot (X(:,2), H);

prediction1 = [1, 3.5]  * theta;
prediction2 = [1, 7.0]  * theta;
prediction3 = [1, 23.0] * theta;

printf ('Prediction for city with population 35,000  is %f\n', prediction1 * 10000);		% 0.451977
printf ('Prediction for city with population 70,000  is %f\n', prediction2 * 10000);		% 4.534245
printf ('Prediction for city with population 230,000 is %f\n', prediction3 * 10000);		% 23.196043

%plot ([3.5; 7.0; 23], [prediction1; prediction2; prediction3], 'k+', 'MarkerSize', 7);
%hold off;
