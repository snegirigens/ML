function [J, deriv] = costAndDeriv (X, Y, theta)

	J = costFunc (X, Y, theta);
	deriv = derivative (X, Y, theta);
	
end