function y=euclid(classifiedTotalSample,test)
% 3.2.3�ĳ��򡣻���ŷ����¾������������ģ�ͨ�����������Ʒ�����ĵľ������ж�
% ����classifiedTotalSample ���ַ��ֹ����ͼ����Ʒ�⣬��һ��cell���ͣ�test ������Ʒͼ��
% ����ֵy ������Ʒ����Ʒ���и�������ĵľ���

for id=1:length(classifiedTotalSample)
    feature=extractFeatureFromSeries(classifiedTotalSample{id});
    p(:,id)=mean(feature,2);  % ������Ʒ����ֵ��
end

dmin=[inf,0];
feature=extractFeature(test);
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