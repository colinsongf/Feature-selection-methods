function [accuracy, newFeaturesNumber, sd] = foldCross(data, labels)

tic
numberOfFeatures = 200;% number of features we want to test
k = 10;% k- Fold cross validation parameter
predictorErr = zeros(k, numberOfFeatures);
validationError = zeros(1, numberOfFeatures);

model = knn();
% k-Fold cross validation test
for featuresNumber = 1 : numberOfFeatures
    reducedDataset = reduceDataset(data, featuresNumber);
    mysampler = sampler(reducedDataset, labels);
    for experiment = 1 : k
        [tr, te] = mysampler.split(experiment,k);
        model = model.train(tr.data, tr.labels);
        predictorErr(experiment, featuresNumber) = model.test(te.data, te.labels).err();
    end
    validationError(featuresNumber) = mean(predictorErr(:,featuresNumber) );
    
end

[minError, newFeaturesNumber] = min(validationError);
sd = std(validationError);
accuracy = 1 - minError;