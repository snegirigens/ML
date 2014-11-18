function [error_train, error_val] = learningCurve2(X, y, Xval, yval, lambda)

m = size(X, 1);

% You need to return these values correctly
error_train = zeros(m, 1);
error_val   = zeros(m, 1);

count = 50;

for i = 1 : m,
	err_t = zeros(count,1);
	err_v = zeros(count,1);

	for j = 1:count,
		indexes = randperm(m)(1:i);
		xi = X(indexes,:);
		yi = y(indexes);
	
		[theta] = trainLinearReg(xi, yi, lambda);
	
		err_t(j) = linearRegCostFunction(xi, yi, theta, 0);
		err_v(j) = linearRegCostFunction(Xval(indexes,:), yval(indexes), theta, 0);
	end;
	
	error_train(i) = mean(err_t);
	error_val(i) = mean(err_v);
end;

% =========================================================================

end
