function y=bayeserzhi(classifiedTotalSample,test)
% 4.5中的程序
% 使用基于二值数据的贝叶斯分类器进行手写识别
% 参数 classifiedTotalSample 分类的的样本图像
% test 待测样本图像
% 返回值 待测样品属于各类的概率

% 求先验概率
sum=0;
for id=1:length(classifiedTotalSample)
    sum=sum+size(classifiedTotalSample{id},3);
end
pw=zeros(length(classifiedTotalSample),1); % 先验概率
for id=1:length(classifiedTotalSample)
    pw(id)=size(classifiedTotalSample{id},3)/sum;
end

% 求类条件概率和后验概率
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