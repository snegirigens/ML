%% Initialization
clear ; close all; clc

%% =========== Part 3: Train Linear SVM for Spam Classification ========
%  In this section, you will train a linear classifier to determine if an
%  email is Spam or Not-Spam.

% Load the Spam Email dataset
% You will have X, y in your environment
load('spamTrain.mat');

fprintf('\nTraining Linear SVM (Spam Classification)\n')
fprintf('(this may take 1 to 2 minutes) ...\n')

C = 0.1;
model = svmTrain(X, y, C, @linearKernel);
p = svmPredict(model, X);

fprintf('Training Accuracy: %f\n', mean(double(p == y)) * 100);

%% =================== Part 6: Try Your Own Emails =====================
files = cell(4, 1);
files{1} = 'MySpamSample1.txt';
files{2} = 'MyNonSpamSample1.txt';
files{3} = 'MyNonSpamSample2.txt';
files{4} = 'MyNonSpamSample3.txt';

for i = 1:length(files)
	filename = files{i};

	% Read and predict
	file_contents = readFile(filename);
	word_indices  = processEmail(file_contents);
	x             = emailFeatures(word_indices);
	p = svmPredict(model, x);

	fprintf('\nProcessed %s\n\nSpam Classification: %d\n', filename, p);
	fprintf('(1 indicates spam, 0 indicates not spam)\n\n');
end;
