function y=euclid(classifiedTotalSample,test)
% 3.2.3的程序。基于欧几里德距离求各类的中心，通过计算待测样品到中心的距离来判断
% 参数classifiedTotalSample 按字符分过类的图像样品库，是一个cell类型，test 待测样品图像
% 返回值y 待测样品与样品库中各类的中心的距离

% % 求总体的PCA---------------------------
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
%     feature=pc'*feature;   %pca降维
    p(:,id)=mean(feature,2);  % 各种样品的中值点
end

dmin=[inf,0];
feature=extractFeature(test);
% feature=pc'*feature;   %pca降维
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