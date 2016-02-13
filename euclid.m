function y=euclid(classifiedTotalSample,test)
% 3.2.3�ĳ��򡣻���ŷ����¾������������ģ�ͨ�����������Ʒ�����ĵľ������ж�
% ����classifiedTotalSample ���ַ��ֹ����ͼ����Ʒ�⣬��һ��cell���ͣ�test ������Ʒͼ��
% ����ֵy ������Ʒ����Ʒ���и�������ĵľ���

% % �������PCA---------------------------
% feature=[];
% for id=1:length(classifiedTotalSample)
%     feature=[feature extractFeatureFromSeries(classifiedTotalSample{id})];
% end
% feature=[feature extractFeature(test)];
% pc=princomp(feature');
% pc=pc(:,1:5);
% % -----------------------------------------

for id=1:length(classifiedTotalSample)
    feature=extractFeatureFromSeries(classifiedTotalSample{id});
%     feature=pc'*feature;   %pca��ά
    p(:,id)=mean(feature,2);  % ������Ʒ����ֵ��
end

dmin=[inf,0];
feature=extractFeature(test);
% feature=pc'*feature;   %pca��ά
for id=1:length(classifiedTotalSample)
    d=sum((feature-p(:,id)).^2);
    if dmin(1)>d
        dmin=[d id];
    end
    y(id)=d;
end
figure;imshow(test);
figure;imshow(classifiedTotalSample{dmin(2)}(:,:,1));
figure;plot(y,'.-');