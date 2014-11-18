function theta = normalEq (X, Y, theta)

	theta = pinv (X'*X) * X' * Y;
	
end