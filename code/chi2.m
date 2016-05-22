function rankedData = chi2(data, labels)
[m, n] = size(data);
chi2Values = zeros(2, n);
pVal = zeros(1, n);

for i = 1 : n
    feature = data(:, i);
    [~,chi2,~] = crosstab(feature,labels);
    chi2Values(1,i) = chi2;
    chi2Values(2,i ) = i;
    pVal(i) = chi2;
end

rankedData = zeros(m, n);
[~, feature] = sort(chi2Values(1,:), 'descend');
for i = 1 : n
    rankedData(:,i) = data(:,feature(i));
end

% ecdf(pVal);
