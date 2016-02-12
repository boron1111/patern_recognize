function F=extractFeatureFromSeries(chars)
% 从一系列图片中提取特征

numOfSamples=size(chars,3);
% F=zeros(size(chars,1)*size(chars,2),numOfSamples);
for id=1:numOfSamples
    F(:,id)=extractFeature(chars(:,:,id));
end