function y=neartemplet(totalSample,test)
% 3.2.1�ĳ�����룬��test��totalSample���������ƥ�䣬Ѱ�������Ƶ�
% ԭ���еĳ����������Ϊ10����ÿ���������������ɣ�������������ϳ�һ����
% ԭ���г����Ƿ��������Ƶģ��˳����Ϊ����ȫ��ľ���

y=zeros(size(totalSample,3),1);
min=[inf 0];
feature_test=extractFeature(test);
for id=1:size(totalSample,3)
    feature_template=extractFeature(totalSample(:,:,id));
    d=sqrt(sum(feature_test-feature_template).^2);
    if min(1)>d
        min=[d id];
    end
    y(id)=d;
end
% y=min(2);
figure;imshow(test);
figure;imshow(totalSample(:,:,min(2)));
figure;plot(y)