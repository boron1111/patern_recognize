function feature_d=pcaDecreaseDim(feature_o)
% ʹ��pca��feature���н�ά
% ����feature_o ԭʼ����������
% ����ֵfeature_d ��ά�����������

pc=princomp(feature_o');
pc=pc(:,1:5);
feature_d=feature_o'*pc;
feature_d=feature_d';