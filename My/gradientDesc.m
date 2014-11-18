function [theta, costHist] = gradientDesc (X, Y, theta, alpha, iter)

	costHist = zeros(iter,1);
	
	for i = 1 : iter,
		theta = theta - alpha * derivative(X, Y, theta);
		costHist(i) = costFunc (X, Y, theta);
	end;
	
end