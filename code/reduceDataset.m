%recuced the dataset to the specified number of feature
% and return the dataset
function reducedData =  reduceDataset(data, featureNumber)

    [m, ~] = size(data);
    reducedData = zeros(m, featureNumber);
    for i = 1 : featureNumber
        for j = 1 : m
            reducedData(j,i) = data(j,i);
        end

    end

end

