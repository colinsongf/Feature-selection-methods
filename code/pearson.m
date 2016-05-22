% this function ranks the passed dataset on the pearson correlation index
% and return the new dataset

function pearsonData = pearson(data, labels)

[m, n] = size(data);
r = zeros(2, n);

for i = 1 : n
    feature = data(:, i);
    coeffmatrix = corrcoef(feature, labels);
    r(1,i) = coeffmatrix(2,1);
    r(2,i) = i;
end

pearsonData = zeros(m, n);
[~, feature] = sort(r(1,:), 'descend');
for i = 1 : n
    pearsonData(:,i) = data(:,feature(i));
end
