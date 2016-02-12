function y=pcaneartemplet(totalSample,test)
% 3.3.2中的程序，进行PCA后让待测样品与模板库中的样品匹配
% 参数：totalSample 样品库的所有图像，test 待测样品的图像
% 返回值 y，待测样品与模板库各模板的距离。

[pcapat,pcasamp]=pcapro(totalSample,test);
min=[inf,0];
y=zeros(size(totalSample,3),1);
for id=1:size(totalSample,3)
    d=sqrt(sum(pcapat(:,id)-pcasamp).^2);
    if min(1)>d
        min=[d id];
    end
    y(id)=d;
end
figure;imshow(test);
figure;imshow(totalSample(:,:,min(2)));
figure;plot(y);

function [pcapat,pcasamp]=pcapro(totalSample,test)
% 对样品库和待测样品用主成分分析进行降维
% 参数同上
% 返回值pcapat pca之后的主分量矩阵，pcasamp 待测样品的主分量矩阵

mixedsig=extractFeatureFromSeries(totalSample);
dim=size(mixedsig,1);
disg_cov=cov(mixedsig');
[pc,latent]=pcacov(disg_cov);
temp=0;
con=0;
m=0;
sum2=sum(latent);
for id=1:dim
    if con<0.9
        temp=temp+latent(id);
        con=temp/sum2;
        m=m+1;
    else
        break;
    end
end
pc(:,m+1:end)=[];
test=extractFeature(test);
x=test'*pc;
y=mixedsig'*pc;
pcapat=y';
pcasamp=x';
