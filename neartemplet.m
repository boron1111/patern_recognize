function y=neartemplet(totalSample,test)
% 3.2.1的程序代码，用test与totalSample的特征逐个匹配，寻找最相似的
% 原书中的程序将样本库分为10个，每个库中有样本若干，本程序将样本库合成一个。
% 原书中程序是返回最相似的，此程序改为返回全体的距离

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