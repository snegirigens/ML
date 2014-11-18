function deriv = derivative (X, Y, theta)

	m = size (X, 1);
	H = X * theta;
	deriv = (1 / m) * X' * (H - Y);
	
end