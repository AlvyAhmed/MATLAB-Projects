% load dataset
data=readtable('Weldingdataset.xlsx')

% convert Quality column to categorical

data.Quality=categorical(data.Quality);

% split data into features and labels

X = table2array(data(:,1:end-1)); %features
Y = data.Quality; %labels

% split the dataset into training and testing sets
... (80% training, 20% test)
    
split = 0.8;
idx = randperm(size(data,1));
trainIdx = idx(1:round(split*end));
testIdx = idx(round(split*end)+1:end);

X_train = X(trainIdx, :);
Y_train = Y(trainIdx, :);
X_test = X(testIdx, :);
Y_test = Y(testIdx, :);

% train the k-NN model
k = 5;
mdl = fitcknn(X_train, Y_train, 'NumNeighbors' k);

%predict on the test set

Y_pred = predict(mdl, X_test);

% Evaluate the model

accuracy = sum(Y_pred == Y_test)/numel(Y_test);
disp(['Accuracy: ' num2str(accuracy*100) '%'];

% plot the confusion matrix
confusionchart(Y_test, Y_pred);
