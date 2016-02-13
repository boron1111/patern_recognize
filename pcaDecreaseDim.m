function feature_d=pcaDecreaseDim(feature_o)
% 使用pca对feature进行降维
% 参数feature_o 原始的特征矩阵
% 返回值feature_d 降维后的特征矩阵

pc=princomp(feature_o');
pc=pc(:,1:5);
feature_d=feature_o'*pc;
feature_d=feature_d';