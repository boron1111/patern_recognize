function y=bayeserzhi(classifiedTotalSample,test)
% 4.5�еĳ���
% ʹ�û��ڶ�ֵ���ݵı�Ҷ˹������������дʶ��
% ���� classifiedTotalSample ����ĵ�����ͼ��
% test ��������ͼ��
% ����ֵ ������Ʒ���ڸ���ĸ���

% ���������
sum=0;
for id=1:length(classifiedTotalSample)
    sum=sum+size(classifiedTotalSample{id},3);
end
pw=zeros(length(classifiedTotalSample),1); % �������
for id=1:length(classifiedTotalSample)
    pw(id)=size(classifiedTotalSample{id},3)/sum;
end

% �����������ʺͺ������
p=[];
for id=1:length(classifiedTotalSample)
    feature=extractFeatureFromSeries(classifiedTotalSample{id});
    feature=feature>0.05;
    feature=[feature ones(size(feature,1),1) zeros(size(feature,1),1)];
    p=[p mean(feature,2)];
end
feature=extractFeature(test);
feature=feature>0.05;

pxw=zeros(length(classifiedTotalSample),1);
for id=1:length(classifiedTotalSample)
    tmp=zeros(size(feature,1),1);
    tmp(feature==1)=p(feature==1,id);
    tmp(feature==0)=1-p(feature==0,id);
    pxw(id)=prod(tmp);
end
y=pxw.*pw;
figure;imshow(test);
figure;imshow(classifiedTotalSample{y==max(y)}(:,:,1));
figure;plot(y);