dataFileName = 'headlineFeatureData.mat'; % Should contain 2 variables:
                                          % X - array of feature vectors for headlines in data
                                          % y - vector of 0s (not sarcastic) and 1s (is sarcastic)

% Load headline feature data
load(dataFileName);

% Split headline data into training and testing sets (70/30 split)
numHeadlines = length(y);
numTrainingHeadlines = round(numHeadlines*0.7);
X_train = X(1:numTrainingHeadlines,:);
y_train = y(1:numTrainingHeadlines);
X_test = X(numTrainingHeadlines+1:end,:);
y_test = y(numTrainingHeadlines+1:end);

% Train model
C = 0.1;
model = svmTrain(X_train, y_train, C, @linearKernel);

p = svmPredict(model, X_train);


