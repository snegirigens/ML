function J = costFunc (X, Y, theta)

	m = size (X, 1);
	H = X * theta;
	error = H - Y;
	J = (1 / (2 * m)) * error' * error;
	
end
