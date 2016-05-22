clear
datasets = {'penglung';'pengcolon'; 'penglymp';'pengleuk';'pengnci9'};

[nDataset, ~] = size(datasets);
nMethod = 4;

accuracy = zeros(nDataset, nMethod);
usedFeatures= zeros(nDataset, nMethod);
sd= zeros(nDataset, nMethod);
d = 10;
predictorErr = zeros(1,d);

for i = 1 : nDataset
    load(char(datasets(i)));
    for j = 1 : nMethod
        if j == 1
            rankedData = pearson(data, labels);
        elseif j == 2
            rankedData = MI(data, labels);
        elseif j==3
            rankedData = chi2(data, labels);
        elseif j==4
            mysampler = sampler(data, labels);
            for k = 1 : d
                [tr, te] = mysampler.split(k,d);
                model = knn();
                model = model.train(tr.data, tr.labels);
                predictorErr(k) = model.test(te.data, te.labels).err();
            end
            accuracy(i,4) = 1- min(mean(predictorErr));
            sd(i,4) = std(predictorErr);
        end
        if j ~= 4
            [BestAccuracy, numberOfFeatures, standDev] = foldCross(rankedData, labels);
            accuracy(i,j) = BestAccuracy;
            usedFeatures(i,j) = numberOfFeatures;
            sd(i,j) = standDev;
        end
    end
end

h = bar(accuracy,'DisplayName','res');
set(gca, 'XTickLabel',datasets, 'XTick',1:numel(datasets));
grid on
l = {'pearson';'MI';'chi2';'Full Dataset'};
legend(h,l);
ylabel('accuracy');
xlabel('dataset');
title('accuracy tested using 10 fold cross validation');
