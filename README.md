# Feature-selection-methods

Matlab implementation of 3 methods for feature subset selection tested on 5 high dimensional datasets.

The code is divided in 6 files.

- pearson.m -> Pearson Correlation ranking
- MI.m -> Mutual information ranking
- chi2.m -> chi squared statistic ranking
- reducedDataset.m -> perform feature subset selection.
- foldCross.m  -> implement the 10 fold CV on a KNN classifier.
- main.m -> general structure + plot results

The results of the eperiments are represented in the following image.


![alt tag](https://raw.githubusercontent.com/giangi023/Feature-selection-methods/master/accuracy.png)
