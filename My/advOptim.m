function [theta, J] = advOptim (X, Y, theta)

	options = optimset ('GradObj', 'on', 'MaxIter', 400);
	[theta, J] = fminunc (@(t)(costAndDeriv (X, Y, t)), theta, options); 
	
end