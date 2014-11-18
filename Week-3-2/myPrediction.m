function [accuracy, theta] = myPrediction (X, y, theta, lambda)

	% Set Options
	options = optimset ('GradObj', 'on', 'MaxIter', 400);
	
	% Optimize
	[theta, J, exit_flag] = fminunc (@(t)(costFunctionReg(t, X, y, lambda)), theta, options);
	
	fprintf ('fminunc exit status = %d\n', exit_flag);
	
%	% Plot Boundary
%	plotDecisionBoundary(theta, X, y);
%	hold on;
%	title(sprintf('lambda = %g', lambda))
%	
%	% Labels and Legend
%	xlabel('Microchip Test 1')
%	ylabel('Microchip Test 2')
%	
%	legend('y = 1', 'y = 0', 'Decision boundary')
%	hold off;
	
	% Compute accuracy on our training set
	p = predict(theta, X);
	accuracy = mean(double(p == y)) * 100;
	
	fprintf('Train Accuracy: %f\n', accuracy);
	
end

