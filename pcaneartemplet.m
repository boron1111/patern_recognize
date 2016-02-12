function y=pcaneartemplet(totalSample,test)
% 3.3.2�еĳ��򣬽���PCA���ô�����Ʒ��ģ����е���Ʒƥ��
% ������totalSample ��Ʒ�������ͼ��test ������Ʒ��ͼ��
% ����ֵ y��������Ʒ��ģ����ģ��ľ��롣

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
% ����Ʒ��ʹ�����Ʒ�����ɷַ������н�ά
% ����ͬ��
% ����ֵpcapat pca֮�������������pcasamp ������Ʒ������������

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
