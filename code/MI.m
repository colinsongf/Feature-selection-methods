% this function ranks the passed dataset on the MI
% and return the new dataset

function miData = MI(data, labels)

    [m, n] = size(data);
    mutInfo = zeros(2, n);

    for i = 1 : n
        feature = data(:, i);
        mutInfo(1,i) = mi(feature, labels);
        mutInfo(2,i ) = i;
    end

    miData = zeros(m, n);
    [~, feature] = sort(mutInfo(1,:), 'descend');
    for i = 1 : n
        miData(:,i) = data(:,feature(i));
    end
end